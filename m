Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A708C77B7E
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.32142.1680384536712072405
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZVJgHLBq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101873eb92d53-bfedf496-c8a2-4238-beb7-5caa770f79e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=19ZcPmHXtGjmaFgNDmTzljlpt83dZghCVDzGWLfO138=;
	b=ZVJgHLBqu4T11vF7uZgckBG1d3WnJt+jdf7+fv2UIxGQ0HgtumcCxx7W2M62Q1QY
	tAug+2JpZHmlCVKMMraYGfxNufK04IJVBLicksIKoLPkJbtFE/knjGuz3U5PUAmWQhF
	wUNfYEjaCKdyQeZrqa7Homk2t+UFNgMnQAU2eVIo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=19ZcPmHXtGjmaFgNDmTzljlpt83dZghCVDzGWLfO138=;
	b=PV89SDmIfxE0IQa0gnvqLNPZRawCAGle0M86oQ9m+KrHNkII86XtfYFV1MgyYTfO
	aMQ+zZz70aAt20XVOHG6r/y1IhVpNpVmgt79/7Q/X5LzCrKavu2dSFO7cigxbS4pWYB
	n4LM8x4OuvsiOWomrHiynomCw9gfpQqEtNAx4jE4=
Content-Type: multipart/mixed; boundary="===============7688931720371554768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.8 SUCCEEDED
Message-ID: <010101873eb92d53-bfedf496-c8a2-4238-beb7-5caa770f79e3-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179555

--===============7688931720371554768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xserver-xorg* to *21.1.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.7-21.1.8.patch
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
--===============7688931720371554768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0895c5fa379371d6b80035610a0907d81f843871"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0895c5fa379371d6b80035610a0907d81f843871"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 38 Mirrors 0 Missed 64 Current 470 (37% match, 88% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 485 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.1289777
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 571 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1313 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1472 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1473 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1474 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1487 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 1488 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1578 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1582 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: Running task 1652 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1654 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1659 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running task 1717 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1760 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1775 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: Running task 1776 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1777 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: Running task 1778 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_fetch)
NOTE: Running task 1779 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_fetch)
NOTE: Running task 1794 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_write_rpm)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1795 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1796 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1797 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1798 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1799 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 1800 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1801 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1802 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1803 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: Running task 1804 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1805 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1806 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Started
NOTE: Running task 1807 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: Running task 1808 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 1809 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1810 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: Running task 1811 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_unpack)
NOTE: Running task 1812 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1813 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1814 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1815 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: Running task 1816 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: Running task 1817 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1818 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: Running task 1819 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1820 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1830 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: Running task 1842 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 1849 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1850 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1851 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1852 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: Running task 1853 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: Running task 1854 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1855 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1856 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1857 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1858 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1859 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1860 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Started
NOTE: Running task 1861 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1862 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1863 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1864 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1865 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1866 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1867 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1874 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_package_write_rpm)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 1875 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1876 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1877 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1878 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1879 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to efb4de3e5edb71ef4b5f21815c105f9ad6fd71806381ecd2a1e5cf14fe4aafc3
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1891 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: Running task 1894 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1895 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: Running task 1896 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: Running task 1897 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1898 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: Running task 1899 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 1901 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1902 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic)
NOTE: Running task 1903 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1904 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic unihash changed to 33f0a3a83683c68d3e346e87151277b6f5f7338e70df997ca7978cd7d33ece18
NOTE: Running task 1905 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1906 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7994dc0197a3d7f2ae99e629c620e5b799d87ecde32071472b49df20689399c2
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: Running task 1912 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 1913 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1916 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1919 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1920 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1921 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1922 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_install)
NOTE: Running task 1923 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1924 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1925 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1926 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1927 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1930 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1932 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1933 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1935 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1937 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1939 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1942 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1943 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1944 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1945 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1949 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1950 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1951 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1952 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1955 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1956 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1957 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1958 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1960 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1963 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1965 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1966 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1967 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1968 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1969 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1970 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: Running task 1972 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1974 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1975 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1976 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1977 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1978 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1980 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1981 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1983 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 1984 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1985 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1987 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1988 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1990 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1991 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1992 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 1993 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_write_rpm)
NOTE: Running task 1994 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1995 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_build)
NOTE: Tasks Summary: Attempted 1995 tasks of which 1824 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7688931720371554768==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.7-21.1.8.patch"

