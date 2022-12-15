Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE2DC76196
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.145457.1671136355617640342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iqZhFp2x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185177d1e35-2193d92e-e262-4139-93b4-8195d78cf4c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NnwGITdf4HHHroMzqpZMtFZb/kFtnRPzkwVY07t/LBA=;
	b=iqZhFp2xIxiAyhI+N2MjvTzeKzxDMii1ysNSakFetmYDnXfvuyVbCHPy5gFJ5f+f
	0SrSys4Z+TeExJ3ATBHbi4baEa+7ETgmiK74OEJVt5R+fhlPFkFBfI10DpbO7sgLlgJ
	yJNmbKhsikF9mbZH9V/w5E0RK+zldLVSt2vgzXig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NnwGITdf4HHHroMzqpZMtFZb/kFtnRPzkwVY07t/LBA=;
	b=gFJBlng7Uy/MdbW+BdkO3USe8/Cs6jqLhN5kP8dY50qSun7N7ArscbBmktdEtqyb
	WmbYiObQnd0Zz9DiDRu44VCAi2yD1jwKbEEibF8X4dvxTfkAf32nSBYXqNgO9Vull+n
	Sb+0mpR6YfgwonuxDthI4H8N9f2CTlIQ3dxjYFYM=
Content-Type: multipart/mixed; boundary="===============3876751133631919885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 8acb84ea7f21a581349458a39ec3f889fd525cc5
 SUCCEEDED
Message-ID: <01010185177d1e35-2193d92e-e262-4139-93b4-8195d78cf4c0-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174725

--===============3876751133631919885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *8acb84ea7f21a581349458a39ec3f889fd525cc5* has Succeeded.

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
--===============3876751133631919885==
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
Removing 2 recipes from the qemuppc sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:509fbe78c61f0623285b2395bb6e9e67b2e427e0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 39 Mirrors 0 Missed 39 Current 514 (50% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1434 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1516 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1522 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 1523 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1813 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1830 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 1831 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1877 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1878 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1880 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1891 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 1912 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1930 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: Running task 1981 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Started
NOTE: Running task 1982 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1983 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: Running task 1984 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1985 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 1986 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1987 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1988 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1989 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: Running task 1990 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1991 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1992 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 1993 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: Running task 1994 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1995 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1996 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 1997 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1998 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1999 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2000 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2001 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 2002 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 2003 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: Running task 2004 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Succeeded
NOTE: Running task 2005 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2006 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: Running task 2007 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2008 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Succeeded
NOTE: Running task 2009 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 2010 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2011 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: Running task 2012 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2013 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Started
NOTE: Running task 2014 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: Running task 2015 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e92135585c979ac5637efbcc3074930118b5e3f3c93b381184a4eb9fc918dd56
NOTE: Running task 2016 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2017 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2018 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2019 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2020 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 2021 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2022 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: Running task 2023 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2024 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2025 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: Running task 2027 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: Running task 2028 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2029 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: Running task 2030 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2033 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2034 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2035 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2037 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2038 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2039 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2041 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2042 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2043 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2046 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2047 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: Running task 2048 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2049 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2050 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2051 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2054 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2055 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2056 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2057 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2058 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: Running task 2059 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2060 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2061 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: Running task 2062 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2064 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2065 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2066 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Failed
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2066 tasks of which 1967 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pango/1.50.11-r0/temp/log.do_packagedata.1336877
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata) failed with exit code '1'

