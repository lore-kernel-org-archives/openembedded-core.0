Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB79C678D5
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.10151.1676508397095045285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CID58tEm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018657b002e8-4c5034d3-aa6a-4948-9ec9-29d287ba10c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+DMQ9vqKiwaUUgguy4XiiCevc3Rn5XlLB9RXBEmsVxk=;
	b=CID58tEmdrnrujXvf1NvqliIlMNqbG/eVqkklTkjkqFlKitANMFHdrTeFnt0YYa7
	4bm+dr4ztNovH7bGCb4fcw2xCZpJGqntgrkDNLSbpd3S4kHUIPJv/tXKC3xzARO0+YS
	CWVnqGMwt95ocMrE71QKj4F14guw/WqFEBEqiD3Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+DMQ9vqKiwaUUgguy4XiiCevc3Rn5XlLB9RXBEmsVxk=;
	b=Xv2wNGByYNfFdidxVPUFqSiI7Gp+FWATHWDmBRTCHaGIVj9qVJ9ksbHcu1e90gxw
	Rva0YDVY7JpQBfvb+g2nREcYaf72JsZrVvLOtHKPz/kIkaMwzAwkBkNrxiQ67FVYfKp
	OqfYUn0GbWruzbkXAyCODE0GmeibfomRXLiUSa+U=
Content-Type: multipart/mixed; boundary="===============9105424337063609437=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 7364ce8e266d947be146d635958a7b282752aac6
 SUCCEEDED
Message-ID: <0101018657b002e8-4c5034d3-aa6a-4948-9ec9-29d287ba10c1-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:38 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177267

--===============9105424337063609437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *7364ce8e266d947be146d635958a7b282752aac6* has Succeeded.

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
--===============9105424337063609437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 72 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f85e2fd34544d4d2912624c2b0c81782328e694"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f85e2fd34544d4d2912624c2b0c81782328e694"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 20 Mirrors 0 Missed 34 Current 542 (37% match, 94% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 572 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/util-macros/1_1.19.3-r0/temp/log.do_packagedata_setscene.2491884
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 595 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1433 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1483 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Started
NOTE: Running task 1670 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1758 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: Running task 1826 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: Running task 1862 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: Running task 1948 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1949 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1957 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: Running task 1958 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 1961 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1970 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1971 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2022 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Succeeded
NOTE: Running task 2023 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4817efef4b707245ab88d5266d93bb6526fbc3fb945995561611618574018e1c
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Succeeded
NOTE: Running task 2037 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2038 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2039 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2040 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2041 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c0179771a48bd0faf4968102f4a213cd4acdaae0b5b6bf98c88eddbfb2ba0001
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2042 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9c037122271d20eab942bcef627c8daf1e16fc02b8b7bbc0edd2c42912c38dbc
NOTE: Running task 2045 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2046 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2047 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2048 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2050 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2051 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2052 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2053 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: Running task 2054 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2055 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_compile)
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Succeeded
NOTE: Running task 2056 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2057 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2059 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2061 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2062 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2064 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: Running task 2065 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2066 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2068 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2069 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2070 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2071 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_install)
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2072 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2073 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2074 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2075 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 2076 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata)
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2076 tasks of which 2023 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-src went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dbg went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-staticdev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-doc went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-locale went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/harfbuzz/6.0.0-r0/temp/log.do_packagedata.2513602
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============9105424337063609437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+37df1f2bbc" to "0.0+gitAUTOINC+7364ce8e26"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+37df1f2bbc [default] to 0.0+gitAUTOINC+7364ce8e26 [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+37df1f2bbc" to "0.0+gitAUTOINC+7364ce8e26"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14278652 to 14282192 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+37df1f2bbc" to "0.0+gitAUTOINC+7364ce8e26"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+37df1f2bbc" to "0.0+gitAUTOINC+7364ce8e26"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+37df1f2bbc" to "0.0+gitAUTOINC+7364ce8e26"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+37df1f2bbc" to "0.0+gitAUTOINC+7364ce8e26"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3532984 to 3539478 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+37df1f2bbc" to "0.0+gitAUTOINC+7364ce8e26"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+37df1f2bbc" to "0.0+gitAUTOINC+7364ce8e26"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7044546 to 7073218 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26

