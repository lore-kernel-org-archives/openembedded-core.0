Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC1CC6FA8E
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.24237.1665871397227453301
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bJzJCpWi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010183ddac3dd5-4a84063a-e36a-40b7-a5ee-098a07656830-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Tr7VLs9A8hVSBd1RcL//74x1MscHpfYBnyTgOaV6ep0=;
	b=bJzJCpWiey8OZX9PLeFN2DkF/iSq7cBR5YLLypnhQxPFnyNhMGWLZz4arLZFim+C
	0ABmInocY6RcMX4PcDQRWVvopeRV/z9hJTsEvjltGRZEECt37F3VbSnev+m1Jw/0P4l
	aQLMQ9g8pI5QqUEXfoJAXBwOnalxlswrxXPTPinY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Tr7VLs9A8hVSBd1RcL//74x1MscHpfYBnyTgOaV6ep0=;
	b=QqC4Nrl1u8GoMidoxMv0l/iQ4i/Jz5uTGXngYzSBgW/o3amADsevv6FZvITVab+Q
	0xoSep9Yfq9gTfKh59I6Y/vi7WkqFjf16FQQiLVoDJ1hYlUQUMuTukRn2tk8zGV2YHA
	0xQF0umZ3QPLnVUI2TBUrLn9g2h6XTxDX9pknbPQ=
Content-Type: multipart/mixed; boundary="===============2903689717587530083=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.20.4 SUCCEEDED
Message-ID: <01010183ddac3dd5-4a84063a-e36a-40b7-a5ee-098a07656830-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171863

--===============2903689717587530083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.20.3-1.20.4.patch
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
--===============2903689717587530083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2003.0 /usr/lib/libgstvalidate-1.0.so.0.2003.0", added "/usr/lib/libgstvalidate-1.0.so.0.2004.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2004.0"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2003.0 to libgstvalidate-1.0.so.0.2004.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2003.0 to libgstvalidate-default-overrides-1.0.so.0.2004.0
  /usr/lib/libgstvalidate-1.0.so.0.2003.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2004.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2003.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2004.0

--===============2903689717587530083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ae4fdc840f5d919d1457df30a89c2ba99e176686"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 74 Local 43 Mirrors 0 Missed 31 Current 461 (58% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 471 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb:do_packagedata_setscene)
NOTE: Running task 1296 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 1342 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 1481 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1486 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 1524 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 1541 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1577 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1590 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1623 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 1640 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_fetch)
NOTE: Running task 1661 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1710 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 1731 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_write_config)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: Running task 1765 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: Running task 1766 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: Running task 1767 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Started
NOTE: Running task 1768 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1769 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1770 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1771 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 1772 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1773 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: Running task 1774 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: Running task 1775 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.1749168
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 534 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1776 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1777 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 1778 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 1779 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1780 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1781 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Started
NOTE: recipe iso-codes-4.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: Running task 1783 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: Running task 1784 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1786 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1787 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1788 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1789 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1790 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 1791 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1792 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic unihash changed to cc51b7273c7de400777af6bf7c65549feb4efad166449ee9dc895b0a37aed9f3
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1793 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: Running task 1794 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: Running task 1795 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: Running task 1796 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1827 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1829 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 1838 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1839 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1840 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 1841 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1842 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1843 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 1844 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 1845 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1846 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 1847 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1848 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: Running task 1849 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: Running task 1852 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1853 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Started
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 1854 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: Running task 1855 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1856 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1857 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1858 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1859 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1860 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1861 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1862 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 1863 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1864 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1865 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: Running task 1866 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1867 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1868 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: Running task 1869 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 1870 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1871 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 1873 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1874 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1875 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1876 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1877 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1878 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1879 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1880 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_configure)
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1881 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_compile)
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1883 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_install)
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1884 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package)
NOTE: Running task 1885 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Succeeded
NOTE: Running task 1886 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1887 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_write_rpm)
NOTE: Running task 1888 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1889 of 1889 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1889 tasks of which 1791 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2903689717587530083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ae4fdc840f5d919d1457df30a89c2ba99e176686"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 43 Mirrors 0 Missed 27 Current 455 (61% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 465 of 525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb:do_packagedata_setscene)
NOTE: Running task 1296 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 1342 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 1481 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1486 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 1524 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 1541 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1577 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1615 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 1630 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_fetch)
NOTE: Running task 1680 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 1701 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_write_config)
NOTE: recipe iso-codes-4.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: Running task 1735 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: Running task 1736 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: Running task 1737 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 1738 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1739 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1740 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1741 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: Running task 1742 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: Running task 1743 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.1825254
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 524 of 525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1744 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1745 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1746 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: Running task 1747 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_patch)
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: Running task 1748 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: Running task 1749 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: Running task 1750 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1751 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe iso-codes-4.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1752 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1753 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1754 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Started
NOTE: Running task 1756 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 1757 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: Running task 1758 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1759 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic unihash changed to cc51b7273c7de400777af6bf7c65549feb4efad166449ee9dc895b0a37aed9f3
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1760 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: Running task 1761 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1792 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1794 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1795 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1805 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1807 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1808 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1809 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 1810 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: Running task 1811 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1812 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1814 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1816 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1817 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1818 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1819 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1821 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1822 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1824 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1825 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1826 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: Running task 1828 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1829 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 1830 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1831 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1832 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 1833 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1834 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1835 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1836 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1838 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1839 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1840 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_configure)
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_compile)
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_install)
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1844 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package)
NOTE: Running task 1845 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Succeeded
NOTE: Running task 1846 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1847 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_write_rpm)
NOTE: Running task 1848 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1849 of 1849 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1849 tasks of which 1763 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2903689717587530083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ae4fdc840f5d919d1457df30a89c2ba99e176686"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 74 Local 43 Mirrors 0 Missed 31 Current 457 (58% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 467 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb:do_packagedata_setscene)
NOTE: Running task 1296 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 1342 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 1481 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1486 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 1524 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 1541 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1577 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1589 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1617 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 1634 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_fetch)
NOTE: Running task 1645 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1692 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 1713 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_write_config)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: Running task 1747 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: Running task 1748 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: Running task 1749 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Started
NOTE: Running task 1750 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1751 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1752 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1753 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 1754 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 1755 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 1756 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 1757 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.1861548
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 530 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: Running task 1758 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1759 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1760 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: Running task 1761 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1762 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: recipe iso-codes-4.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1764 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: Running task 1765 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 1766 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1767 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1768 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: Running task 1769 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1770 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1771 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Started
NOTE: Running task 1772 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1773 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 1774 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: Running task 1775 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic unihash changed to cc51b7273c7de400777af6bf7c65549feb4efad166449ee9dc895b0a37aed9f3
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1776 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: Running task 1777 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: Running task 1778 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1809 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1811 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1812 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 1821 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1822 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1824 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: Running task 1825 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1826 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1827 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1828 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 1829 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 1830 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 1831 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 1832 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: Running task 1833 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1834 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1835 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1836 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1838 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1840 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1841 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1844 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 1846 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1847 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1848 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1849 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: Running task 1850 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1851 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 1852 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1853 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1854 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 1855 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1856 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1857 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1860 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1861 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_configure)
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1863 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_compile)
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1864 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1865 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_install)
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1866 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package)
NOTE: Running task 1867 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Succeeded
NOTE: Running task 1868 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1869 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_write_rpm)
NOTE: Running task 1870 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1871 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1871 tasks of which 1773 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2903689717587530083==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.20.3-1.20.4.patch"