--===============3876751133631919885==
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
meta-yocto-bsp       = "tmp-auh-upgrades:509fbe78c61f0623285b2395bb6e9e67b2e427e0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 39 Mirrors 0 Missed 39 Current 518 (50% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1434 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1518 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1524 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 1525 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1831 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1848 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 1849 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1896 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1897 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1898 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1909 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 1930 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1948 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: Running task 1999 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 2000 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 2001 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 2002 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2003 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: Running task 2004 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 2005 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2006 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 2007 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2008 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: Running task 2009 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: Running task 2010 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 2011 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2012 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2013 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2014 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 2015 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: Running task 2016 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 2017 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 2018 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2019 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2020 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Succeeded
NOTE: Running task 2021 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2022 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 2023 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: Running task 2024 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Started
NOTE: Running task 2025 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 2026 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2027 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2028 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2029 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2030 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2031 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2032 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2033 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e92135585c979ac5637efbcc3074930118b5e3f3c93b381184a4eb9fc918dd56
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: Running task 2034 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2035 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 2036 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2037 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 2038 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2039 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: Running task 2040 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2041 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2042 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2043 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2044 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: Running task 2046 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2047 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2048 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2049 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2050 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2051 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2052 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: Running task 2053 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2054 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2055 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2056 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2057 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2059 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2060 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: Running task 2061 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2062 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2064 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2065 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2066 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2067 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2068 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2069 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2070 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2072 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2073 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2074 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2075 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 2076 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2077 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2078 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2079 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2080 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2081 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2082 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2083 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2084 of 2100 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Failed
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2084 tasks of which 1985 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pango/1.50.11-r0/temp/log.do_packagedata.1130931
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata) failed with exit code '1'

--===============3876751133631919885==
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
Removing 2 recipes from the qemumips sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:509fbe78c61f0623285b2395bb6e9e67b2e427e0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 39 Mirrors 0 Missed 39 Current 510 (50% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1426 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1508 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1514 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 1515 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1801 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1818 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 1819 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1865 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1866 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1868 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1879 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 1900 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1915 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Started
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: Running task 1967 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1968 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 1969 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: Running task 1970 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 1972 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1973 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1974 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1975 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1976 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: Running task 1977 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1978 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1979 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 1980 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: Running task 1981 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1982 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 1983 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1984 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 1985 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 1986 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1987 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1988 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: Running task 1989 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1990 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1991 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: Running task 1992 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Started
NOTE: Running task 1993 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 1994 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: Running task 1995 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Succeeded
NOTE: Running task 1996 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1997 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: Running task 1998 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1999 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2000 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2001 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2002 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e92135585c979ac5637efbcc3074930118b5e3f3c93b381184a4eb9fc918dd56
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: Running task 2003 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2004 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2005 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2006 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 2007 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: Running task 2008 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2010 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2011 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: Running task 2013 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: Running task 2014 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2015 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2017 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2018 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2019 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2020 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2021 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2022 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2024 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2026 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2027 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: Running task 2028 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2029 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2032 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2033 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2034 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2035 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2037 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2038 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2039 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2040 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2041 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2042 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2043 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2045 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2046 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2048 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2049 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2050 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2051 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Failed
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2052 tasks of which 1953 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/pango/1.50.11-r0/temp/log.do_packagedata.1264450
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata) failed with exit code '1'

