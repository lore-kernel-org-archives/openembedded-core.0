Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6D6C636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.30355.1675272854493522198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QFgXi3Zd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b3749-05ea5401-11a9-43f7-9ed7-c6c5969cb03c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272861;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O/NaBfVc7D8GO3W04WCsxh+22++AB9V7Oakuz719Zm4=;
	b=QFgXi3Zd1djN1sjbzL58Gzy2wdozeN8uC7qEhI5DMgCi0VUkXZY3wH+UKMKm4nbr
	airqXMLZshGHf1Ggj/febXN7f4zUF5OYQ4UHg2egArg3qE7a+jBvCV6uQz4Swybfmcl
	b4aRabE3ZCgu4nidvqFI6GxKHiFOs19kyymjQPCM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272861;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O/NaBfVc7D8GO3W04WCsxh+22++AB9V7Oakuz719Zm4=;
	b=NaoERNkdxbE1smk1Q8vbmqdSDxfCQ2aKrkbQ9eu8jJGARY4v8kaTmDQTh8Pe6sP9
	Zth1sGc4a7L2nH40moxkILfgcRHSpncKiNjBo3Za3fsRpAHcMENHLVX80Jz5A7FBqDW
	6IHgnLR9R76Q5kSRrSO0PBFgxIDOIvmAy2gnWIjQ=
Content-Type: multipart/mixed; boundary="===============0523333411225895627=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 37df1f2bbc689d224369d963dd8007d68fcd7c6a
 SUCCEEDED
Message-ID: <010101860e0b3749-05ea5401-11a9-43f7-9ed7-c6c5969cb03c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176654

--===============0523333411225895627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *37df1f2bbc689d224369d963dd8007d68fcd7c6a* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
--===============0523333411225895627==
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
meta-yocto-bsp       = "tmp-auh-upgrades:585ec183c8c08e58d5c397a6cfd21d392b459654"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 113 Local 9 Mirrors 0 Missed 104 Current 483 (7% match, 82% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1229 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_fetch)
NOTE: Running task 1237 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1317 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1329 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1422 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1486 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1487 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1488 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1489 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1493 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: Running task 1494 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1495 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1497 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Started
NOTE: Running task 1518 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1520 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: Running task 1521 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_unpack)
NOTE: Running task 1522 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: Running task 1616 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: Running task 1625 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1626 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1627 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1628 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: Running task 1642 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1649 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: Running task 1687 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1723 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Started
NOTE: Running task 1724 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 1729 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: Running task 1730 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1732 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_patch)
NOTE: Running task 1733 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1734 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1735 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: Running task 1736 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: Running task 1737 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: Running task 1738 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: Running task 1744 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1745 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1746 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1747 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1748 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1754 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Started
NOTE: Running task 1796 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1797 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1798 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1799 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1813 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1815 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1818 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1824 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: Running task 1833 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 1834 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1871 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: Running task 1886 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 1887 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 1888 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: Running task 1889 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running task 1890 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: Running task 1891 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1892 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 1894 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: Running task 1896 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 1897 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1898 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: Running task 1899 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 1900 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1901 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1902 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1903 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1904 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1905 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1906 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1907 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1908 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1909 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1910 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1911 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1913 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1914 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: Running task 1915 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Succeeded
NOTE: Running task 1916 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Started
NOTE: Running task 1917 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1918 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1919 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1920 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Succeeded
NOTE: Running task 1921 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: Running task 1922 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1923 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1924 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1925 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1926 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1927 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: Running task 1928 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: Running task 1929 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1930 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 4a99eb2446810bd25e29eae0b13e53e48b9b41f7c1d8eb1b85aaf7803f73a923
NOTE: Running task 1931 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: Running task 1932 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: Running task 1933 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1934 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: Running task 1935 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1936 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 1937 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1938 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1939 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1940 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1941 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1942 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: Running task 1943 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1944 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1945 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1947 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1948 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: Running task 1950 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1951 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1952 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1953 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1954 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1955 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1956 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1957 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1959 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1960 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1961 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1963 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1964 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1965 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1966 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1967 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1968 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1969 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1970 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 1971 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_install)
NOTE: Running task 1972 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1973 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe libdrm-2.4.114-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Failed
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Succeeded
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1973 tasks of which 1830 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libjpeg-turbo/1_2.1.4-r0/temp/log.do_packagedata.1784210
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata) failed with exit code '1'

