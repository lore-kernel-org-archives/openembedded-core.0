Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D49C6FD1A
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10146.1676508396007469567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fbp4uby/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018657afff39-4c888350-2485-4bb2-8b4c-20c1e1dac691-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iNTLiRTcvadRSTZ5JQ6M6ariXFG4IkE5JIrXYLFNzls=;
	b=fbp4uby/CfJKtt2eDRK/+zsBd+GEIXrVNHMJki22JxZL++Q2OvLv3dFB6TA3R1SS
	BVp6Q1nm3t4ykALEwKGzCHhrTf40VH+2g5sj7lj93+HMgWMXmYzCHq9Nnf8CnTXYB/x
	5SYprTqJyx9jTva6hscBzEvvBmYb7C/kr+P0rf38=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iNTLiRTcvadRSTZ5JQ6M6ariXFG4IkE5JIrXYLFNzls=;
	b=k5FmpAoQqCNFczkjc4AcCeEwtV2pogjaSgwSMGrXl2iolj1WlagAiXgaF44QfXlJ
	PG4d7Gc47eHYqHDQvcP6M2ZvcUz/3kCzgwD2OdG1FgINgDEUSnhlvblEk6MHvAZhdNs
	8AgFWt13nzsgtBBsK2XKOkqXtPS6L6G6pmLm2RRk=
Content-Type: multipart/mixed; boundary="===============2912825299343070440=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.8.1 SUCCEEDED
Message-ID: <0101018657afff39-4c888350-2485-4bb2-8b4c-20c1e1dac691-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177260

--===============2912825299343070440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libhandy-upgrade-1.8.0-1.8.1.patch
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
--===============2912825299343070440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 72 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 189 Local 25 Mirrors 0 Missed 164 Current 413 (13% match, 72% complete)
Removing 6 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 9 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 536 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/zstd/1.5.2-r0/temp/log.do_packagedata_setscene.113666
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 592 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3/3.11.1-r0/temp/log.do_packagedata_setscene.113668
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 593 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 911 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 912 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 913 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_fetch)
NOTE: Running task 916 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_fetch)
NOTE: Running task 917 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_fetch)
NOTE: Running task 922 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 924 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 929 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_fetch)
NOTE: Running task 940 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_fetch)
NOTE: Running task 948 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 951 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 956 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 957 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 958 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 959 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 960 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_fetch)
NOTE: Running task 977 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_fetch)
NOTE: Running task 982 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 992 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1024 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1037 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_fetch)
NOTE: Running task 1073 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_fetch)
NOTE: Running task 1077 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1082 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1083 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1084 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1085 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1086 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1087 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1092 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_write_config)
NOTE: Running task 1114 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: Running task 1117 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1118 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1119 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: Running task 1120 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_unpack)
NOTE: Running task 1121 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_unpack)
NOTE: Running task 1122 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1123 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1124 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_unpack)
NOTE: Running task 1125 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1126 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1127 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_unpack)
NOTE: Running task 1128 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1129 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1130 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: Running task 1131 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1132 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: Running task 1133 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_unpack)
NOTE: Running task 1134 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1135 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: Running task 1136 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_unpack)
NOTE: Running task 1137 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Started
NOTE: Running task 1188 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_write_config)
NOTE: Running task 1191 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1210 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1211 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1212 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: Running task 1217 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: Running task 1238 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Started
NOTE: Running task 1243 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1244 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1245 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1246 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1247 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1248 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1249 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1250 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1251 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1252 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1263 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1264 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1269 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_fetch)
NOTE: Running task 1270 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe zstd-1.5.2-r0: task do_package_setscene: Started
NOTE: Running task 1271 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: Running task 1302 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: Running task 1303 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_write_config)
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Started
NOTE: Running task 1304 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: Running task 1305 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1306 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 1307 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: Running task 1308 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1309 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1310 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1311 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_patch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: Running task 1312 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1313 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Started
NOTE: Running task 1314 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 1315 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1316 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 1317 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: Running task 1318 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: Running task 1320 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1321 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_patch)
NOTE: Running task 1322 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1323 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running task 1324 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1325 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1326 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: Running task 1327 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1328 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: Running task 1329 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: Running task 1330 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_patch)
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1331 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_patch)
NOTE: Running task 1332 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 1333 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1334 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1335 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1336 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1337 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.39-r0: task do_patch: Started
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1338 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1339 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_patch)
NOTE: Running task 1340 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1341 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1343 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1344 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: Running task 1345 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1346 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: Running task 1347 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Started
NOTE: recipe libpng-1.6.39-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1348 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 1349 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: Running task 1350 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1351 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1352 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1353 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1354 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Succeeded
NOTE: Running task 1355 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1356 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_deploy_source_date_epoch)
NOTE: Running task 1361 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_generate_toolchain_file)
NOTE: Running task 1362 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe dbus-1.14.4-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1363 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_patch)
NOTE: Running task 1364 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1365 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1366 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1368 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1369 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1370 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 1372 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.4-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1373 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 1374 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1375 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 1377 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1378 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1379 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_patch)
NOTE: Running task 1380 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1381 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 1382 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4817efef4b707245ab88d5266d93bb6526fbc3fb945995561611618574018e1c
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1384 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1385 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: Running task 1386 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1387 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1388 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Started
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic unihash changed to 66e31215262f1462dd15100d490d1e83eba0b9e6837c8c969d56fb345cfdabd7
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 1390 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 1393 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1395 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1396 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1397 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1400 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9c037122271d20eab942bcef627c8daf1e16fc02b8b7bbc0edd2c42912c38dbc
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 595 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1679 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1684 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1686 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1695 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1699 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1733 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1736 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1741 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1756 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1757 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1800 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1801 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1808 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1809 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1829 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata)
NOTE: Running task 1846 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1851 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: Running task 1853 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_configure)
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1857 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_configure)
NOTE: recipe libpng-1.6.39-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1859 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1860 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1861 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: Running task 1862 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1864 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: Running task 1867 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 1868 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Started
NOTE: Running task 1870 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Started
NOTE: recipe libxml2-2.10.3-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1874 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 1875 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 1876 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1877 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package unihash changed to af381379c2cdbdb307b1c5450e25d0830c694dd03c09e8d5835fcf13212aa6e0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1880 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: Running task 1881 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Succeeded
NOTE: Running task 1882 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1883 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: Running task 1884 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1885 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1886 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1887 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot)
NOTE: Running task 1888 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1889 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1890 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1891 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1892 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Succeeded
NOTE: Running task 1893 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1894 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 1895 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe libpng-1.6.39-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 1897 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 1898 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 1900 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 1901 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: Running task 1903 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: Running task 1905 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1906 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_compile: Succeeded
NOTE: Running task 1907 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_install)
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_install: Started
NOTE: Running task 1908 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1910 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1911 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_install: Succeeded
NOTE: Running task 1912 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot)
NOTE: Running task 1913 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_package)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1915 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: Running task 1916 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: Running task 1917 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: Running task 1918 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1919 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1920 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1921 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1922 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1923 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: Running task 1924 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1925 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_configure)
NOTE: recipe freetype-2.12.1-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1926 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1927 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1928 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1929 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1930 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe libpng-1.6.39-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: Running task 1931 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1932 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_compile)
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1934 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1935 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1937 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1938 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Succeeded
NOTE: Running task 1939 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1940 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1941 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1942 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1943 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1944 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: Running task 1945 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1947 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1948 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1949 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.115-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot)
NOTE: Running task 1951 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_compile)
NOTE: recipe freetype-2.12.1-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1954 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1955 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_package: Succeeded
NOTE: Running task 1956 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1957 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1958 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1959 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe freetype-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1960 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_install)
NOTE: recipe freetype-2.12.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1961 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1964 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: Running task 1965 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1966 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe freetype-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1967 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 1968 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_package)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1969 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1970 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_configure: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_package: Succeeded
NOTE: Running task 1971 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package unihash changed to 234994d7d85dc74d49ba796f7b1c78b17923ece30c546faf130219f72d8bb97d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata became valid
NOTE: Running setscene task 602 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1972 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1973 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile)
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1975 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: Running task 1976 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1977 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_configure)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1978 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1979 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 1980 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package unihash changed to df1e5b596051a4b1d59785508896c144c6ff0559a09c9dd702e7cf03afb19ea8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1982 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1983 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1984 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1985 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1986 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1991 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 1992 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 1993 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 1994 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1996 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to a924d81bfbb644139c4225010b1af80076853056aa2f2f45cba50845405f3a5a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1997 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1998 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 1999 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: Running task 2001 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2002 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2003 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2004 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2005 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2006 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_configure)
NOTE: Running task 2007 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2008 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile_ptest_base)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2009 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2010 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: Running task 2012 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2013 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2014 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: Running task 2015 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 2016 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2017 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_compile)
NOTE: Running task 2018 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2019 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_install: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2022 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot)
NOTE: Running task 2024 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_package)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 2026 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 2028 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 2029 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 2030 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_package: Succeeded
NOTE: Running task 2032 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2033 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2034 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package)
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Failed
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2034 tasks of which 1672 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-src went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dbg went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-staticdev went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dev went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-doc went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-locale went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package libzstd went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vala/0.56.3-r0/temp/log.do_packagedata.268640
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata) failed with exit code '1'

