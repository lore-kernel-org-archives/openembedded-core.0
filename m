Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ACCC38A05
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.354.1664643228374630011
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QBEIbGtf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101839477e4da-5196809b-c190-4e68-b904-00685dac1e50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=34EIZJQtbKPocSbiIUfOkgc5tfmcAYbLSe0ots4UVbo=;
	b=QBEIbGtfdprkEKhVZ8IUKzoSPslsf34EXLiHhUK0/lL+xBbzK+3H86/T57PyiYGG
	O3E9AZRfuxqZJMiKzSlOxuuBVQk0QbXiIcqSV+TBkp8z+Qm5QiTCgPd0ynLcupO2VfX
	goH6dlK+P7Fb94g46fbTMmhCwbQRxFIWxsQ6ER3M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=34EIZJQtbKPocSbiIUfOkgc5tfmcAYbLSe0ots4UVbo=;
	b=bMt23BaaSQxkpoxrFj+ex6I6ShBIIY5if6BOkFYMwaxHSL9GwMIdcCODLOL1j9xS
	mxfQLfbjPaNKrIHI+ahTwTYuMOXOGtwgCSHjgAYoL/sTn87HAH7VTLgWqIBgm2PS2Hl
	Dcjtc28MCPgkoUikV5unSyYgvljNZLx7YQhsc5vQ=
Content-Type: multipart/mixed; boundary="===============7489580003080781152=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 27dd36e3e642d255702789423bb001b3ff08e8e3
 SUCCEEDED
Message-ID: 
 <010101839477e4da-5196809b-c190-4e68-b904-00685dac1e50-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171335

--===============7489580003080781152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *27dd36e3e642d255702789423bb001b3ff08e8e3* has Succeeded.

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
--===============7489580003080781152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+8399cff6a3-r0'])", added "puzzles (['= 2:0.0+git0+27dd36e3e6-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+8399cff6a3-r0'])", added "puzzles-dev (['= 2:0.0+git0+27dd36e3e6-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6

--===============7489580003080781152==
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
meta-yocto-bsp       = "tmp-auh-upgrades:4f52522ec1d6459770ff71a2c615623a163fde85"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 96 Local 40 Mirrors 0 Missed 56 Current 505 (41% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 514 of 601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running task 1537 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1652 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 1653 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: Running task 1758 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1837 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 1838 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 1841 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: Running task 1852 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1857 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_fetch)
NOTE: Running task 1861 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1862 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1863 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1864 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1870 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1871 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1872 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1877 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_fetch)
NOTE: Running task 1896 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1897 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_write_config)
NOTE: Running task 1909 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1910 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.545636
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 600 of 601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Started
NOTE: Running task 1938 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 1939 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: Running task 1940 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1941 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: Running task 1942 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: Running task 1943 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1944 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: Running task 1945 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1946 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1947 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 1948 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1949 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1950 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1951 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_unpack)
NOTE: Running task 1952 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 1953 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1954 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1955 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1956 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1957 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: Running task 1958 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_patch)
NOTE: Running task 1959 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1960 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1961 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1962 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 1963 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: Running task 1964 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: Running task 1965 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1966 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1967 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1968 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1969 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1970 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1971 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1972 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Succeeded
NOTE: Running task 1973 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1974 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: Running task 1975 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1976 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1977 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1978 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: Running task 1979 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1980 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1981 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1982 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: Running task 1983 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Started
NOTE: Running task 1984 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1985 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to fcfa1593201011f7e9f681e67d2b12c2a204ac3a0554126a03842a813a876ed0
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2016 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: Running task 2019 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2023 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Succeeded
NOTE: Running task 2029 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_patch)
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2030 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2031 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Succeeded
NOTE: Running task 2032 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2034 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2035 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2036 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2037 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2038 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2039 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 2041 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2042 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2043 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: Running task 2046 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2047 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2048 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2049 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: Running task 2050 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2051 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2052 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2053 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2054 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2055 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: Running task 2056 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2057 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2058 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2059 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2060 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2061 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2062 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2064 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2065 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 2066 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2067 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2068 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2069 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2070 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: Running task 2071 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2072 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 2073 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 2074 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 2075 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2076 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: Running task 2077 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2078 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2079 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 2080 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2081 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2082 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2083 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2084 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: Running task 2085 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_configure)
NOTE: Running task 2086 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2087 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 2088 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Succeeded
NOTE: Running task 2089 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Succeeded
NOTE: Running task 2090 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Succeeded
NOTE: Running task 2091 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_populate_sysroot)
NOTE: Running task 2092 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_package)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2093 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Succeeded
NOTE: Running task 2097 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2098 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2099 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2100 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_configure)
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2102 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_compile)
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Succeeded
NOTE: Running task 2104 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_install)
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Succeeded
NOTE: Running task 2105 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_populate_sysroot)
NOTE: Running task 2106 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_package)
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2107 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2108 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Succeeded
NOTE: Running task 2110 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Succeeded
NOTE: Running task 2111 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Succeeded
NOTE: Running task 2113 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2116 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2117 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2117 tasks of which 1954 didn't need to be rerun and all succeeded.
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