--===============0523333411225895627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 96 recipes from the core2-32 sysroot...done.
Removing 105 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:585ec183c8c08e58d5c397a6cfd21d392b459654"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 361 Local 245 Mirrors 0 Missed 116 Current 210 (67% match, 79% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 211 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 290 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 309 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 320 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 343 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 346 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 355 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 358 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 367 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 369 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 707 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 739 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 741 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 748 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 758 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_fetch)
NOTE: Running task 763 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_fetch)
NOTE: Running task 768 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 772 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running task 777 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 778 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 779 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_fetch)
NOTE: Running task 780 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 781 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 790 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_fetch)
NOTE: Running task 792 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 802 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 815 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 391 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 393 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 834 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 860 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 867 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 868 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 869 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 870 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 871 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 872 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 874 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_write_config)
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: Running task 922 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_write_config)
NOTE: Running task 925 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 948 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_package_setscene: Started
NOTE: Running task 968 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: Running task 989 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Started
NOTE: Running task 990 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: Running task 991 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 992 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 993 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 994 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 995 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 996 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 997 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 999 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Started
NOTE: Running task 1000 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1001 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1002 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1003 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_unpack)
NOTE: Running task 1004 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: Running task 1005 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1006 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 1011 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_unpack)
NOTE: Running task 1012 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1013 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1014 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1015 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1016 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1017 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1018 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 1019 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: Running task 1020 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1021 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_unpack)
NOTE: Running setscene task 404 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running task 1022 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1023 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1024 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1026 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1033 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1034 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1037 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1040 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: Running setscene task 408 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running task 1045 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 1046 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 1047 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: Running task 1048 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: Running task 1069 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: Running task 1070 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_patch)
NOTE: Running task 1071 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1084 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1085 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1086 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 410 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 1091 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1092 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Started
NOTE: Running task 1098 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1109 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1110 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1111 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_patch)
NOTE: Running task 1112 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: Running task 1113 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 1114 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: Running task 1115 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: Running setscene task 415 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: Running task 1120 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1121 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 418 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: Running task 1126 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: Running task 1127 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1128 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1129 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1130 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: Running task 1132 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Started
NOTE: Running task 1134 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 429 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 437 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1142 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: Running task 1143 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.37-r0: task do_package_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 443 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1154 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1155 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1156 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: Running setscene task 444 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1164 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1166 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: Running task 1167 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: Running setscene task 451 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1173 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1175 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 461 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running task 1180 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1183 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 466 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 1196 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1201 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1206 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1212 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Started
NOTE: Running setscene task 485 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1229 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Succeeded
NOTE: Running setscene task 488 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 1238 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1243 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1245 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1246 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 1251 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Succeeded
NOTE: Running task 1256 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1257 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1258 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1268 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 4a99eb2446810bd25e29eae0b13e53e48b9b41f7c1d8eb1b85aaf7803f73a923
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 1269 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1270 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 502 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: Running task 1275 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1276 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_patch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: Running task 1277 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1290 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1300 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1614 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1628 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1673 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1684 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1685 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1686 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1689 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1690 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1698 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1699 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1728 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1729 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1730 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1769 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1787 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1796 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1798 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1799 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1800 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1801 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: Running task 1802 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1805 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1806 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: Running task 1807 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: Running task 1808 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: Running task 1809 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1810 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1811 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: Running task 1812 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1813 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1815 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1816 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1817 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1818 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1819 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1820 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1821 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1822 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1823 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1824 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1825 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: Running task 1826 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: Running task 1827 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1828 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1829 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: Running task 1830 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1831 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: Running task 1832 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1833 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: Running task 1834 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1835 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1836 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1837 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 1838 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Failed
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1838 tasks of which 1651 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libjpeg-turbo/1_2.1.4-r0/temp/log.do_packagedata.1921773
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata) failed with exit code '1'