--===============2912825299343070440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libhandy: SRC_URI changed from "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=main" to "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-8"
packages/core2-32-poky-linux/libhandy: PACKAGES: added "libhandy-locale-ru"
packages/core2-32-poky-linux/libhandy: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGSIZE changed from 2276036 to 2275864 (-0%)
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dev: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-doc: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-doc: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-examples: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ca: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ca: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-cs: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-cs: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-de: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-de: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fa: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fa: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-gl: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-gl: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-hr: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-hr: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-hu: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-hu: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ka: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ka: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ko: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ko: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-nl: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-nl: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-oc: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-oc: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sr: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sr: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sv: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sv: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-tr: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-tr: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-zh-cn: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-zh-cn: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGSIZE changed from 3572947 to 3572778 (-0%)
packages/core2-32-poky-linux/libhandy/libhandy-src: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/libhandy/libhandy: PKGV changed from 1.8.0 [default] to 1.8.1 [default]

--===============2912825299343070440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1694 targets, 49 skipped, 0 masked, 0 errors.
Removing 92 recipes from the core2-32 sysroot...done.
Removing 91 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 365 Local 195 Mirrors 0 Missed 170 Current 212 (53% match, 70% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 213 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 214 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 672 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 704 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 736 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 737 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 738 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 739 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_fetch)
NOTE: Running task 740 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_fetch)
NOTE: Running task 741 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_fetch)
NOTE: Running task 742 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 744 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 747 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_fetch)
NOTE: Running task 752 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_fetch)
NOTE: Running task 757 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 761 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 766 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 767 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 768 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_fetch)
NOTE: Running task 769 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 770 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 778 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_fetch)
NOTE: Running task 779 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 789 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 800 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 819 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 841 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_fetch)
NOTE: Running task 843 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 852 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 853 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 854 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 855 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 856 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 857 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 858 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 860 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_write_config)
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Started
NOTE: Running task 906 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_write_config)
NOTE: Running task 909 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 932 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 971 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Started
NOTE: Running task 972 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: Running task 977 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 978 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 979 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 980 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Started
NOTE: Running setscene task 414 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 417 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 981 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: Running task 982 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 983 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 984 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: Running setscene task 418 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 990 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_unpack)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 991 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_unpack)
NOTE: Running setscene task 422 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running task 996 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 997 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 999 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: Running task 1002 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1003 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running task 1004 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1005 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1006 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Started
NOTE: Running task 1007 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: Running task 1008 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1009 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: Running task 1010 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Started
NOTE: Running task 1011 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1012 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 1015 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_unpack)
NOTE: Running task 1016 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1018 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 1020 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: Running task 1021 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: Running task 1022 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: Running task 1023 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: Running task 1024 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1025 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: Running task 1026 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 1027 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1030 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: Running task 1034 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1035 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1036 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1037 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1038 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1039 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1040 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1043 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: Running task 1052 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1053 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: Running task 1058 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3/3.11.1-r0/temp/log.do_packagedata_setscene.279614
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Started
NOTE: Running setscene task 423 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 426 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: Running setscene task 427 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1059 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running setscene task 429 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: Running setscene task 431 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 433 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running task 1067 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: Running task 1071 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1072 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_patch)
NOTE: Running task 1073 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_patch)
NOTE: Running task 1074 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1076 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_patch)
NOTE: Running task 1079 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: Running task 1080 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: Running task 1081 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1082 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: Running task 1083 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_patch)
NOTE: Running task 1084 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_patch)
NOTE: Running task 1085 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running task 1086 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1087 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1090 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_patch)
NOTE: Running task 1093 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: Running task 1094 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: Running task 1095 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 1096 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: Running task 1098 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 1099 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 1100 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1101 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: Running task 1102 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1103 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1104 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1105 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 1106 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1107 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_patch: Started
NOTE: Running task 1108 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe freetype-2.12.1-r0: task do_patch: Started
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Started
NOTE: Running task 1109 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1110 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: Running task 1112 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 1113 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.4-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: Running task 1114 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: Running task 1115 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 1116 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Started
NOTE: Running task 1117 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1118 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_deploy_source_date_epoch)
NOTE: Running task 1119 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1120 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 1121 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1122 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: Running task 1123 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running task 1128 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 1129 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch)
NOTE: Running task 1130 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 461 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1151 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1152 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1157 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1158 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1159 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1160 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1161 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 1162 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1164 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1165 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1166 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_generate_toolchain_file)
NOTE: Running task 1167 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: Running task 1169 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1170 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: Running task 1171 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1172 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: Running task 1173 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 1174 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1175 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: Running task 1176 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: Running task 1177 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1190 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1206 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: Running task 1211 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_write_config)
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1212 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: Running task 1213 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: Running task 1214 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1215 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1216 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 1217 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1218 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1219 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1229 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1230 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1231 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1232 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1233 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1234 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 472 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1239 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1240 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1241 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Started
NOTE: Running task 1242 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1243 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1252 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1253 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1254 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1255 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 1256 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1257 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1258 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic unihash changed to 66e31215262f1462dd15100d490d1e83eba0b9e6837c8c969d56fb345cfdabd7
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1259 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 1260 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 484 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1265 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1274 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 492 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7c30c18a412f80b8d2e7b1f81942aab64f121c9686db2bdafc9ea4c65d7863f8
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 552 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1547 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1628 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1629 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1631 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1637 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1640 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1667 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1668 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1671 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1679 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1682 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1703 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1705 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1706 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1732 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata)
NOTE: Running task 1737 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1742 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1750 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: Running task 1751 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_configure: Started
NOTE: Running task 1752 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1753 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1754 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4df38cbfcaf6d2c234ceb05b9afdc13533e483ab7f104a794420e68a37a61fb2
NOTE: Running task 1755 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1756 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: Running task 1757 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: Running task 1758 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe libxml2-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: Running task 1760 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Started
NOTE: Running task 1761 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1763 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe libxml2-2.10.3-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1764 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: Running task 1765 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1766 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 1767 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1768 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 1769 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 1770 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: Running task 1772 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1774 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Succeeded
NOTE: Running task 1776 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: Running task 1777 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1778 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1779 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1780 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1781 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1782 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1784 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot)
NOTE: Running task 1785 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1786 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Succeeded
NOTE: Running task 1788 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Running task 1789 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_configure: Succeeded
NOTE: Running task 1790 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: Running task 1791 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: Running task 1793 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1794 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: Running task 1795 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1797 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxml2-2.10.3-r0: task do_configure: Succeeded
NOTE: Running task 1798 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_configure_ptest_base)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.10.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.10.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1799 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_compile)
NOTE: recipe libxml2-2.10.3-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1800 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1801 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: Running task 1802 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_configure)
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1803 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1804 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 1805 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1807 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1808 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 1809 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 1810 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Succeeded
NOTE: Running task 1811 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: Running task 1812 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1813 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1814 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1815 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1816 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1817 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1818 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1819 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1820 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libpng-1.6.39-r0: task do_install: Succeeded
NOTE: Running task 1821 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot)
NOTE: Running task 1822 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_package)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1823 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Succeeded
NOTE: Running task 1824 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_compile)
NOTE: Running task 1825 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 1826 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1827 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1828 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1829 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1830 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: Running task 1831 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Succeeded
NOTE: Running task 1833 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_install)
NOTE: recipe libdrm-2.4.115-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1834 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1835 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1836 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1837 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1838 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1839 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.115-r0: task do_install: Succeeded
NOTE: Running task 1840 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot)
NOTE: Running task 1841 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1842 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1843 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: Running task 1844 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1845 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1846 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_package: Succeeded
NOTE: Running task 1847 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1848 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_compile)
NOTE: recipe freetype-2.12.1-r0: task do_compile: Started
NOTE: recipe libxml2-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1849 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_compile_ptest_base)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1850 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe libxml2-2.10.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.10.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1851 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libxml2-2.10.3-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1853 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure_ptest_base)
NOTE: Running task 1854 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1855 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1856 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1857 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: Running task 1858 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe libxml2-2.10.3-r0: task do_install: Succeeded
NOTE: Running task 1859 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_install_ptest_base)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_install_ptest_base: Started
NOTE: Running task 1860 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1861 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1862 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1863 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1864 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1865 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_install)
NOTE: recipe freetype-2.12.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1866 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1867 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 1868 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_package)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1869 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1870 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1871 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1874 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1875 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1876 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: Running task 1878 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe freetype-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 1879 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 1881 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 1882 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: Running task 1883 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1884 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1885 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: Running task 1886 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1887 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1888 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 1889 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 1890 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1891 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1893 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1894 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 1896 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1897 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: Running task 1898 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 1899 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_install: Succeeded
NOTE: Running task 1900 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1901 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot)
NOTE: Running task 1902 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1903 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: Running task 1904 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 1906 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1908 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1909 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package)
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_install: Succeeded
NOTE: Running task 1910 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot)
NOTE: Running task 1911 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_package)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Succeeded
NOTE: Running task 1912 of 2039 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Failed
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_package: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_install_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 1912 tasks of which 1538 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 83 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-src went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-dbg went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-lib went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-common went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-tools went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-ptest went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-staticdev went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-dev went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-doc went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus-locale went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: QA Issue: Package version for package dbus went backwards which would break package feeds (from 0:1.14.6-r0 to 0:1.14.4-r0) [version-going-backwards]
ERROR: dbus-1.14.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/dbus/1.14.4-r0/temp/log.do_packagedata.424212
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata) failed with exit code '1'