RnJvbSBlMzA0MGNlZTUzNTM5OWJlMTZmZDZhNzI5YWJlNTUwZmM5MzM2YzY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTc6NTM6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yMC4zIC0+IDEuMjAuNAoKLS0tCiAuLi4ve2dzdC1kZXZ0
b29sc18xLjIwLjMuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjAuNC5iYn0gICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1kZXZ0b29sc18xLjIwLjMuYmIg
PT4gZ3N0LWRldnRvb2xzXzEuMjAuNC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjAuMy5iYiBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMC40LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yMC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjAuNC5iYgppbmRleCBjNTE1ZTE3M2M4Li4wOWI2
ZTVhNDk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
LWRldnRvb2xzXzEuMjAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWRldnRvb2xzXzEuMjAuNC5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImh0
dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWRldnRvb2xzL2dzdC1kZXZ0
b29scy0ke1BWfQogICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVu
dC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImJiYmQ0NWVhZDcwMzM2N2VhOGY0YmU5YjNjMDgyZDdiNjJiZWY0N2IyNDBhMzkw
ODNmMjc4NDRlMjg3NThjNDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODJhMjkzNjAwMjczZjRk
ZDNlZWQ1NjdhYWU1MTBjYTBjN2Q2MjljMzgwNzc4OGIwMGU2Y2RiZDFkMjQ1OWE4NCIKIAogREVQ
RU5EUyA9ICJqc29uLWdsaWIgZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGdzdHJlYW1lcjEuMCBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIgogUlJFQ09NTUVORFM6JHtQTn0gPSAiZ2l0IgotLSAK
Mi4zMS4xCgo=