--===============0523333411225895627==
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
meta-yocto-bsp       = "tmp-auh-upgrades:585ec183c8c08e58d5c397a6cfd21d392b459654"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 113 Local 9 Mirrors 0 Missed 104 Current 483 (7% match, 82% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1229 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_fetch)
NOTE: Running task 1237 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1317 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1329 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1422 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1486 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1487 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1488 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1489 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1493 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: Running task 1494 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1495 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1497 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: Running task 1513 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1520 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: Running task 1521 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_unpack)
NOTE: Running task 1522 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: Running task 1589 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1617 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1618 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1646 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: Running task 1718 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1719 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1724 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1725 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: Running task 1726 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1727 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: Running task 1730 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1731 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: Running task 1732 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: Running task 1733 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: Running task 1734 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: Running task 1735 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1736 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: Running task 1737 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: Running task 1738 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 1745 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1746 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1747 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1748 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1749 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1754 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1755 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: Running task 1797 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1798 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1799 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1800 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1814 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1816 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: Running task 1819 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1825 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 1834 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1835 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: Running task 1872 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: Running task 1887 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1888 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: Running task 1889 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1890 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1891 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: Running task 1892 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Started
NOTE: Running task 1893 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: Running task 1894 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 1895 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: Running task 1896 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1897 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: Running task 1898 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1899 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Succeeded
NOTE: Running task 1900 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1901 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1902 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 1903 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1904 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1905 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1906 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: Running task 1907 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1908 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1909 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1910 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: Running task 1911 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1912 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: Running task 1913 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: Running task 1914 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1915 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1916 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1917 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1918 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1919 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 1920 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Succeeded
NOTE: Running task 1921 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1922 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1923 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1924 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1925 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: Running task 1927 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Succeeded
NOTE: Running task 1928 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1929 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1930 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1931 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1932 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1933 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1934 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 4a99eb2446810bd25e29eae0b13e53e48b9b41f7c1d8eb1b85aaf7803f73a923
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1935 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: Running task 1936 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1937 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1938 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1939 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1940 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 1941 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 1942 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: Running task 1943 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1944 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1945 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_configure)
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1946 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1947 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1949 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: Running task 1950 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1951 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: Running task 1952 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1954 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1955 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: Running task 1956 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1957 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: Running task 1958 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1959 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1960 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1962 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1963 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1965 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1966 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1967 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1968 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1969 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1970 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Succeeded
NOTE: Running task 1971 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_install)
NOTE: recipe libdrm-2.4.114-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 1973 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 1974 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.114-r0: task do_install: Succeeded
NOTE: Running task 1975 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot)
NOTE: Running task 1976 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_package)
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.114-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Failed
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_package: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1976 tasks of which 1830 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libjpeg-turbo/1_2.1.4-r0/temp/log.do_packagedata.1612562
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata) failed with exit code '1'

--===============0523333411225895627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+37df1f2bbc"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+14c025d192 [default] to 0.0+gitAUTOINC+37df1f2bbc [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+37df1f2bbc"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14274840 to 14278652 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+37df1f2bbc"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+37df1f2bbc"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+37df1f2bbc"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+37df1f2bbc"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3522536 to 3532984 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+37df1f2bbc"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+37df1f2bbc"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7032258 to 7044546 (+0%)