--===============2912825299343070440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1693 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 187 Local 23 Mirrors 0 Missed 164 Current 419 (12% match, 72% complete)
Removing 8 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 543 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.2-r0/temp/log.do_packagedata_setscene.3804938
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 599 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3/3.11.1-r0/temp/log.do_packagedata_setscene.3804940
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 600 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_setscene)
NOTE: Running task 916 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 917 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 918 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_fetch)
NOTE: Running task 921 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_fetch)
NOTE: Running task 922 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_fetch)
NOTE: Running task 927 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 929 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 934 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_fetch)
NOTE: Running task 945 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_fetch)
NOTE: Running task 953 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 956 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 961 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 962 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 963 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 964 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_fetch)
NOTE: Running task 965 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 982 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_fetch)
NOTE: Running task 987 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 997 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1029 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1042 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_fetch)
NOTE: Running task 1078 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_fetch)
NOTE: Running task 1082 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1089 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1090 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1091 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1092 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1093 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1094 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1099 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_write_config)
NOTE: Running task 1119 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1122 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1123 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Started
NOTE: Running task 1125 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_unpack)
NOTE: Running task 1126 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1127 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1128 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_unpack)
NOTE: Running task 1129 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: Running task 1130 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1131 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1132 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_unpack)
NOTE: Running task 1133 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1134 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: Running task 1135 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_unpack)
NOTE: Running task 1136 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1137 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1155 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Started
NOTE: Running task 1156 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_unpack)
NOTE: Running task 1157 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1158 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Succeeded
NOTE: Running task 1194 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_write_config)
NOTE: Running task 1197 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1205 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: Running task 1225 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: Running task 1262 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1263 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1264 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1265 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1266 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1267 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1268 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1269 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1270 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1271 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1282 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1283 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1288 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_fetch)
NOTE: Running task 1289 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 1290 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: Running task 1298 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1322 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1323 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_write_config)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: Running task 1324 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_package_setscene: Started
NOTE: Running task 1325 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1326 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Started
NOTE: Running task 1327 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Succeeded
NOTE: Running task 1328 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: Running task 1329 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Started
NOTE: Running task 1330 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 1331 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: Running task 1332 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1333 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: Running task 1334 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: Running task 1335 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: Running task 1336 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 1337 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Started
NOTE: Running task 1338 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1339 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 1340 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: Running task 1342 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: Running task 1343 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: Running task 1344 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Succeeded
NOTE: Running task 1345 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1346 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1347 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: Running task 1348 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running task 1349 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running task 1350 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1351 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 1352 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_unpack)
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Started
NOTE: Running task 1353 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: Running task 1355 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1356 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 1357 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1358 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: Running task 1359 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1360 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_patch: Succeeded
NOTE: Running task 1361 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1362 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Succeeded
NOTE: Running task 1363 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1364 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Succeeded
NOTE: Running task 1365 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1366 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1367 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1368 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1369 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1371 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: Running task 1372 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: Running task 1373 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1374 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1379 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: Running task 1380 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1381 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_generate_toolchain_file)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: Running task 1382 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1383 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1384 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1385 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1386 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1388 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1389 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1390 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1391 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1392 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1393 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1394 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1396 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.4-r0: task do_patch: Succeeded
NOTE: Running task 1397 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1399 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 1400 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1401 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 1403 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1404 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1405 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 1406 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1407 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1408 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 797a1f60b029d1426fd5844d9372e793307380323e335de4e341b3b4b719d326
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: Running task 1409 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1410 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1411 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1412 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic unihash changed to 66e31215262f1462dd15100d490d1e83eba0b9e6837c8c969d56fb345cfdabd7
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 1413 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1414 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1415 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 1416 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1417 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1418 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1419 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1420 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1421 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 1422 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1423 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3263d406b861519abafcb566ea589932eb9a2e7bc2c259532ce6d560ec9d798e
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 602 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1697 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1702 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1704 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1713 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1717 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1751 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1754 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1759 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1774 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1775 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1818 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1819 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1826 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1827 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1847 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1864 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1869 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: Running task 1871 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1874 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1875 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1876 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_configure)
NOTE: recipe libpng-1.6.39-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1877 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1880 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Started
NOTE: Running task 1881 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1882 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: Running task 1883 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: Running task 1884 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Started
NOTE: Running task 1885 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 1886 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1887 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1888 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1889 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 1890 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_install)
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: Running task 1891 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Started
NOTE: recipe libxml2-2.10.3-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1892 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_configure: Started
NOTE: Running task 1893 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 1894 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package unihash changed to 2ab9d1a02cb4eb2748e8fd7dbcf37a0a01e8b5d2ec8c277473226dc798e5b9af
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata became valid
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Succeeded
NOTE: Running task 1900 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1901 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1903 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1904 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1905 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1906 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1907 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1908 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot)
NOTE: Running task 1909 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1910 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.39-r0: task do_configure: Succeeded
NOTE: Running task 1912 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Succeeded
NOTE: Running task 1913 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: Running task 1914 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: Running task 1916 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1917 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: Running task 1919 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 1920 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1921 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1922 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1923 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_install)
NOTE: Running task 1924 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe libpng-1.6.39-r0: task do_install: Started
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1925 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1928 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 1929 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.39-r0: task do_install: Succeeded
NOTE: Running task 1930 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: Running task 1931 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot)
NOTE: Running task 1932 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1933 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1934 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1935 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1936 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: Running task 1937 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1938 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1939 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1940 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1941 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_configure)
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1942 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1943 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1944 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1945 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 1946 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1947 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Succeeded
NOTE: Running task 1948 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Started
NOTE: Running task 1949 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1950 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Succeeded
NOTE: Running task 1951 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_compile)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1952 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Succeeded
NOTE: Running task 1953 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libdrm-2.4.115-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1955 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1956 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1957 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_install: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: Running task 1958 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot)
NOTE: Running task 1959 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1960 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1961 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1962 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1963 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1964 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1965 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1966 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1967 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1968 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: Running task 1969 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1970 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_compile)
NOTE: recipe freetype-2.12.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1972 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1973 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_package: Succeeded
NOTE: Running task 1974 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1975 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe freetype-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1977 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_install)
NOTE: recipe freetype-2.12.1-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1978 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1979 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 1980 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1981 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1982 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1983 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1984 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 1985 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1986 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1987 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1988 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1989 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile)
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1991 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1992 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_configure)
NOTE: recipe libxml2-2.10.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package unihash changed to 218112a051fbb84578f358e1a79eb4040e5965a6021643935206934a1fbb6e03
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata became valid
NOTE: Running setscene task 606 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1994 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: Running task 1995 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1996 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1997 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 1998 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package unihash changed to ae4f39bf52b5ad4edce452a2b1c88fbda3c46729ab2fe5951cf91f56bfd0f76b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2000 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2001 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2002 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: Running task 2004 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 2006 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2007 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2008 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2009 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2010 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 2011 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 2012 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2013 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2015 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2016 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_compile: Succeeded
NOTE: Running task 2017 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile_ptest_base)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2018 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2019 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to e9400929e9af9cdc99be73527dc3eb44a62c26249278d16585d019b07b99da54
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2020 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2022 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2024 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe systemd-1_252.5-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2026 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Started
NOTE: Running task 2027 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2028 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2029 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: Running task 2030 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: Running task 2031 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2032 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: Running task 2033 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2034 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2035 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 2036 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2037 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: Running task 2038 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_install: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Succeeded
NOTE: Running task 2039 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2040 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_install: Succeeded
NOTE: Running task 2041 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot)
NOTE: Running task 2042 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_package)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Started
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2043 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 2044 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_install)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 2046 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 2047 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2048 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2050 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2051 of 2139 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package)
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Failed
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2051 tasks of which 1690 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-src went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dbg went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-staticdev went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dev went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-doc went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-locale went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package libzstd went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vala/0.56.3-r0/temp/log.do_packagedata.3959433
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata) failed with exit code '1'