--===============9105424337063609437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1694 targets, 49 skipped, 0 masked, 0 errors.
Removing 90 recipes from the core2-32 sysroot...done.
Removing 90 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f85e2fd34544d4d2912624c2b0c81782328e694"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f85e2fd34544d4d2912624c2b0c81782328e694"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 361 Local 324 Mirrors 0 Missed 37 Current 210 (89% match, 93% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 211 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 212 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 221 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 239 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 247 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 248 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 252 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 266 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 286 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 840 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_fetch)
NOTE: Running task 841 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 843 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 844 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 845 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 320 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running task 961 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 964 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 967 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 968 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: Running task 969 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 971 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_fetch)
NOTE: Running task 973 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 989 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 992 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running setscene task 325 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1007 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_write_config)
NOTE: Running task 1009 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1033 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_unpack)
NOTE: Running task 1042 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1043 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: Running setscene task 337 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1049 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Started
NOTE: Running task 1050 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1051 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1057 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Started
NOTE: Running task 1058 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1059 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 353 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1060 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: Running task 1061 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 359 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running task 1076 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxft-1_2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1077 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1078 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running setscene task 364 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 380 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 381 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 383 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1113 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running task 1114 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1116 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 1140 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 413 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1159 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1161 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1163 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1164 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Succeeded
NOTE: Running setscene task 422 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running task 1169 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1170 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1171 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1172 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running setscene task 427 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 430 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1194 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c0179771a48bd0faf4968102f4a213cd4acdaae0b5b6bf98c88eddbfb2ba0001
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1207 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1208 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/util-macros/1_1.19.3-r0/temp/log.do_packagedata_setscene.2524400
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 507 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1263 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
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
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1322 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7c30c18a412f80b8d2e7b1f81942aab64f121c9686db2bdafc9ea4c65d7863f8
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
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
NOTE: Running task 1621 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: Running task 1781 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1793 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1794 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1796 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: Running task 1850 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1857 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4df38cbfcaf6d2c234ceb05b9afdc13533e483ab7f104a794420e68a37a61fb2
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: Running task 1947 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1948 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1949 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1950 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1951 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 1952 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1953 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1954 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_compile)
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1955 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1956 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1957 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1958 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1959 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 1960 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1962 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1965 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: Running task 1966 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1967 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 1968 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: Running task 1969 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1970 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1971 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1972 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: Running task 1973 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 1974 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 1975 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 1976 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 1977 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 1978 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 1979 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1980 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 1981 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1982 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 1983 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 1985 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 1986 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 1987 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 1988 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_install)
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1991 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1992 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1993 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata)
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1994 tasks of which 1889 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-src went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dbg went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-staticdev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-doc went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-locale went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/harfbuzz/6.0.0-r0/temp/log.do_packagedata.2565374
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============9105424337063609437==
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
DISTRO_VERSION       = "4.1+snapshot-1f85e2fd34544d4d2912624c2b0c81782328e694"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f85e2fd34544d4d2912624c2b0c81782328e694"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 19 Mirrors 0 Missed 34 Current 547 (35% match, 94% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 576 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 588 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/util-macros/1_1.19.3-r0/temp/log.do_packagedata_setscene.2425280
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 599 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1433 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1483 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Started
NOTE: Running task 1684 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1776 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1798 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: Running task 1844 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1845 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: Running task 1967 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1968 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1976 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Started
NOTE: Running task 1977 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: Running task 1988 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1989 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Succeeded
NOTE: Running task 2040 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2041 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 797a1f60b029d1426fd5844d9372e793307380323e335de4e341b3b4b719d326
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Succeeded
NOTE: Running task 2055 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2056 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2057 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c0179771a48bd0faf4968102f4a213cd4acdaae0b5b6bf98c88eddbfb2ba0001
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2058 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2059 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2060 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3263d406b861519abafcb566ea589932eb9a2e7bc2c259532ce6d560ec9d798e
NOTE: Running task 2063 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_package: Started
NOTE: Running task 2064 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2065 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2066 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: Running task 2068 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_configure)
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2069 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2070 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2071 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2072 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2073 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_compile)
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Succeeded
NOTE: Running task 2074 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2075 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2076 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2077 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2078 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2079 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2080 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: Running task 2081 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 2082 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2083 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: Running task 2084 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2085 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: Running task 2086 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2087 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2088 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2089 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_install)
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2090 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2091 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2092 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2093 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 2094 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata)
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2094 tasks of which 2041 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-src went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dbg went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-staticdev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-doc went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-locale went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/harfbuzz/6.0.0-r0/temp/log.do_packagedata.2447303
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============9105424337063609437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+37df1f2bbc to 0.0+git0+7364ce8e26