RnJvbSAxMDI3ZWI4MzI3MGI4MmE0ZjUyYzc0NjdiNDY2MTcyYmVjNjBkNzIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxODowMzozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhz
ZXJ2ZXIteG9yZzogdXBncmFkZSAyMS4xLjcgLT4gMjEuMS44CgotLS0KIC4uLi97eHNlcnZlci14
b3JnXzIxLjEuNy5iYiA9PiB4c2VydmVyLXhvcmdfMjEuMS44LmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIve3hzZXJ2ZXIteG9yZ18yMS4xLjcuYmIg
PT4geHNlcnZlci14b3JnXzIxLjEuOC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjcuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjguYmIKc2ltaWxh
cml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmdfMjEuMS43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjguYmIKaW5kZXggMjEyYzdkMzljMi4u
MTlkYjdlYTQzNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZl
ci94c2VydmVyLXhvcmdfMjEuMS43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuOC5iYgpAQCAtMyw3ICszLDcgQEAgcmVxdWlyZSB4
c2VydmVyLXhvcmcuaW5jCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS14Zjg2cGNpQnVzLmMtdXNl
LUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0
Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDljNjBiMmRkMGVjNTIz
MjZjYTZhYjIwZGIwZTQ5MGIxZmY0ZjU2NmY1OWNhNzQyZDY1MzJlOTI3OTU4NzdiYiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzOGFhZGI3MzU2NTBjODAyNGVlMjUyMTFjMTkwYmY4YWFkODQ0YzVm
NTk2MzI3NjFhYjFlZjRjNGQ1YWViMTUyIgogCiAjIFRoZXNlIGV4dGVuc2lvbnMgYXJlIG5vdyBp
bnRlZ3JhdGVkIGludG8gdGhlIHNlcnZlciwgc28gZGVjbGFyZSB0aGUgbWlncmF0aW9uCiAjIHBh
dGggZm9yIGluLXBsYWNlIHVwZ3JhZGVzLgotLSAKMi4zOS4yCgo=

--===============7688931720371554768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.7.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.8.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/core2-32-poky-linux/xserver-xorg: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 23953824 to 23953932 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11886929 to 11887050 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xwayland: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xwayland: PV changed from "21.1.7" to "21.1.8"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.7 [default] to 21.1.8 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.7" to "21.1.8"