--===============2912825299343070440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libhandy: PACKAGES: added "libhandy-locale-ru"

--===============2912825299343070440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 55 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 190 Local 26 Mirrors 0 Missed 164 Current 412 (13% match, 72% complete)
Removing 2 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 8 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 536 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/zstd/1.5.2-r0/temp/log.do_packagedata_setscene.3970090
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 592 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 911 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 912 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 913 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_fetch)
NOTE: Running task 916 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_fetch)
NOTE: Running task 917 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3/3.11.1-r0/temp/log.do_packagedata_setscene.3970092
NOTE: Running task 922 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 924 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 929 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_fetch)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 593 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_setscene)
NOTE: Running task 940 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_fetch)
NOTE: Running task 948 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 951 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 956 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 957 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 958 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 959 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 960 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_fetch)
NOTE: Running task 977 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_fetch)
NOTE: Running task 982 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 992 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1024 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1037 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_fetch)
NOTE: Running task 1073 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_fetch)
NOTE: Running task 1077 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1082 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1083 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1084 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1085 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1086 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1087 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1092 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_write_config)
NOTE: Running task 1113 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: Running task 1116 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1117 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1118 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1119 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Started
NOTE: Running task 1120 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1121 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1122 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1123 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_unpack)
NOTE: Running task 1124 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_unpack)
NOTE: Running task 1125 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1126 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1127 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1128 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1129 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1130 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: Running task 1131 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_unpack)
NOTE: Running task 1132 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_unpack)
NOTE: Running task 1133 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1134 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1135 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_unpack)
NOTE: Running task 1136 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1157 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1189 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_write_config)
NOTE: Running task 1192 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1211 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: Running task 1212 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1213 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 1214 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1215 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Succeeded
NOTE: Running task 1216 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 1221 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1246 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1247 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1248 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1249 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1250 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1251 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1252 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1253 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1254 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1255 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1266 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1267 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1272 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_fetch)
NOTE: Running task 1273 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1274 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe zstd-1.5.2-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: Running task 1305 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Started
NOTE: Running task 1306 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 1307 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: Running task 1308 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 1309 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Started
NOTE: Running task 1310 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: Running task 1311 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 1312 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 1313 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1314 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Started
NOTE: Running task 1315 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1316 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: Running task 1317 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: Running task 1318 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: Running task 1319 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1320 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 1321 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running task 1322 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1323 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 1325 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1326 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_patch)
NOTE: Running task 1327 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: Running task 1328 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Succeeded
NOTE: Running task 1329 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: Running task 1330 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1331 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.39-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: Running task 1333 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1334 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Started
NOTE: Running task 1336 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1337 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Started
NOTE: Running task 1338 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1339 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1342 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1345 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 1346 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libpng-1.6.39-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1347 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 1348 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1350 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Succeeded
NOTE: Running task 1351 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1352 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1353 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1354 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1355 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1356 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1357 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: Running task 1358 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_patch: Started
NOTE: Running task 1359 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1360 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 1361 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1362 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1363 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_generate_toolchain_file)
NOTE: Running task 1364 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1365 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1366 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.4-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1368 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Started
NOTE: Running task 1369 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1370 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1371 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1372 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1373 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 1374 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.4-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1376 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 1377 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1378 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1379 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: Running task 1380 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1381 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: Running task 1382 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1384 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1385 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1386 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7a3ecd0453329f08fc7dc59198cc5dbb9d428c1b9dd44663a3e9a6b0049f23f1
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1387 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1388 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1389 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic unihash changed to 66e31215262f1462dd15100d490d1e83eba0b9e6837c8c969d56fb345cfdabd7
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 1390 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1395 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1396 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1397 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1399 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e9c1144ea2419bed6d0fc635780029749c392f66d9ede00d45690172e50f2dbd
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 595 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1679 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1684 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1686 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1695 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1699 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1733 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1736 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1741 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1756 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1757 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1800 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1801 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1808 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1809 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1829 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1846 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1851 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1853 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_configure)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1857 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libpng-1.6.39-r0: task do_configure: Started
NOTE: Running task 1859 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1860 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: Running task 1861 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_configure)
NOTE: Running task 1862 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1864 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_configure)
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: Running task 1865 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: Running task 1867 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1868 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: Running task 1869 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 1870 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_compile)
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: Running task 1872 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 1873 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libxml2-2.10.3-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1874 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 1875 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 1876 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package unihash changed to 81b2445a70e5355d58f356eadedd2e959914e226d14cbc18e7c61c340c91b856
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1880 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1881 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Succeeded
NOTE: Running task 1882 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1883 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1886 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1887 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1888 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1889 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot)
NOTE: Running task 1890 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1891 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1892 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Succeeded
NOTE: Running task 1893 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 1894 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.39-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 1897 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: Running task 1898 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 1899 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 1903 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_install)
NOTE: Running task 1905 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libpng-1.6.39-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1906 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1907 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: Running task 1908 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: Running task 1909 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1910 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe libpng-1.6.39-r0: task do_install: Succeeded
NOTE: Running task 1911 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot)
NOTE: Running task 1912 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_package)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_package: Started
NOTE: Running task 1913 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: Running task 1914 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1915 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1916 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: Running task 1917 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1918 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1919 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1920 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1921 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1922 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1923 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1924 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1925 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1926 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: Running task 1927 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1928 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1929 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1930 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Succeeded
NOTE: Running task 1931 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1932 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_compile)
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1934 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1935 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1937 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1938 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1939 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1940 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1941 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe libdrm-2.4.115-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1942 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1943 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1944 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1945 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1947 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1948 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1949 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 1950 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.115-r0: task do_install: Succeeded
NOTE: Running task 1951 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot)
NOTE: Running task 1952 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe freetype-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1954 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe freetype-2.12.1-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1955 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1956 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe libdrm-2.4.115-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: Running task 1957 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1958 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 1959 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe freetype-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1960 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_install: Started
NOTE: Running task 1962 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1964 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1965 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe freetype-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1966 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 1967 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_package)
NOTE: recipe libxml2-2.10.3-r0: task do_package: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package unihash changed to 34fbdc887230b7d8087e679b856e8dc800978d505a8e7d47c46a75524f1259da
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata became valid
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running setscene task 602 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running task 1968 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1970 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: Running task 1971 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1972 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1973 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1974 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure_ptest_base)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1975 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile)
NOTE: recipe dbus-1.14.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1976 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1977 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_configure)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1978 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1979 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 1980 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package unihash changed to c8dfed1eb046145ada9499b1b4248c52a09d21c1322a752e64a206e649b8af27
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1982 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1983 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1984 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1985 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1986 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: Running task 1989 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1991 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 1992 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 1993 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 1994 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1995 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1996 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1997 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 1998 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: Running task 1999 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2000 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to cee70a4a03e644290a0adf251e3294426c82367aeb20f994622522a67964bd26
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2001 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2003 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2005 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: Running task 2006 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2007 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe systemd-1_252.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2008 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: Running task 2009 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2010 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2012 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2013 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile_ptest_base)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2014 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2015 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install)
NOTE: Running task 2016 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: Running task 2017 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 2018 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2019 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_install: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2022 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot)
NOTE: Running task 2024 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_package)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 2026 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 2027 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 2028 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2029 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2032 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Succeeded
NOTE: Running task 2033 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2034 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 2035 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Running task 2036 of 2121 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Failed
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2036 tasks of which 1672 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-src went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dbg went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-staticdev went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dev went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-doc went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-locale went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package libzstd went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vala/0.56.3-r0/temp/log.do_packagedata.4124048
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata) failed with exit code '1'