--===============9105424337063609437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f85e2fd34544d4d2912624c2b0c81782328e694"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f85e2fd34544d4d2912624c2b0c81782328e694"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 21 Mirrors 0 Missed 33 Current 542 (38% match, 94% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 572 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/util-macros/1_1.19.3-r0/temp/log.do_packagedata_setscene.2448101
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 595 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1433 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1483 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1670 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1758 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1826 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Succeeded
NOTE: Running task 1827 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1863 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: Running task 1949 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1950 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Started
NOTE: Running task 1958 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: Running task 1961 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: Running task 1970 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1971 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Succeeded
NOTE: Running task 2022 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2023 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7a3ecd0453329f08fc7dc59198cc5dbb9d428c1b9dd44663a3e9a6b0049f23f1
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Succeeded
NOTE: Running task 2037 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2038 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2039 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2040 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Succeeded
NOTE: Running task 2041 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c0179771a48bd0faf4968102f4a213cd4acdaae0b5b6bf98c88eddbfb2ba0001
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2042 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e9c1144ea2419bed6d0fc635780029749c392f66d9ede00d45690172e50f2dbd
NOTE: Running task 2045 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2046 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2047 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2048 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe dbus-1.14.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2050 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_configure)
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2051 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2052 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2053 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2055 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_compile)
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Succeeded
NOTE: Running task 2056 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2057 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2059 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2061 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2062 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 2064 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: Running task 2065 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2066 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2068 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2069 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2070 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2071 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_install)
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2072 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2073 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2074 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2075 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 2076 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata)
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2076 tasks of which 2024 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-src went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dbg went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-staticdev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-doc went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-locale went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/harfbuzz/6.0.0-r0/temp/log.do_packagedata.2469720
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============9105424337063609437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f85e2fd34544d4d2912624c2b0c81782328e694"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f85e2fd34544d4d2912624c2b0c81782328e694"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 20 Mirrors 0 Missed 31 Current 541 (39% match, 94% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 564 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/util-macros/1_1.19.3-r0/temp/log.do_packagedata_setscene.2470576
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 591 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1424 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_fetch)
NOTE: Running task 1470 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1655 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_write_config)
NOTE: Running task 1746 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1812 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_unpack)
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_fetch: Succeeded
NOTE: Running task 1813 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1849 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: Running task 1935 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1936 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Started
NOTE: Running task 1949 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1958 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1959 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2007 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_unpack: Succeeded
NOTE: Running task 2012 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2013 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0695e9e8b2f4b8b2c4715d4c53efa9be70d0de573463e5a5169889555f05fbb7
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Started
NOTE: Running task 2027 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_patch: Succeeded
NOTE: Running task 2028 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2029 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2030 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c0179771a48bd0faf4968102f4a213cd4acdaae0b5b6bf98c88eddbfb2ba0001
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2031 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+7364ce8e26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2032 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 046205aa66778148b3471ca4f7fc14af418b4fb272b1d1f1c69cf6355dc24e4e
NOTE: Running task 2035 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_package)
NOTE: recipe dbus-1.14.4-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2036 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_patch)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2037 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_configure)
NOTE: recipe harfbuzz-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2039 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2040 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_configure: Succeeded
NOTE: Running task 2041 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2042 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_compile)
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.4-r0: task do_package: Succeeded
NOTE: Running task 2043 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_compile: Succeeded
NOTE: Running task 2044 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_install)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_install: Succeeded
NOTE: Running task 2045 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot)
NOTE: Running task 2046 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_package)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2047 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_compile)
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2048 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_install)
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 2050 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package: Succeeded
NOTE: Running task 2051 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2055 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2056 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2057 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_install)
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2058 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2059 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_package)
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2060 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2061 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 2062 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata)
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2062 tasks of which 2014 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-src went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dbg went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-staticdev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-dev went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-doc went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros-locale went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: QA Issue: Package version for package util-macros went backwards which would break package feeds (from 1:1.20.0-r0 to 1:1.19.3-r0) [version-going-backwards]
ERROR: util-macros-1_1.19.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.0.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: harfbuzz-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/harfbuzz/6.0.0-r0/temp/log.do_packagedata.2491028
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============9105424337063609437==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA4ODQ2MWNiOGIzYWYxNmViZDI1NGI4NzdlZDM1YTM1NzUxMGNhNTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjI6MTI6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggMTc3NGQwZmIyMC4uNTk5OGMyM2RjZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW4iCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
LVNSQ1JFViA9ICIzN2RmMWYyYmJjNjg5ZDIyNDM2OWQ5NjNkZDgwMDdkNjhmY2Q3YzZhIgorU1JD
UkVWID0gIjczNjRjZThlMjY2ZDk0N2JlMTQ2ZDYzNTk1OGE3YjI4Mjc1MmFhYzYiCiBQRSA9ICIy
IgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM3LjMKCg==

--===============9105424337063609437==--