--===============0523333411225895627==
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
meta-yocto-bsp       = "tmp-auh-upgrades:585ec183c8c08e58d5c397a6cfd21d392b459654"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 113 Local 9 Mirrors 0 Missed 104 Current 487 (7% match, 82% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1229 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_fetch)
NOTE: Running task 1237 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1317 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1329 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1422 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1488 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1489 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1490 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1491 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1495 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: Running task 1496 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1497 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1499 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1505 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_unpack)
NOTE: Running task 1506 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1520 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1521 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1522 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: Running task 1523 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1527 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1621 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1622 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1649 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1650 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: Running task 1651 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: Running task 1720 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: Running task 1740 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1743 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: Running task 1748 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: Running task 1749 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: Running task 1750 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1751 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1752 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1753 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: Running task 1754 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: Running task 1755 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: Running task 1756 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: Running task 1757 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: Running task 1758 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 1759 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: Running task 1760 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 1767 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1768 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1769 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1770 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1771 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: Running task 1776 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1777 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Started
NOTE: Running task 1819 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1820 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1821 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1822 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1836 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1838 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 1841 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: Running task 1847 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: Running task 1856 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 1857 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: Running task 1894 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1909 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: Running task 1910 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: Running task 1911 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1912 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1913 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 1914 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1915 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1916 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: Running task 1917 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: Running task 1918 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1919 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1920 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1921 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1922 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1923 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 1924 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: Running task 1925 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1926 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1927 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1928 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: Running task 1929 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1930 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1931 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1932 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: Running task 1933 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: Running task 1934 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1935 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1937 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1938 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1939 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1940 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1941 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1942 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Succeeded
NOTE: Running task 1943 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1944 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 1945 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 1946 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1947 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1948 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1949 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1950 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1951 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1952 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1953 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1954 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1955 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1956 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Succeeded
NOTE: Running task 1957 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 4a99eb2446810bd25e29eae0b13e53e48b9b41f7c1d8eb1b85aaf7803f73a923
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1958 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1959 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1960 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1961 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: Running task 1962 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 1964 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1965 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_configure)
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1966 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1967 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1968 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1969 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: Running task 1970 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: Running task 1971 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1973 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1974 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1975 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1976 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1977 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1978 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1979 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_compile)
NOTE: Running task 1980 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1981 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1982 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1983 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1985 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1986 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1987 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_install)
NOTE: recipe libdrm-2.4.114-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1989 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.114-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot)
NOTE: Running task 1991 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_package)
NOTE: recipe libdrm-2.4.114-r0: task do_package: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1993 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Failed
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1994 tasks of which 1848 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libjpeg-turbo/1_2.1.4-r0/temp/log.do_packagedata.1487968
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata) failed with exit code '1'

--===============0523333411225895627==
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
meta-yocto-bsp       = "tmp-auh-upgrades:585ec183c8c08e58d5c397a6cfd21d392b459654"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 113 Local 9 Mirrors 0 Missed 104 Current 479 (7% match, 82% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1226 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_fetch)
NOTE: Running task 1234 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1311 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1323 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1414 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1478 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1479 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1480 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1481 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1485 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: Running task 1486 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1487 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1489 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Started
NOTE: Running task 1508 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: Running task 1510 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 1511 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1521 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_unpack)
NOTE: Running task 1522 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: Running task 1552 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: Running task 1608 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: Running task 1609 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: Running task 1610 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 1660 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: Running task 1673 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1709 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1714 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1715 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: Running task 1716 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1717 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1718 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1719 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1720 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: Running task 1721 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: Running task 1722 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: Running task 1723 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1724 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: Running task 1725 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: Running task 1726 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: Running task 1727 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 1734 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1735 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1736 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1737 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1738 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: Running task 1743 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1744 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: Running task 1786 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1787 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1788 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1789 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1803 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1805 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: Running task 1808 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1814 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: Running task 1823 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1824 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 1861 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1875 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.1-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1876 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1878 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1879 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1880 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 1881 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 1882 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1884 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: Running task 1885 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1886 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1887 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1888 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: Running task 1890 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1891 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 1892 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1893 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 1894 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: Running task 1895 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1896 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1897 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: Running task 1898 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: Running task 1899 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: Running task 1900 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1901 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1902 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: Running task 1903 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 1904 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1905 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: Running task 1906 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1907 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1909 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1910 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1913 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: Running task 1914 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1916 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1917 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1918 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1919 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1920 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1921 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 4a99eb2446810bd25e29eae0b13e53e48b9b41f7c1d8eb1b85aaf7803f73a923
NOTE: recipe puzzles-2_0.0+gitAUTOINC+37df1f2bbc-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1922 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1923 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1924 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: Running task 1925 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1926 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1927 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: Running task 1928 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1929 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1930 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe libdrm-2.4.114-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 1931 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_configure)
NOTE: Running task 1932 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1933 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1934 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1935 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1936 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: Running task 1937 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1938 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1940 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: Running task 1941 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1942 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1943 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe libdrm-2.4.114-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 1945 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 1946 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1947 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: Running task 1949 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1950 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1951 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1952 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1953 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1954 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: Running task 1955 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1956 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1957 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libdrm-2.4.114-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.114-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Failed
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_install: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1958 tasks of which 1816 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:2.1.5-r0 to 1:2.1.4-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_2.1.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libjpeg-turbo/1_2.1.4-r0/temp/log.do_packagedata.1705541
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata) failed with exit code '1'