--===============2912825299343070440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 65 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4444f8821a91ebf21b9304d2198f2e4f4c5b1021"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 189 Local 25 Mirrors 0 Missed 164 Current 409 (13% match, 72% complete)
Removing 1 stale sstate objects for arch x86_64...done.
Removing 6 stale sstate objects for arch mips32r2...done.
Removing 9 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 532 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/zstd/1.5.2-r0/temp/log.do_packagedata_setscene.4136247
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 588 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 911 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 912 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 913 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_fetch)
NOTE: Running task 915 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_fetch)
NOTE: Running task 916 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_fetch)
NOTE: Running task 919 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 921 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 926 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_fetch)
NOTE: Running task 936 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_fetch)
NOTE: Running task 944 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 947 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 952 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 953 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 954 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 955 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 956 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_fetch)
NOTE: Running task 973 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_fetch)
NOTE: Running task 978 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 988 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1020 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1033 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_fetch)
NOTE: Running task 1069 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_fetch)
NOTE: Running task 1073 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1078 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1079 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1080 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 1081 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1082 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1083 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1088 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_write_config)
NOTE: Running task 1110 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1113 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1114 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3/3.11.1-r0/temp/log.do_packagedata_setscene.4136249
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 589 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1115 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 1116 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_unpack)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: Running task 1117 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: Running task 1118 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Succeeded
NOTE: Running task 1119 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1120 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_unpack)
NOTE: Running task 1121 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_unpack)
NOTE: Running task 1122 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1123 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1124 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1125 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1126 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1127 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: Running task 1128 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_unpack)
NOTE: Running task 1129 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_unpack)
NOTE: Running task 1130 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 1131 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1132 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_unpack)
NOTE: Running task 1133 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1153 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_unpack)
NOTE: Running task 1185 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_write_config)
NOTE: Running task 1188 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1207 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: Running task 1208 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1209 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1210 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1211 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: Running task 1212 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_package_setscene: Started
NOTE: Running task 1217 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: Running task 1242 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1243 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1244 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1245 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1246 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1247 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1248 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1249 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1250 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1251 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1262 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1263 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1268 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_fetch)
NOTE: Running task 1269 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1270 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Started
NOTE: Running task 1301 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: Running task 1302 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_write_config)
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Started
NOTE: Running task 1303 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 1304 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1305 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: Running task 1306 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: Running task 1307 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1308 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_patch)
NOTE: Running task 1309 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: Running task 1310 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 1311 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 1312 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: Running task 1313 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1314 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 1315 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Started
NOTE: Running task 1316 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.39-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1317 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: Running task 1318 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_patch)
NOTE: Running task 1319 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1320 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1321 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_write_config: Succeeded
NOTE: Running task 1322 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Succeeded
NOTE: Running task 1323 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running task 1324 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: Running task 1325 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: Running task 1326 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_unpack)
NOTE: recipe libhandy-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1327 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 1328 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe libpng-1.6.39-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: Running task 1329 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1330 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1331 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1332 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1333 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe freetype-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1334 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1335 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Started
NOTE: Running task 1337 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe libpng-1.6.39-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 1342 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_patch)
NOTE: Running task 1343 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Succeeded
NOTE: Running task 1344 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_generate_toolchain_file)
NOTE: Running task 1345 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1346 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1347 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1348 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1349 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1350 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1351 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1352 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe fontconfig-2.14.2-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1353 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1355 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_patch: Started
NOTE: Running task 1356 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1358 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 1359 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe freetype-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe dbus-1.14.4-r0: task do_patch: Started
NOTE: Running task 1360 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1361 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1362 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: Running task 1363 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1364 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1365 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1366 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: Running task 1368 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1369 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.4-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 1372 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1373 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1374 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: recipe libhandy-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1377 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: Running task 1378 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 1379 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1380 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0695e9e8b2f4b8b2c4715d4c53efa9be70d0de573463e5a5169889555f05fbb7
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1381 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1383 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libhandy-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1384 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1385 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic)
NOTE: recipe dbus-1.14.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Started
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_lic unihash changed to 66e31215262f1462dd15100d490d1e83eba0b9e6837c8c969d56fb345cfdabd7
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libhandy-1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1388 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1389 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 1390 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1392 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1393 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1394 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-2_22.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1396 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 046205aa66778148b3471ca4f7fc14af418b4fb272b1d1f1c69cf6355dc24e4e
NOTE: recipe mesa-2_22.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 591 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1675 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1680 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1682 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1689 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1693 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1725 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1728 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1731 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1746 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1747 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1788 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1789 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1796 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1797 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1817 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1834 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1838 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1839 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe libpng-1.6.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1842 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_configure)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1843 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1844 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_configure)
NOTE: recipe libpng-1.6.39-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1845 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1846 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1847 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: Running task 1848 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1849 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Started
NOTE: Running task 1850 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: Running task 1852 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1853 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1855 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1857 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1859 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1860 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure)
NOTE: recipe libxml2-2.10.3-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 1861 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 1862 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1863 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package unihash changed to 5a163068ff70f43b722d4cae4385f95f517e608c739ea7cee5af8190fdff2249
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata became valid
NOTE: Running setscene task 595 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1865 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1867 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Succeeded
NOTE: Running task 1868 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1869 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1870 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: Running task 1872 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_install: Succeeded
NOTE: Running task 1873 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot)
NOTE: Running task 1874 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1875 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 1876 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1877 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1878 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_package: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1879 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_install)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Started
NOTE: recipe libpng-1.6.39-r0: task do_configure: Succeeded
NOTE: Running task 1881 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_install: Succeeded
NOTE: Running task 1882 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1883 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_package)
NOTE: Running task 1884 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_package: Succeeded
NOTE: Running task 1886 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_compile: Succeeded
NOTE: Running task 1887 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_install)
NOTE: recipe libpciaccess-0.17-r0: task do_install: Started
NOTE: recipe libpciaccess-0.17-r0: task do_install: Succeeded
NOTE: Running task 1888 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot)
NOTE: Running task 1889 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: Running task 1890 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1891 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1892 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_compile)
NOTE: Running task 1893 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1894 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.39-r0: task do_compile: Succeeded
NOTE: Running task 1895 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_install)
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxshmfence-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1897 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1898 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Started
NOTE: recipe libdrm-2.4.115-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1899 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_configure)
NOTE: recipe libpng-1.6.39-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: Running task 1900 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot)
NOTE: Running task 1901 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Started
NOTE: Running task 1902 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1903 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxshmfence-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1904 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1905 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: Running task 1906 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1907 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1908 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1909 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1910 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1911 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_package: Succeeded
NOTE: Running task 1912 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1913 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1914 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libpng-1.6.39-r0: task do_package: Succeeded
NOTE: Running task 1915 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_package: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Started
NOTE: Running task 1916 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1917 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1918 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_configure: Succeeded
NOTE: Running task 1919 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1920 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1921 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1922 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1923 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_compile: Succeeded
NOTE: Running task 1924 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1925 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libdrm-2.4.115-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1926 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1927 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1928 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libdrm-2.4.115-r0: task do_install: Succeeded
NOTE: Running task 1929 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot)
NOTE: Running task 1930 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1931 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1932 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1933 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1934 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1935 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1937 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1938 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: Running task 1939 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe freetype-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1940 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_compile)
NOTE: recipe freetype-2.12.1-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1941 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1942 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_package: Succeeded
NOTE: Running task 1943 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1945 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1946 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1947 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_install)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Started
NOTE: recipe freetype-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe freetype-2.12.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1951 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1952 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 1953 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.12.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1955 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1956 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1957 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxml2-2.10.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package unihash changed to c298a19fdf4c7b05da7c7ae2eed6591bb68a867308d87158400c63f45daf43e2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata became valid
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 598 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1958 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_configure)
NOTE: recipe dbus-1.14.4-r0: task do_configure: Succeeded
NOTE: Running task 1959 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_configure_ptest_base)
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1961 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1962 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1963 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1964 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata)
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1965 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 1966 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package unihash changed to 931c1c3ea03fa33808b55af51b711ba9153306a6599efc92120515754e4509f3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 595 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1968 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1969 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: Running task 1970 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: Running task 1972 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 1973 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1974 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1975 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1976 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 1977 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_install)
NOTE: Running task 1978 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 1979 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1980 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1981 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1983 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1984 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1985 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1986 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 1987 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 1988 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1989 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1991 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1992 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to c1c801d2e058dea3b2492d35644c25d209cea75783a7e1d085ad74aa18f43dee
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 595 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running task 1993 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1995 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_package)
NOTE: Running task 1996 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1997 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: Running task 1998 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe systemd-1_252.5-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: Running task 1999 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2000 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2001 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 2002 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2003 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2004 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_compile_ptest_base)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2005 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_install: Started
NOTE: recipe dbus-1.14.4-r0: task do_install: Succeeded
NOTE: Running task 2006 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2007 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2008 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: Running task 2009 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_configure: Succeeded
NOTE: Running task 2010 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Started
NOTE: Running task 2011 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 2012 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_install)
NOTE: recipe xrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2013 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_install)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe vala-0.56.3-r0: task do_install: Succeeded
NOTE: Running task 2014 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot)
NOTE: Running task 2015 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot)
NOTE: Running task 2017 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_package)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2018 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2019 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_package)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2021 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_package: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata)
NOTE: Running task 2023 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2024 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: recipe icu-72-1-r0: task do_install: Succeeded
NOTE: Running task 2025 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot)
NOTE: Running task 2026 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2028 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe vala-0.56.3-r0: task do_package: Succeeded
NOTE: Running task 2029 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.2-r0: task do_compile: Succeeded
NOTE: Running task 2030 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2031 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2032 of 2107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Failed
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_package: Succeeded
NOTE: recipe icu-72-1-r0: task do_package: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2032 tasks of which 1658 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-src went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dbg went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-staticdev went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dev went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-doc went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-locale went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package libzstd went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: QA Issue: Package version for package zstd went backwards which would break package feeds (from 0:1.5.4-r0 to 0:1.5.2-r0) [version-going-backwards]
ERROR: zstd-1.5.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.2-r0 to 0:3.11.1-r0) [version-going-backwards]
ERROR: python3-3.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vala/0.56.3-r0/temp/log.do_packagedata.108802
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata) failed with exit code '1'