--===============7489580003080781152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+8399cff6a3 [default] to 0.0+gitAUTOINC+27dd36e3e6 [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+27dd36e3e6"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+27dd36e3e6"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 13529192 to 13652176 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+27dd36e3e6"
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+8399cff6a3-r0'])", added "puzzles (['= 2:0.0+git0+27dd36e3e6-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+27dd36e3e6"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+27dd36e3e6"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+27dd36e3e6"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3484474 to 3486803 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+8399cff6a3-r0'])", added "puzzles-dev (['= 2:0.0+git0+27dd36e3e6-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+27dd36e3e6"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+27dd36e3e6
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+27dd36e3e6"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 6720962 to 6774210 (+1%)

--===============7489580003080781152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA4ZDQ1NDY0N2M4M2NiMWVkZDA4NDBkMmJkNmYwNjc5MjE1Y2U1NmI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNDozMzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA5ZTliY2QyZWVmLi43MmQzNTg5ZDhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbiIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgot
U1JDUkVWID0gIjgzOTljZmY2YTNiOWJmMTVjNmQxZDllMGM5MDVkMTQxMWYyNWY5YjgiCitTUkNS
RVYgPSAiMjdkZDM2ZTNlNjQyZDI1NTcwMjc4OTQyM2JiMDAxYjNmZjA4ZThlMyIKIFBFID0gIjIi
CiBQViA9ICIwLjArZ2l0JHtTUkNQVn0iCiAKLS0gCjIuMzEuMQoK

--===============7489580003080781152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 94 recipes from the core2-32 sysroot...done.
Removing 93 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:4f52522ec1d6459770ff71a2c615623a163fde85"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 387 Local 327 Mirrors 0 Missed 60 Current 189 (84% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 191 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package_setscene)
NOTE: Running setscene task 227 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 236 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running task 806 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 858 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 859 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: Running task 912 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 945 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 946 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 947 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: Running task 948 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 949 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_fetch)
NOTE: Running task 950 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 951 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 952 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 953 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 954 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 957 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_fetch)
NOTE: Running task 958 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 959 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_write_config)
NOTE: Running task 960 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_write_config)
NOTE: Running task 961 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 962 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: Running task 965 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Succeeded
NOTE: Running task 966 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 967 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 968 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 969 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: Running task 970 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 971 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: Running task 972 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_fetch)
NOTE: Running task 973 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_unpack)
NOTE: Running task 974 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 975 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Started
NOTE: Running task 976 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: Running setscene task 288 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Succeeded
NOTE: Running task 977 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_unpack)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running setscene task 292 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: Running setscene task 300 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 991 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running task 997 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_unpack)
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 998 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 999 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: Running task 1001 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1003 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Succeeded
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Started
NOTE: Running task 1004 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 1005 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_patch)
NOTE: Running task 1006 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running setscene task 312 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Started
NOTE: Running task 1011 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 317 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1016 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 320 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1026 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1027 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1028 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 327 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1029 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1030 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1031 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 331 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Started
NOTE: recipe mesa-2_22.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1035 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1036 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1038 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1039 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 334 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1040 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1041 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 341 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running task 1058 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: Running setscene task 351 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1079 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe mesa-2_22.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 362 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1087 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1088 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running task 1089 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1090 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1091 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 374 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1096 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 378 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 385 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.682881
NOTE: Running setscene task 394 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 396 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to fcfa1593201011f7e9f681e67d2b12c2a204ac3a0554126a03842a813a876ed0
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1162 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 433 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 453 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1198 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Started
NOTE: Running setscene task 474 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 489 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 493 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Succeeded
NOTE: Running setscene task 503 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1251 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 517 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 576 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1807 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1820 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1835 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1862 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1870 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: Running task 1875 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1901 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1902 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1903 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1922 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1923 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1932 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1933 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: Running task 1934 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1935 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: Running task 1937 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1938 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: Running task 1939 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1940 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1941 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 1942 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1943 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1945 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1946 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1947 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 1948 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 1949 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1951 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1952 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 1955 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1956 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1957 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 1958 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1960 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 1961 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 1962 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: Running task 1964 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1965 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: Running task 1966 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1967 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: Running task 1968 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1969 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: Running task 1970 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: Running task 1971 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 1972 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1973 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1974 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1975 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 1976 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 1977 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1978 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 1980 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1981 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 1982 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 1983 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 1985 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 1986 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1988 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 1989 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 1991 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1992 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: Running task 1993 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 1994 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1996 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 1997 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1998 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1999 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2000 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2001 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2002 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2003 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 2005 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: Running task 2006 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Succeeded
NOTE: Running task 2007 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Succeeded
NOTE: Running task 2008 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Succeeded
NOTE: Running task 2009 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_populate_sysroot)
NOTE: Running task 2010 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_package)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2011 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2012 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2013 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Succeeded
NOTE: Running task 2015 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2017 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2018 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2019 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_configure)
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Succeeded
NOTE: Running task 2021 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_compile)
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Succeeded
NOTE: Running task 2022 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_install)
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_populate_sysroot)
NOTE: Running task 2024 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_package)
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2025 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2026 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Succeeded
NOTE: Running task 2028 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Succeeded
NOTE: Running task 2029 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Succeeded
NOTE: Running task 2030 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Succeeded
NOTE: Running task 2031 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Succeeded
NOTE: Running task 2032 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Succeeded
NOTE: Running task 2033 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2034 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2035 of 2035 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2035 tasks of which 1852 didn't need to be rerun and all succeeded.
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