--===============2903689717587530083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ae4fdc840f5d919d1457df30a89c2ba99e176686"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 74 Local 43 Mirrors 0 Missed 31 Current 457 (58% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 467 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb:do_packagedata_setscene)
NOTE: Running task 1296 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 1342 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 1481 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 1486 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 1524 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 1541 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 1577 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1590 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1617 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 1634 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_fetch)
NOTE: Running task 1647 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1692 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 1713 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_write_config)
NOTE: recipe iso-codes-4.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: Running task 1747 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 1748 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: Running task 1749 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 1750 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: Running task 1751 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1752 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1753 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 1754 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: Running task 1755 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1756 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1757 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.1787225
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 530 of 531 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: Running task 1758 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1759 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1760 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1761 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1762 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: Running task 1763 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: Running task 1764 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1765 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe iso-codes-4.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: Running task 1767 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1768 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1769 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1770 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1771 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: Running task 1772 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1773 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1774 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 1775 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic unihash changed to cc51b7273c7de400777af6bf7c65549feb4efad166449ee9dc895b0a37aed9f3
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1776 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: Running task 1777 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1778 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1809 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1811 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1820 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 1821 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1822 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1823 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 1824 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1825 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1826 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 1827 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 1828 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: Running task 1829 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1830 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 1831 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 1832 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1833 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1834 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1835 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1836 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1838 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1840 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1841 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 1844 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1845 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1846 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1847 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: Running task 1848 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1849 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 1850 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: Running task 1851 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1852 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1853 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1854 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 1855 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1856 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1857 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1860 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1861 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_configure)
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1863 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_compile)
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1864 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1865 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_install)
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1866 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package)
NOTE: Running task 1867 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Succeeded
NOTE: Running task 1868 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1869 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_write_rpm)
NOTE: Running task 1870 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1871 of 1871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1871 tasks of which 1773 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2903689717587530083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 78 recipes from the core2-32 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ae4fdc840f5d919d1457df30a89c2ba99e176686"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 368 Local 337 Mirrors 0 Missed 31 Current 168 (91% match, 94% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 169 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 189 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 202 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 743 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 761 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 814 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_fetch)
NOTE: Running task 815 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 816 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 817 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_write_config)
NOTE: Running task 818 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 821 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 830 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 835 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_fetch)
NOTE: Running task 848 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 862 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 864 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_write_config)
NOTE: recipe git-2.37.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: Running task 866 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: Running task 867 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Started
NOTE: Running task 868 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe gst-devtools-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 869 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 870 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_unpack)
NOTE: recipe json-glib-1.6.6-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 871 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.37.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 872 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: Running setscene task 239 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 240 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 248 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 252 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 254 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Started
NOTE: Running setscene task 256 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 257 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe git-2.37.3-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 904 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe gst-devtools-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: Running task 905 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe git-2.37.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_unpack: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 910 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_patch)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 915 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: Running setscene task 278 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 928 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 934 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 935 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: Running task 936 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 937 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 938 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 939 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe json-glib-1.6.6-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 289 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: Running task 943 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: Running setscene task 296 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: Running task 958 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 309 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_lic unihash changed to cc51b7273c7de400777af6bf7c65549feb4efad166449ee9dc895b0a37aed9f3
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 964 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 969 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 327 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 339 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 342 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 344 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 351 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.1904946
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 358 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 445 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 472 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 478 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 490 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1634 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1663 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1678 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1732 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: Running task 1742 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1743 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1835 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1836 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: Running task 1837 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe json-glib-1.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1838 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure)
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1839 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1840 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure: Succeeded
NOTE: Running task 1842 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1843 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 1845 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1846 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 1848 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 1849 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1851 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1853 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 1854 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: Running task 1855 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_compile: Succeeded
NOTE: Running task 1856 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1857 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install)
NOTE: recipe json-glib-1.6.6-r0: task do_install: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install: Succeeded
NOTE: Running task 1858 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.6.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1859 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot)
NOTE: Running task 1860 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_package)
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.6.6-r0: task do_package: Started
NOTE: recipe json-glib-1.6.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.6.6-r0: task do_package: Succeeded
NOTE: Running task 1861 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_packagedata)
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.6.6-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 1862 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1863 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1864 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1865 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: Running task 1866 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1867 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 1868 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1869 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1870 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1871 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1872 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 1874 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 1875 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1876 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 1878 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 1879 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1880 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1881 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_configure)
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_compile)
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 1883 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_install)
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 1885 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package)
NOTE: Running task 1886 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package: Succeeded
NOTE: Running task 1887 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_packagedata)
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1888 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_write_rpm)
NOTE: Running task 1889 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_package_qa)
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_qa: Succeeded
NOTE: recipe gst-devtools-1.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1890 of 1890 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1890 tasks of which 1792 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.224.1-r0 to 0:1.3.216.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.216.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2903689717587530083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2003.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2003.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2004.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2004.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2003.0 /usr/lib/libgstvalidate-1.0.so.0.2003.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2004.0 /usr/lib/libgstvalidate-1.0.so.0.2004.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.3.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.4.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/core2-32-poky-linux/gst-devtools: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gst-devtools: PV changed from "1.20.3" to "1.20.4"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2003.0 to libgstvalidate-1.0.so.0.2004.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2003.0 to libgstvalidate-default-overrides-1.0.so.0.2004.0
  /usr/lib/libgstvalidate-1.0.so.0.2003.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2004.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2003.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2004.0

--===============2903689717587530083==--