--===============2912825299343070440==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libhandy-upgrade-1.8.0-1.8.1.patch"

RnJvbSBiMzg0ZGIzZDIxNDA4YzM5OGRlNzAxNTgyNTVmN2YwMWVjZDUzMGQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjA6MzE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJoYW5keTogdXBncmFkZSAxLjguMCAtPiAxLjguMQoKLS0tCiAuLi4vbGliaGFuZHkve2xpYmhh
bmR5XzEuOC4wLmJiID0+IGxpYmhhbmR5XzEuOC4xLmJifSAgICAgICAgIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJoYW5keS97bGliaGFuZHlfMS44LjAuYmIgPT4gbGliaGFuZHlfMS44
LjEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmhhbmR5L2xp
YmhhbmR5XzEuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmhhbmR5L2xpYmhhbmR5XzEu
OC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9t
ZS9saWJoYW5keS9saWJoYW5keV8xLjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21l
L2xpYmhhbmR5L2xpYmhhbmR5XzEuOC4xLmJiCmluZGV4IDJmN2Q0NzI5MGMuLjQxYzhlOWJmYjgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJoYW5keS9saWJoYW5keV8xLjguMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGliaGFuZHkvbGliaGFuZHlfMS44LjEuYmIKQEAg
LTksOCArOSw4IEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01F
L2xpYmhhbmR5Ly0vaXNzdWVzIgogTElDRU5TRSA9ICJMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2
NDUxNmMiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJoYW5k
eS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiZmNlNjNmY2M4NTYy
MWMzM2RhYjg1ZTMyYjM0OWQ3MDdiZjZkMTU1MiIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdu
b21lLm9yZy9HTk9NRS9saWJoYW5keS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPWxpYmhhbmR5
LTEtOCIKK1NSQ1JFViA9ICJmMDZjMWJmYTk1YTMxNjA1NzViMzYzMTVjNmQ5NDM3Mzc2ZDhhZjc3
IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAi
KD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4XSkrKFwuXGQrKSkiCi0tIAoyLjM3LjMKCg==

--===============2912825299343070440==--