--===============7489580003080781152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:4f52522ec1d6459770ff71a2c615623a163fde85"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 222 Local 215 Mirrors 0 Missed 7 Current 383 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2008 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Succeeded
NOTE: Running task 2121 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2122 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Succeeded
NOTE: Running task 2123 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Succeeded
NOTE: Running task 2124 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2125 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2126 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2127 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Succeeded
NOTE: Running task 2128 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Succeeded
NOTE: Running task 2129 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Succeeded
NOTE: Running task 2130 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2131 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Succeeded
NOTE: Running task 2132 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2132 tasks of which 2119 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+8399cff6a3-r0 to 2:0.0+git0+27dd36e3e6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+8399cff6a3-r0 to 2:0.0+git0+27dd36e3e6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+8399cff6a3-r0 to 2:0.0+git0+27dd36e3e6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+8399cff6a3-r0 to 2:0.0+git0+27dd36e3e6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+8399cff6a3-r0 to 2:0.0+git0+27dd36e3e6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+8399cff6a3-r0 to 2:0.0+git0+27dd36e3e6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+8399cff6a3-r0 to 2:0.0+git0+27dd36e3e6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/puzzles/2_0.0+gitAUTOINC+27dd36e3e6-r0/temp/log.do_packagedata.150393
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============7489580003080781152==
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
meta-yocto-bsp       = "tmp-auh-upgrades:4f52522ec1d6459770ff71a2c615623a163fde85"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 96 Local 40 Mirrors 0 Missed 56 Current 505 (41% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 514 of 601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running task 1537 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1652 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 1653 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1758 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: Running task 1836 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1837 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 1838 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 1841 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: Running task 1852 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1857 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_fetch)
NOTE: Running task 1860 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1861 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1863 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1864 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1865 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1866 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1872 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1877 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_fetch)
NOTE: Running task 1896 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1897 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_write_config)
NOTE: Running task 1909 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1910 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1938 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.282330
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 600 of 601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: Running task 1939 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: Running task 1940 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 1941 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: Running task 1942 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Started
NOTE: Running task 1943 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1944 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_unpack)
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: Running task 1945 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Succeeded
NOTE: Running task 1946 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1947 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 1948 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1949 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1950 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1951 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_unpack)
NOTE: Running task 1952 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 1953 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1954 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1955 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 1956 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: Running task 1957 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: Running task 1958 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: Running task 1959 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1960 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: Running task 1961 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1962 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 1963 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 1964 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1965 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: Running task 1966 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1967 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1968 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: Running task 1969 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1970 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1971 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1973 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1974 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1975 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1976 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1977 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: Running task 1978 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1979 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1980 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1981 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1982 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1983 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 1984 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1985 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to fcfa1593201011f7e9f681e67d2b12c2a204ac3a0554126a03842a813a876ed0
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2016 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: Running task 2019 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Succeeded
NOTE: Running task 2028 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2029 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Started
NOTE: Running task 2030 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Succeeded
NOTE: Running task 2031 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2032 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2034 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2035 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2036 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2037 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2038 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2039 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 2040 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2041 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2042 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2043 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: Running task 2046 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2047 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2048 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2049 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2050 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2051 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2052 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: Running task 2053 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2055 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2056 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2057 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: Running task 2058 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2059 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2060 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2061 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2062 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2064 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: Running task 2065 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 2066 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2067 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2068 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: Running task 2069 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2070 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2071 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2072 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 2073 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 2074 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 2075 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2076 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: Running task 2077 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2078 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 2079 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2080 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2081 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2082 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2083 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2084 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2085 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2086 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 2087 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: Running task 2088 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Succeeded
NOTE: Running task 2089 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Succeeded
NOTE: Running task 2090 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Succeeded
NOTE: Running task 2091 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_populate_sysroot)
NOTE: Running task 2092 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_package)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2093 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Succeeded
NOTE: Running task 2097 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2098 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2099 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2100 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_configure)
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2102 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_compile)
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Succeeded
NOTE: Running task 2104 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_install)
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Succeeded
NOTE: Running task 2105 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_populate_sysroot)
NOTE: Running task 2106 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_package)
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2107 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2108 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Succeeded
NOTE: Running task 2110 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Succeeded
NOTE: Running task 2111 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Succeeded
NOTE: Running task 2113 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2116 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2117 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2117 tasks of which 1954 didn't need to be rerun and all succeeded.
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