--===============7688931720371554768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1797 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1797 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0895c5fa379371d6b80035610a0907d81f843871"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0895c5fa379371d6b80035610a0907d81f843871"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 38 Mirrors 0 Missed 64 Current 470 (37% match, 88% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 485 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.1106104
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 571 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1312 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1472 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1473 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1474 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1487 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 1488 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1579 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1582 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: Running task 1651 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1652 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1659 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running task 1717 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: Running task 1755 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1775 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: Running task 1776 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_fetch)
NOTE: Running task 1777 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1778 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: Running task 1779 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_fetch)
NOTE: Running task 1794 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_write_rpm)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1795 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1796 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1797 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1798 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1799 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1800 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 1801 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1802 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 1803 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 1804 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 1805 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: Running task 1806 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Started
NOTE: Running task 1807 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: Running task 1808 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 1809 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1810 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_unpack)
NOTE: Running task 1811 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: Running task 1812 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_unpack)
NOTE: Running task 1813 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1814 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: Running task 1815 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1816 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 1817 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: Running task 1818 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 1819 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: Running task 1820 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1831 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: Running task 1836 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 1837 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 1844 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1851 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1852 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1853 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_patch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1854 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 1855 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1856 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1857 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Started
NOTE: Running task 1858 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1859 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1860 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1861 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1862 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1864 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1866 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1867 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1874 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1875 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 1876 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1877 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: Running task 1878 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1879 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1880 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: Running task 1881 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3f9758a130d251c4880c63445a0160f24cd01b584f5b00ca41aa64418c0cb3f5
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1895 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: Running task 1896 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1897 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1898 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 1899 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1901 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1902 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 1903 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1904 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic unihash changed to 33f0a3a83683c68d3e346e87151277b6f5f7338e70df997ca7978cd7d33ece18
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1905 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 1906 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 36deaa96c352f3b0c6063b0341b3a10810745556a80ce4a4680e35c33ecc2227
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 1912 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 1913 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: Running task 1914 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1916 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1919 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1920 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Started
NOTE: Running task 1921 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1922 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_install)
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1923 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1924 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: Running task 1925 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package)
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1927 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1929 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: Running task 1930 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1932 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1934 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1935 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1936 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: Running task 1937 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1939 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1942 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1943 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1944 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1945 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1949 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1950 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1951 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1952 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1955 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1956 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1957 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1958 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1960 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: Running task 1961 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1963 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1965 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1966 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1967 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1968 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1969 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1970 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: Running task 1972 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1973 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1974 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1975 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1976 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1977 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1978 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1980 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1981 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1983 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 1984 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1985 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1987 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1988 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1990 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1991 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1992 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 1993 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_write_rpm)
NOTE: Running task 1994 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1995 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_build)
NOTE: Tasks Summary: Attempted 1995 tasks of which 1824 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7688931720371554768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 50 skipped, 0 masked, 0 errors.
Removing 86 recipes from the core2-32 sysroot...done.
Removing 88 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0895c5fa379371d6b80035610a0907d81f843871"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0895c5fa379371d6b80035610a0907d81f843871"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 323 Local 262 Mirrors 0 Missed 61 Current 183 (81% match, 87% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 210 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 752 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 753 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 754 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 755 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 756 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 803 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 805 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running setscene task 274 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 841 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 842 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 843 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running setscene task 277 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 281 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: Running task 884 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 891 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: Running task 893 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 894 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_fetch)
NOTE: Running task 895 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: Running task 896 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_fetch)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 283 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 923 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: Running task 924 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 925 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: Running task 926 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 927 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 928 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 929 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 930 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: Running task 931 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 932 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 933 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 934 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_unpack)
NOTE: Running setscene task 291 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: Running task 936 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_package_setscene)
NOTE: Running task 943 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: Running task 944 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 945 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 946 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: Running task 956 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 957 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 958 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 962 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: Running task 963 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_patch)
NOTE: Running task 964 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: Running task 965 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 966 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 967 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 968 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 970 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 971 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 972 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 973 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 974 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 975 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 976 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 977 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 983 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_package_setscene: Started
NOTE: Running task 984 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 985 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 986 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 991 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic unihash changed to 33f0a3a83683c68d3e346e87151277b6f5f7338e70df997ca7978cd7d33ece18
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 311 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 318 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 341 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 344 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.1355833
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 357 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 377 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1565 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1566 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1567 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1575 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1609 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: Running task 1625 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1630 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1667 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1668 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1674 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1675 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1678 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: Running task 1679 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 1680 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: Running task 1685 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_package_write_rpm)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: Running task 1686 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1687 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1688 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: Running task 1689 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 1691 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 1692 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1693 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 1694 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1695 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 1696 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1698 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1699 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1700 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1701 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: Running task 1702 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1703 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1704 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1705 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1706 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1707 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package)
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1708 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1709 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1711 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1712 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1713 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: Running task 1714 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1716 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1717 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1718 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1719 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1720 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1721 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1724 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1725 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1726 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1728 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1730 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1732 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1733 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1734 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1736 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1737 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1738 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1739 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1740 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1741 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: Running task 1742 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1743 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1744 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1746 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1747 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1748 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1749 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1750 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1752 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: Running task 1753 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: Running task 1754 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1756 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1757 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1758 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1759 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1760 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1761 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1762 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1763 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1765 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 1766 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1767 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1768 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1769 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1770 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1771 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1772 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1773 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1774 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 1775 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_write_rpm)
NOTE: Running task 1776 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1777 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_build)
NOTE: Tasks Summary: Attempted 1777 tasks of which 1610 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7688931720371554768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0895c5fa379371d6b80035610a0907d81f843871"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0895c5fa379371d6b80035610a0907d81f843871"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 38 Mirrors 0 Missed 64 Current 466 (37% match, 88% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 481 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.1228596
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 567 of 568 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1301 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1460 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1461 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1462 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1475 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 1476 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1567 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1570 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1640 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1642 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: Running task 1647 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running task 1705 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: Running task 1743 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: Running task 1761 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: Running task 1762 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_fetch)
NOTE: Running task 1763 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: Running task 1764 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_fetch)
NOTE: Running task 1765 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1780 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1781 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1782 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1783 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1784 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1785 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1786 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1787 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 1788 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 1789 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 1790 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1791 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: Running task 1792 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: Running task 1793 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: Running task 1794 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 1795 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1796 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_unpack)
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: Running task 1797 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: Running task 1798 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_unpack)
NOTE: Running task 1799 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1800 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: Running task 1801 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1802 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1803 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 1804 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: Running task 1805 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1806 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 1807 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1828 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: Running task 1829 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1836 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1838 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1839 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1840 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: Running task 1841 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1842 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1843 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1844 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1845 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1846 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1847 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1848 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1849 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: Running task 1850 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1851 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1852 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1853 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1860 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1861 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1863 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1864 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1865 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1866 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 1867 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: Running task 1868 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 06b3a116c47dae76b8eab0061a456db7df96bbc7985c500b5d34946249a414a8
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: Running task 1882 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1883 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1884 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 1885 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 1886 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1887 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1888 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1889 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: Running task 1890 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1891 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic unihash changed to 33f0a3a83683c68d3e346e87151277b6f5f7338e70df997ca7978cd7d33ece18
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 1892 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f72d0fa918541ffac38106c61c0e1fbcf619abfac616beca13b0c759dc5962a5
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 1898 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 1899 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1902 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1903 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1905 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1906 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1908 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1909 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1910 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1911 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package)
NOTE: Running task 1912 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1914 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1916 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1918 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1919 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1920 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1922 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1923 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1925 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1927 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1928 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1929 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1930 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1931 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1932 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1933 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1934 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1935 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1936 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1937 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1938 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1939 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1940 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1941 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1943 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1944 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1945 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1946 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1949 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1950 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1951 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1952 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1953 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1955 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1956 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1957 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: Running task 1958 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1959 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1960 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1961 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1962 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1963 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1964 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1965 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1966 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1967 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1968 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1969 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 1970 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1971 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1973 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1974 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1975 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1976 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1977 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1978 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 1979 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_write_rpm)
NOTE: Running task 1980 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1981 of 1981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_build)
NOTE: Tasks Summary: Attempted 1981 tasks of which 1810 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7688931720371554768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 56 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0895c5fa379371d6b80035610a0907d81f843871"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0895c5fa379371d6b80035610a0907d81f843871"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 38 Mirrors 0 Missed 64 Current 470 (37% match, 88% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 485 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.1167218
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 571 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1311 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1472 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1473 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1474 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1487 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 1488 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1579 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1582 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1651 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1653 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1659 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: Running task 1717 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: Running task 1758 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1775 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: Running task 1776 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1777 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_fetch)
NOTE: Running task 1778 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: Running task 1779 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_fetch)
NOTE: Running task 1794 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1795 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1796 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1797 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: Running task 1798 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1799 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1800 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1801 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1802 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 1803 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 1804 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1805 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: Running task 1806 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Started
NOTE: Running task 1807 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: Running task 1808 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 1809 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 1810 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1811 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_unpack)
NOTE: Running task 1812 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: Running task 1813 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: Running task 1814 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1815 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1816 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: Running task 1817 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Started
NOTE: Running task 1818 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1819 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1840 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 1841 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1848 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 1849 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: Running task 1850 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1851 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_patch)
NOTE: Running task 1852 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: Running task 1853 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1854 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 1855 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_patch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Started
NOTE: Running task 1856 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: Running task 1857 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1858 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1859 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1860 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1861 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Started
NOTE: Running task 1862 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1863 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1864 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1865 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1866 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1867 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_package_write_rpm)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1875 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1876 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1877 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: Running task 1879 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: Running task 1880 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6ac183ca786c18657042ded50663fea0f9f2566d1d4c36d6b880e26722f9c86c
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1893 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: Running task 1894 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1897 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: Running task 1898 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 1899 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1900 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 1901 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1902 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic)
NOTE: Running task 1903 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1904 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: Running task 1905 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_lic unihash changed to 33f0a3a83683c68d3e346e87151277b6f5f7338e70df997ca7978cd7d33ece18
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 1906 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ee640553c9ed7531eb4120f495a1c27eae33b911eb232233bf76a7c935b60339
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 1912 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 1914 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1916 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1919 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1920 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1921 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1922 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1923 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1924 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1925 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1926 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package)
NOTE: Running task 1927 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1930 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1932 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: Running task 1933 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1935 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1937 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1939 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1941 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1942 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1943 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1944 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1945 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1949 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1950 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1951 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_23.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1952 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1955 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1956 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1957 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1958 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1960 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1962 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1965 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1966 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1967 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1968 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: Running task 1969 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1970 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: Running task 1972 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1973 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1974 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1975 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1976 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1977 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1978 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1980 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1981 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1983 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: Running task 1984 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1985 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1987 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1988 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1990 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1991 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1992 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 1993 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_write_rpm)
NOTE: Running task 1994 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1995 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_build)
NOTE: Tasks Summary: Attempted 1995 tasks of which 1824 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7688931720371554768==--