--===============0523333411225895627==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBkZGFhMTIyNDNjMjU4NTk0OWMyYmIyNTdkODU0NGI3MmMxYzM3NmI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNzowNDowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyOSArKysrKysrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIgYi9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCmluZGV4IGM5NGZlZjQ5MzEuLmQwYzdkY2Qy
ZTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgpAQCAtMSw4ICsx
LDMzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5DRQorIyArKysgTElDRU5DRQorIyBA
QCAtMSw5ICsxLDkgQEAKKyMgLVRoaXMgc29mdHdhcmUgaXMgY29weXJpZ2h0IChjKSAyMDA0LTIw
MjEgU2ltb24gVGF0aGFtLgorIyArVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIwMDQt
MjAyMyBTaW1vbiBUYXRoYW0uCisjICAKKyMgIFBvcnRpb25zIGNvcHlyaWdodCBSaWNoYXJkIEJv
dWx0b24sIEphbWVzIEhhcnZleSwgTWlrZSBQaW5uYSwgSm9uYXMKKyMgIEvDtmxrZXIsIERhcml1
c3ogT2xzemV3c2tpLCBNaWNoYWVsIFNjaGllcmwsIExhbWJyb3MgTGFtYnJvdSwgQmVybmQKKyMg
IFNjaG1pZHQsIFN0ZWZmZW4gQmF1ZXIsIExlbm5hcmQgU3Byb25nLCBSb2dpZXIgR29vc3NlbnMs
IE1pY2hhZWwKKyMgLVF1ZXZpbGxvbiwgQXNoZXIgR29yZG9uIGFuZCBEaWRpIEtvaGVuLgorIyAr
UXVldmlsbG9uLCBBc2hlciBHb3Jkb24sIERpZGkgS29oZW4gYW5kIEJlbiBIYXJyaXMuCisjICAK
KyMgIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkg
cGVyc29uCisjICBvYnRhaW5pbmcgYSBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0
ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcworIyAKKyMKKwogU1VNTUFSWSA9ICJTaW1vbiBUYXRoYW0n
cyBQb3J0YWJsZSBQdXp6bGUgQ29sbGVjdGlvbiIKIERFU0NSSVBUSU9OID0gIkNvbGxlY3Rpb24g
b2Ygc21hbGwgY29tcHV0ZXIgcHJvZ3JhbXMgd2hpY2ggaW1wbGVtZW50IG9uZS1wbGF5ZXIgcHV6
emxlIGdhbWVzLiIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cuY2hpYXJrLmdyZWVuZW5kLm9yZy51
ay9+c2d0YXRoYW0vcHV6emxlcy8iCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOQ0U7bWQ1PTZlN2QyNGNmMWM5NDk4ODdlZTk0NDdhMWUyYTRhMjRjIgor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRTttZDU9OTJkMmI3YTJmYzk2YjVmN2Yx
NzEwMWRmN2RiMWZlZmEiCiAKICMgZ3RrIHN1cHBvcnQgaW5jbHVkZXMgYSBidW5jaCBvZiB4MTEg
aGVhZGVycwogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIngxMSIKQEAgLTEwLDcgKzM1LDcg
QEAgUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
LnRhcnRhcnVzLm9yZy9zaW1vbi9wdXp6bGVzLmdpdDticmFuY2g9bWFpbiIKIAogVVBTVFJFQU1f
Q0hFQ0tfQ09NTUlUUyA9ICIxIgotU1JDUkVWID0gIjE0YzAyNWQxOTI1Nzk5NjFkMWFkZTUxZjJh
MzIyYmQ3NjVhZWYwZTUiCitTUkNSRVYgPSAiMzdkZjFmMmJiYzY4OWQyMjQzNjlkOTYzZGQ4MDA3
ZDY4ZmNkN2M2YSIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0JHtTUkNQVn0iCiAKLS0gCjIuMzcu
MwoK

--===============0523333411225895627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+37df1f2bbc

--===============0523333411225895627==--