--===============7489580003080781152==
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
meta-yocto-bsp       = "tmp-auh-upgrades:4f52522ec1d6459770ff71a2c615623a163fde85"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 97 Local 41 Mirrors 0 Missed 56 Current 508 (42% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 517 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1537 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1654 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 1655 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: Running task 1764 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.150808
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 604 of 605 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 1846 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1847 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: Running task 1848 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: Running task 1849 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1850 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1859 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 1860 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 1861 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 1864 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: Running task 1875 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1876 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1881 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_fetch)
NOTE: Running task 1885 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1886 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1887 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1888 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1894 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1899 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_fetch)
NOTE: Running task 1918 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1919 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_write_config)
NOTE: Running task 1931 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1932 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1960 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Succeeded
NOTE: Running task 1961 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Started
NOTE: Running task 1962 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Started
NOTE: Running task 1963 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_unpack)
NOTE: Running task 1964 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1965 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1966 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1967 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1968 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 1969 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: Running task 1970 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1971 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: Running task 1972 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 1973 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Started
NOTE: Running task 1974 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1975 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 1976 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 1977 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1978 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 1980 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 1981 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: Running task 1982 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Started
NOTE: Running task 1983 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: Running task 1984 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1985 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1986 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1987 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: Running task 1988 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1989 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: Running task 1990 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: Running task 1991 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Succeeded
NOTE: Running task 1992 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1993 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1994 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: Running task 1995 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1996 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1997 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Succeeded
NOTE: Running task 1998 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1999 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2000 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: Running task 2001 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2002 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2003 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2034 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Succeeded
NOTE: Running task 2036 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to fcfa1593201011f7e9f681e67d2b12c2a204ac3a0554126a03842a813a876ed0
NOTE: Setscene tasks completed
NOTE: Running task 2037 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2046 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2047 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2048 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Succeeded
NOTE: Running task 2049 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Succeeded
NOTE: Running task 2050 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2051 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2052 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2055 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2056 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 2057 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2058 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2059 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2060 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2061 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2062 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2064 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2066 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: Running task 2067 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2068 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: Running task 2069 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2070 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2071 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: Running task 2072 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2073 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2074 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2075 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: Running task 2076 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2077 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2078 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2079 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2080 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2081 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2082 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 2083 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2084 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2085 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2086 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 2087 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2088 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 2089 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: Running task 2090 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2091 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 2092 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 2093 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2094 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: Running task 2095 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2096 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 2097 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2098 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2099 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2100 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2101 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2102 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 2103 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2104 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: Running task 2106 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Succeeded
NOTE: Running task 2107 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Succeeded
NOTE: Running task 2108 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Succeeded
NOTE: Running task 2109 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_populate_sysroot)
NOTE: Running task 2110 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_package)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2111 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2112 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2113 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2114 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Succeeded
NOTE: Running task 2115 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2116 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2117 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2118 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2119 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_configure)
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2120 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Succeeded
NOTE: Running task 2121 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_compile)
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Succeeded
NOTE: Running task 2122 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_install)
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Succeeded
NOTE: Running task 2123 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_populate_sysroot)
NOTE: Running task 2124 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_package)
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2125 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2126 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Succeeded
NOTE: Running task 2127 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Succeeded
NOTE: Running task 2128 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Succeeded
NOTE: Running task 2130 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Succeeded
NOTE: Running task 2131 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Succeeded
NOTE: Running task 2132 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Succeeded
NOTE: Running task 2133 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2134 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2135 of 2135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2135 tasks of which 1972 didn't need to be rerun and all succeeded.
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