--===============3876751133631919885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+06f6e878a0 [default] to 0.0+gitAUTOINC+8acb84ea7f [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+8acb84ea7f"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14073924 to 14260576 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+8acb84ea7f"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+8acb84ea7f"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+8acb84ea7f"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+8acb84ea7f"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3489298 to 3516252 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+8acb84ea7f"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+8acb84ea7f"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 6909378 to 7032258 (+2%)
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+8acb84ea7f"

--===============3876751133631919885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 106 recipes from the core2-32 sysroot...done.
Removing 113 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:509fbe78c61f0623285b2395bb6e9e67b2e427e0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 378 Local 339 Mirrors 0 Missed 39 Current 189 (89% match, 93% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 191 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 202 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 229 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 785 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 823 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 824 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 825 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running setscene task 267 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 269 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 270 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running task 935 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 936 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 937 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 938 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 939 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 940 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 943 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 944 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 945 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 278 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 286 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: Running task 972 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: Running task 973 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Started
NOTE: Running task 974 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 975 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: Running task 976 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: Running task 977 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 978 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 979 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: Running task 980 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Started
NOTE: Running setscene task 302 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 985 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 994 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 995 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 311 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1000 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: Running setscene task 315 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running task 1015 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 326 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1037 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1038 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1043 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 332 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 333 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1052 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1058 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 1059 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1060 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 355 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Started
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: Running task 1075 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1076 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1077 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 1086 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1087 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 369 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1092 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 375 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 385 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e92135585c979ac5637efbcc3074930118b5e3f3c93b381184a4eb9fc918dd56
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 395 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 401 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 405 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 412 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1188 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 458 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 472 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 491 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 567 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1778 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1787 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1800 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1894 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1895 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1896 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1935 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1937 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1938 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1939 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: Running task 1940 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1941 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1942 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1943 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: Running task 1945 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: Running task 1946 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1947 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1948 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1949 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1951 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: Running task 1954 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1955 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1956 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 1957 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1959 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 1960 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 1961 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1962 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1963 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 1964 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 1965 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 1966 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1967 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1968 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 1969 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1970 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 1971 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 1972 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1973 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 1974 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1975 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 1976 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1977 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 1978 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 1979 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1980 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 1981 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1982 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1983 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 1984 of 2000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Failed
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1984 tasks of which 1885 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pango/1.50.11-r0/temp/log.do_packagedata.1415473
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata) failed with exit code '1'

--===============3876751133631919885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAwMWNiMjc5Y2Q2MDIwYjE2ZjFjN2NkODBhM2Y0ODQ5OTYwODUyNDQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTg6NDU6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggNjE1ZWIxYmI3Ny4uZTg0YTg1NmI1NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW4iCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
LVNSQ1JFViA9ICIwNmY2ZTg3OGEwYjU4OGM1MTMwMjRjMzQ5OGI2OGEzYzg3NTk0YWI3IgorU1JD
UkVWID0gIjhhY2I4NGVhN2YyMWE1ODEzNDk0NThhMzllYzNmODg5ZmQ1MjVjYzUiCiBQRSA9ICIy
IgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM3LjMKCg==

--===============3876751133631919885==
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
Removing 2 recipes from the qemuarm sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:509fbe78c61f0623285b2395bb6e9e67b2e427e0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 39 Mirrors 0 Missed 39 Current 514 (50% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1434 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1516 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1522 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_fetch)
NOTE: Running task 1523 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1813 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1830 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_write_config)
NOTE: Running task 1831 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 1877 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1879 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 1880 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1891 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_fetch)
NOTE: Running task 1912 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1930 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe pango-1.50.11-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: Running task 1981 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1982 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Started
NOTE: Running task 1983 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 1985 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: Running task 1986 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1987 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: Running task 1988 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1989 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_fetch: Succeeded
NOTE: Running task 1990 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1991 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running task 1992 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_unpack)
NOTE: Running task 1993 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1994 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 1995 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.11-r0: task do_unpack: Started
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1996 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 1997 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1998 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: Running task 1999 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2000 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 2001 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2002 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 2003 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2004 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe pango-1.50.11-r0: task do_unpack: Succeeded
NOTE: Running task 2005 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_unpack: Succeeded
NOTE: Running task 2006 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: Running task 2007 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe pango-1.50.11-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2008 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2009 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 2010 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2011 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2012 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: Running task 2013 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2014 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2015 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.11-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2016 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e92135585c979ac5637efbcc3074930118b5e3f3c93b381184a4eb9fc918dd56
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8acb84ea7f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2017 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2018 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2019 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2020 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe pango-1.50.11-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_unpack: Succeeded
NOTE: Running task 2021 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_patch)
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_patch: Succeeded
NOTE: Running task 2022 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2023 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2024 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2025 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2026 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe pango-1.50.11-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_configure_ptest_base)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2029 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2033 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2034 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2035 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2037 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2038 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2039 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2041 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2042 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2043 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2046 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2047 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 2048 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2049 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2050 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2051 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2052 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_compile: Succeeded
NOTE: Running task 2054 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2055 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install)
NOTE: recipe pango-1.50.11-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 2056 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2057 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_install: Succeeded
NOTE: Running task 2058 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2059 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot)
NOTE: Running task 2060 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_package)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 2061 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2062 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2064 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2065 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_configure)
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Started
NOTE: recipe pango-1.50.11-r0: task do_package: Succeeded
NOTE: Running task 2066 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata)
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata: Failed
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.35-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2066 tasks of which 1967 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.12-r0 to 0:1.50.11-r0) [version-going-backwards]
ERROR: pango-1.50.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pango/1.50.11-r0/temp/log.do_packagedata.1199201
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata) failed with exit code '1'

--===============3876751133631919885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+8acb84ea7f

--===============3876751133631919885==--