--===============7489580003080781152==
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
meta-yocto-bsp       = "tmp-auh-upgrades:4f52522ec1d6459770ff71a2c615623a163fde85"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 96 Local 40 Mirrors 0 Missed 56 Current 501 (41% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 510 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: Running task 1527 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_fetch)
NOTE: Running task 1640 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_fetch)
NOTE: Running task 1641 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1746 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Started
NOTE: Running task 1824 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_write_config)
NOTE: Running task 1826 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 1829 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_fetch)
NOTE: Running task 1840 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1845 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_fetch)
NOTE: Running task 1849 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1850 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1851 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1852 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1858 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_write_config)
NOTE: Running task 1863 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_fetch)
NOTE: Running task 1882 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 1883 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_write_config)
NOTE: Running task 1895 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1896 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1902 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_unpack)
NOTE: Running task 1903 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Started
NOTE: recipe pango-1.50.9-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1924 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: Running task 1925 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: Running task 1926 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.216.0-r0/temp/log.do_packagedata_setscene.413853
NOTE: Running task 1927 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running setscene task 596 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package_setscene)
NOTE: recipe pango-1.50.9-r0: task do_write_config: Started
NOTE: recipe atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Started
NOTE: recipe atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1928 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_unpack)
NOTE: recipe gtk+3-3.24.34-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe pango-1.50.9-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1929 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: Running task 1930 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_unpack)
NOTE: Running task 1931 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1932 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_patch)
NOTE: Running task 1933 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 1934 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 1935 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: Running task 1936 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1937 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1938 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_unpack)
NOTE: Running task 1939 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 1940 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1941 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Started
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1942 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1943 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: Running task 1944 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1945 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_patch)
NOTE: Running task 1946 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_patch)
NOTE: Running task 1947 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 1948 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_generate_toolchain_file)
NOTE: Running task 1949 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1950 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 1951 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_patch)
NOTE: Running task 1952 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1953 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.38.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Started
NOTE: Running task 1954 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1955 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1956 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1957 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: Running task 1958 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1959 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_patch: Succeeded
NOTE: Running task 1960 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1961 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1962 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1963 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1964 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1965 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1966 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1967 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1968 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: Running task 1969 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 1970 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Started
NOTE: Running task 1971 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to fcfa1593201011f7e9f681e67d2b12c2a204ac3a0554126a03842a813a876ed0
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2002 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2004 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: Running task 2005 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2014 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_unpack: Succeeded
NOTE: Running task 2015 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2016 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Started
NOTE: recipe pango-1.50.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: Running task 2017 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure)
NOTE: recipe pango-1.50.9-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2019 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2020 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_install: Succeeded
NOTE: Running task 2022 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot)
NOTE: Running task 2023 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2024 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe pango-1.50.9-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_package: Succeeded
NOTE: Running task 2027 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Started
NOTE: Running task 2028 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile)
NOTE: recipe pango-1.50.9-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2029 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_install)
NOTE: recipe atk-2.38.0-r0: task do_install: Started
NOTE: recipe atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_package)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2032 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2033 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 2034 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2035 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2036 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 2037 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2038 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: Running task 2039 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 2041 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2042 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2043 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: Running task 2044 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2045 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2046 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2047 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe atk-2.38.0-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: Running task 2050 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: Running task 2051 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 2052 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2053 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2055 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 2056 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2057 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe pango-1.50.9-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2059 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install)
NOTE: recipe pango-1.50.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2061 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2062 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe pango-1.50.9-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2064 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot)
NOTE: Running task 2065 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_package)
NOTE: recipe pango-1.50.9-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Started
NOTE: Running task 2066 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2068 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2069 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2070 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2071 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: Running task 2072 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: Running task 2073 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_package: Succeeded
NOTE: Running task 2074 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata)
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_configure: Succeeded
NOTE: Running task 2075 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_compile: Succeeded
NOTE: Running task 2076 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_install: Succeeded
NOTE: Running task 2077 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_populate_sysroot)
NOTE: Running task 2078 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_package)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2079 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2080 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2081 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_package: Succeeded
NOTE: Running task 2082 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2083 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2084 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 2085 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2086 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2087 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_configure)
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 2088 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_configure: Succeeded
NOTE: Running task 2089 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_compile)
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_compile: Succeeded
NOTE: Running task 2090 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_install)
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_install: Succeeded
NOTE: Running task 2091 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_populate_sysroot)
NOTE: Running task 2092 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_package)
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2093 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.34-r0: task do_package: Succeeded
NOTE: Running task 2098 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata: Succeeded
NOTE: Running task 2099 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package: Succeeded
NOTE: Running task 2100 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_packagedata: Succeeded
NOTE: Running task 2101 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2102 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+27dd36e3e6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2103 of 2103 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2103 tasks of which 1940 didn't need to be rerun and all succeeded.
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

--===============7489580003080781152==--

