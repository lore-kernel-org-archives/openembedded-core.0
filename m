Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF1FC6FD20
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.30007.1675272855312608339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T/kq2y2Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101860e0b26d0-06d1ea36-3942-48fc-a046-722ab435a3b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EYF9R36XNhpE6/aOChgBCk2NiNz6+yYZNwYjBtwsruo=;
	b=T/kq2y2QZsB/0I+vqqFHYobPLmBo5Ff8H2xSoVgFegV8WxPHbEFbsDdIfiuLGfGz
	M09K7bTgfFwS5kdIkRWAmX0ZJHyu4LphgMzEnVpdMlNsA73vtmmjds8b+6tBD8TTIal
	2EUWYqA8WE1ZAUSk8S9eWpa2U065XSzmdwVmbIyU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EYF9R36XNhpE6/aOChgBCk2NiNz6+yYZNwYjBtwsruo=;
	b=juq+H/R0vWCGk5GU7ZpJv0loH4MGh7M1OsAwP2CpYqrZKJ1osEbEJwk3LwH6XUwS
	HMCBeXsa8pRYSeErqO9Vigwo0igJLXRNaouNLq7Dg0lhMs4ub8rQf9mrNCrDfcWO4Mz
	BHT8FHJlPGmo891a2DqWlKYZ9l26AlDaeJNKPMhU=
Content-Type: multipart/mixed; boundary="===============7201675083987800761=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20230127 SUCCEEDED
Message-ID: <010101860e0b26d0-06d1ea36-3942-48fc-a046-722ab435a3b2-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176630

--===============7201675083987800761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ltp* to *20230127* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20220930-20230127.patch
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
--===============7201675083987800761==
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
meta-yocto-bsp       = "tmp-auh-upgrades:09701b9df4394cf891bb086914b7900595f58fdf"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 17 Mirrors 0 Missed 91 Current 561 (15% match, 86% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
Removing 5 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 565 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/btrfs-tools/6.1.2-r0/temp/log.do_packagedata_setscene.1777098
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 663 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_setscene)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_252.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_252.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_252.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1347 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_setscene: Started
NOTE: Running task 1373 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1374 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1376 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: Running task 1496 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/systemd/1_252.4-r0/temp/log.do_packagedata_setscene.1777317
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 667 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_package_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 1571 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1594 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: Running task 1606 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1615 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1634 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1635 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1636 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1637 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: Running task 1668 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1671 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_fetch)
NOTE: Running task 1680 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_fetch)
NOTE: Running task 1726 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1727 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1761 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 1792 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1793 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 1805 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1806 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1807 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 1809 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_fetch)
NOTE: Running task 1810 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_fetch)
NOTE: Running task 1811 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: recipe systemd-1_252.4-r0: task do_package_setscene: Started
NOTE: Running task 1813 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1849 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: Running task 1856 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe liburcu-0.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_unpack)
NOTE: Running task 1873 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: Running task 1897 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1898 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_fetch: Succeeded
NOTE: recipe ltp-20230127-r0: task do_fetch: Started
NOTE: Running task 1915 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: Running task 1934 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 1935 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-12.1-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: Running task 1962 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe cpio-2.13-r0: task do_fetch: Started
NOTE: Running task 1983 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: Running task 1987 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe liburcu-0.13.2-r0: task do_unpack: Started
NOTE: recipe gdb-12.1-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: Running task 1988 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 1996 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 1997 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_unpack)
NOTE: Running task 1998 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230127-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe cpio-2.13-r0: task do_fetch: Succeeded
NOTE: Running task 1999 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_unpack)
NOTE: Running task 2004 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_unpack)
NOTE: Running task 2005 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2012 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: Running task 2013 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_unpack: Started
NOTE: Running task 2050 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2077 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: Running task 2100 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: Running task 2101 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 2106 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe ltp-20230127-r0: task do_unpack: Started
NOTE: Running task 2110 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2111 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe cpio-2.13-r0: task do_unpack: Started
NOTE: Running task 2112 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2113 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe gdb-12.1-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: Running task 2114 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: Running task 2115 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2117 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.13.2-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2118 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: Running task 2119 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2120 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_patch)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2122 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: Running task 2123 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2124 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: Running task 2125 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2126 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe cpio-2.13-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2127 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_patch)
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cpio-2.13-r0: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2128 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2129 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.13.2-r0: task do_patch: Succeeded
NOTE: Running task 2130 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2131 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: Running task 2132 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2133 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2134 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2135 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 2136 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2137 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2138 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2139 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2140 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2141 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2142 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2143 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: recipe cpio-2.13-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2144 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2145 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2146 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2147 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_patch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 2148 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: Running task 2149 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2150 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2151 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2152 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20230127-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_configure)
NOTE: Running task 2154 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_patch)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: Running task 2155 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe ltp-20230127-r0: task do_patch: Started
NOTE: recipe cpio-2.13-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2156 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2157 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: Running task 2158 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_deploy_source_date_epoch)
NOTE: Running task 2160 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2161 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Started
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 2162 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic unihash changed to 87e3982a3a8d914a089a32e03f65aecb958f66025e4541972d254fd052c1b199
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2163 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2164 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 2165 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 2166 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe systemd-1_252.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2185 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata)
NOTE: Running task 2186 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: Running task 2188 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2189 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2190 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-12.1-r0: task do_patch: Started
NOTE: recipe systemd-1_252.4-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 2192 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2193 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe ltp-20230127-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2194 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2195 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: Running task 2196 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe systemd-1_252.4-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe gdb-12.1-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: Running task 2199 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2200 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2202 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2203 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2204 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 2205 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2209 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2210 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2211 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2213 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: Running task 2214 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2216 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2218 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: Running task 2219 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2220 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 2221 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2222 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2223 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2224 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2225 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_configure: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: Running task 2226 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2227 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe liburcu-0.13.2-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2228 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2229 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2230 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2231 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2234 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2235 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2236 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2237 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2240 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: Running task 2241 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2243 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_install)
NOTE: recipe liburcu-0.13.2-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2244 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2245 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2246 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.2-r0: task do_install: Succeeded
NOTE: Running task 2247 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_populate_sysroot)
NOTE: Running task 2248 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_package)
NOTE: recipe liburcu-0.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.13.2-r0: task do_package: Started
NOTE: recipe liburcu-0.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2249 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2250 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2251 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: Running task 2252 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2253 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2254 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_configure)
NOTE: recipe ltp-20230127-r0: task do_configure: Succeeded
NOTE: Running task 2255 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_configure: Started
NOTE: recipe ltp-20230127-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2256 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2258 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: Running task 2259 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2260 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2261 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe liburcu-0.13.2-r0: task do_package: Succeeded
NOTE: Running task 2262 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_packagedata)
NOTE: recipe liburcu-0.13.2-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2263 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2264 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2265 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2266 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: Running task 2268 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2269 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2270 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2271 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_package)
NOTE: Running task 2272 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_populate_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2273 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: Running task 2274 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2275 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2276 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2277 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2279 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2280 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2281 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install: Started
NOTE: recipe cpio-2.13-r0: task do_configure: Succeeded
NOTE: Running task 2282 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_compile)
NOTE: recipe cpio-2.13-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_install: Succeeded
NOTE: Running task 2283 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe cpio-2.13-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_install)
NOTE: recipe cpio-2.13-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm unihash changed to 20cb8267c41c5ee5c9b7813fbfea98c2a35fe7713f76d55ed1797ae651520a3e
NOTE: recipe cpio-2.13-r0: task do_install: Succeeded
NOTE: Running task 2285 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package)
NOTE: recipe cpio-2.13-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2287 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2288 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2289 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Succeeded
NOTE: Running task 2290 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2291 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: Running task 2292 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe cpio-2.13-r0: task do_package: Succeeded
NOTE: Running task 2294 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2295 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe cpio-2.13-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe cpio-2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2296 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2297 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_configure: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_compile)
NOTE: Running task 2299 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2300 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Succeeded
NOTE: Running task 2301 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2302 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2303 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm)
NOTE: Running task 2304 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: Running task 2305 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm unihash changed to a907eb0602f188af78ca62eb5272c29eed8ac708d7086c6cf60d12dbfb989822
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: Running task 2308 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 2309 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2310 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_compile: Succeeded
NOTE: Running task 2311 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_install: Succeeded
NOTE: Running task 2312 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_package)
NOTE: Running task 2313 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_populate_sysroot)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2314 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_configure)
NOTE: recipe gdb-12.1-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_package: Succeeded
NOTE: Running task 2316 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata: Succeeded
NOTE: recipe gdb-12.1-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_compile)
NOTE: recipe gdb-12.1-r0: task do_compile: Started
NOTE: recipe gdb-12.1-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_install)
NOTE: recipe gdb-12.1-r0: task do_install: Started
NOTE: recipe gdb-12.1-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_package)
NOTE: recipe gdb-12.1-r0: task do_package: Started
NOTE: recipe gdb-12.1-r0: task do_package: Succeeded
NOTE: Running task 2320 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_packagedata)
NOTE: recipe gdb-12.1-r0: task do_packagedata: Started
NOTE: recipe gdb-12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2321 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_package_write_rpm)
NOTE: recipe gdb-12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdb-12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_install)
NOTE: recipe ltp-20230127-r0: task do_install: Started
NOTE: recipe ltp-20230127-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package)
NOTE: Running task 2324 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_sysroot)
NOTE: recipe ltp-20230127-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230127-r0: task do_package: Started
NOTE: recipe ltp-20230127-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ltp-20230127-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_packagedata)
NOTE: recipe ltp-20230127-r0: task do_packagedata: Started
NOTE: recipe ltp-20230127-r0: task do_packagedata: Succeeded
NOTE: Running task 2326 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package_write_rpm)
NOTE: Running task 2327 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package_qa)
NOTE: recipe ltp-20230127-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20230127-r0: task do_package_qa: Started
NOTE: recipe ltp-20230127-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2328 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_build)
NOTE: Tasks Summary: Attempted 2328 tasks of which 2078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7201675083987800761==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20220930-20230127.patch"

RnJvbSA3N2U5NjFhOWRmNTdjYjBjM2YxOGVjZmE2MmU0NzdjMGI3Y2MzNmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNDowODo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
cDogdXBncmFkZSAyMDIyMDkzMCAtPiAyMDIzMDEyNwoKLS0tCiAuLi4wMDAxLXRlc3RjYXNlcy1G
aXgtbGFyZ2VmaWxlLXN1cHBvcnQucGF0Y2ggfCA0MjYgLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
bHRwL3tsdHBfMjAyMjA5MzAuYmIgPT4gbHRwXzIwMjMwMTI3LmJifSAgfCAgIDMgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQyOCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLXRlc3RjYXNlcy1GaXgt
bGFyZ2VmaWxlLXN1cHBvcnQucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRw
L3tsdHBfMjAyMjA5MzAuYmIgPT4gbHRwXzIwMjMwMTI3LmJifSAoOTglKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtdGVzdGNhc2VzLUZpeC1sYXJnZWZp
bGUtc3VwcG9ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtdGVz
dGNhc2VzLUZpeC1sYXJnZWZpbGUtc3VwcG9ydC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggZTliNDhjMzkyZi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbHRwL2x0cC8wMDAxLXRlc3RjYXNlcy1GaXgtbGFyZ2VmaWxlLXN1cHBvcnQucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSw0MjYgKzAsMCBAQAotRnJvbSAzY2NhNjliODVjODhjNmViNGYwMjMx
M2IzYzZhOWUwZjZjYzBiNWQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFdlZCwgMTQgRGVjIDIwMjIgMTg6MTQ6MjIg
LTA4MDAKLVN1YmplY3Q6IFtQQVRDSF0gdGVzdGNhc2VzOiBGaXggbGFyZ2VmaWxlIHN1cHBvcnQK
LQotVXNlIHN0YW5kYXJkIGZ1bmN0aW9ucyAoIG5vdCA2NC1iaXQgZXF1aXZhbGVudHMgKSB3aGlj
aCBvcGVyYXRlIG9uIG9mZl90Ci1hbmQgcGFzcyAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IHRvIGVu
YWJsZSBMRlMgYWx3YXlzIHNvIG9mZl90IGlzIDY0Yml0Ci1mb3IgdGhlc2UgdGVzdHMuCi0KLVRo
aXMgaGVscHMgbWFraW5nIGl0IHBvcnRhYmxlIGFjcm9zcyBtdXNsIHdoaWNoIGhhcyByZW1vdmVk
IHRoZSA2NGJpdAotdHJhbnNpdGlvbiBmdW5jdGlvbnMgZnJvbSBfR05VX1NPVVJDRSBuYW1lc3Bh
Y2UuCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2xpc3RzLmxpbnV4Lml0
L3BpcGVybWFpbC9sdHAvMjAyMi1EZWNlbWJlci8wMzIzMTAuaHRtbF0KLVNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSB0ZXN0Y2FzZXMva2VybmVsL2lv
L2RpcmVjdF9pby9NYWtlZmlsZSAgICAgICAgICAgICB8ICAyICstCi0gdGVzdGNhc2VzL2tlcm5l
bC9pby9kaXJlY3RfaW8vZGlvdGVzdDIuYyAgICAgICAgICAgfCAgNCArKy0tCi0gdGVzdGNhc2Vz
L2tlcm5lbC9pby9kaXJlY3RfaW8vZGlvdGVzdDUuYyAgICAgICAgICAgfCAxMCArKysrKy0tLS0t
Ci0gdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3RfaW8vZGlvdGVzdDYuYyAgICAgICAgICAgfCAg
NCArKy0tCi0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDE4LmMgICAgICAg
ICAgfCAgNiArKystLS0KLSB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzQu
YyAgICAgICAgICB8ICAyICstCi0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250
bDM2LmMgICAgICAgICAgfCAgNCArKy0tCi0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sbHNl
ZWsvTWFrZWZpbGUgICAgICAgICAgfCAgMiArKwotIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
bGxzZWVrL2xsc2VlazAxLmMgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0KLSB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2xsc2Vlay9sbHNlZWswMi5jICAgICAgICB8IDEyICsrKysrKy0tLS0t
LQotIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGxzZWVrL2xsc2VlazAzLmMgICAgICAgIHwg
IDYgKysrLS0tCi0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuL01ha2VmaWxlICAgICAg
ICAgICAgfCAgMiArKwotIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3Blbi9vcGVuMTIuYyAg
ICAgICAgICAgIHwgIDYgKysrLS0tCi0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuYXQv
TWFrZWZpbGUgICAgICAgICAgfCAgMiArKwotIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3Bl
bmF0L29wZW5hdDAyLmMgICAgICAgIHwgIDYgKysrLS0tCi0gdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zeW5jX2ZpbGVfcmFuZ2UvTWFrZWZpbGUgfCAgMiArKwotIC4uLi9zeXNjYWxscy9zeW5j
X2ZpbGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDEuYyAgIHwgIDQgKystLQotIC4uLi9zeXNjYWxs
cy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDIuYyAgIHwgIDYgKysrLS0tCi0gMTgg
ZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCi0KLWRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9NYWtlZmlsZSBiL3Rlc3RjYXNl
cy9rZXJuZWwvaW8vZGlyZWN0X2lvL01ha2VmaWxlCi1pbmRleCA3NzdmN2IxNjYuLjc0ODBkN2Iw
ZCAxMDA2NDQKLS0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvaW8vZGlyZWN0X2lvL01ha2VmaWxlCi0r
KysgYi90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9NYWtlZmlsZQotQEAgLTUsNyArNSw3
IEBAIHRvcF9zcmNkaXIJCQk/PSAuLi8uLi8uLi8uLgotIAotIGluY2x1ZGUgJCh0b3Bfc3JjZGly
KS9pbmNsdWRlL21rL3Rlc3RjYXNlcy5tawotIAotLUNGTEFHUwkJCQkrPSAtRFNIQVJFRF9PRklM
RSAtRF9HTlVfU09VUkNFCi0rQ0ZMQUdTCQkJCSs9IC1EU0hBUkVEX09GSUxFIC1EX0dOVV9TT1VS
Q0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVfU09VUkNFCi0gCi0gTERMSUJT
CQkJCSs9IC1scHRocmVhZAotIAotZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvaW8vZGly
ZWN0X2lvL2Rpb3Rlc3QyLmMgYi90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0
Mi5jCi1pbmRleCBjNDA3YzQ2YWUuLmRiNDdlZThlZiAxMDA2NDQKLS0tLSBhL3Rlc3RjYXNlcy9r
ZXJuZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3QyLmMKLSsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvaW8v
ZGlyZWN0X2lvL2Rpb3Rlc3QyLmMKLUBAIC03OCw3ICs3OCw3IEBAIGludCBidWZzaXplID0gQlVG
U0laRTsKLSAgKglGb3IgZWFjaCBpdGVyYXRpb24sIHdyaXRlIGRhdGEgc3RhcnRpbmcgYXQgb2Zm
c2UraXRlcipidWZzaXplCi0gICoJbG9jYXRpb24gaW4gdGhlIGZpbGUgYW5kIHJlYWQgZnJvbSB0
aGVyZS4KLSAqLwotLWludCBydW50ZXN0KGludCBmZF9yLCBpbnQgZmRfdywgaW50IGl0ZXIsIG9m
ZjY0X3Qgb2Zmc2V0LCBpbnQgYWN0aW9uKQotK2ludCBydW50ZXN0KGludCBmZF9yLCBpbnQgZmRf
dywgaW50IGl0ZXIsIG9mZl90IG9mZnNldCwgaW50IGFjdGlvbikKLSB7Ci0gCWNoYXIgKmJ1ZjE7
Ci0gCWNoYXIgKmJ1ZjI7Ci1AQCAtMTM2LDcgKzEzNiw3IEBAIHN0YXRpYyB2b2lkIGNsZWFudXAo
dm9pZCk7Ci0gaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKLSB7Ci0gCWludCBpdGVy
ID0gMTAwOwkJLyogSXRlcmF0aW9ucy4gRGVmYXVsdCAxMDAgKi8KLS0Jb2ZmNjRfdCBvZmZzZXQg
PSAwOwkvKiBPZmZzZXQuIERlZmF1bHQgMCAqLwotKwlvZmZfdCBvZmZzZXQgPSAwOwkvKiBPZmZz
ZXQuIERlZmF1bHQgMCAqLwotIAlpbnQgaSwgYWN0aW9uLCBmZF9yLCBmZF93OwotIAlpbnQgZmFp
bF9jb3VudCA9IDAsIHRvdGFsID0gMCwgZmFpbGVkID0gMDsKLSAKLWRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9p
by9kaXJlY3RfaW8vZGlvdGVzdDUuYwotaW5kZXggOWJmOTE3YzY0Li5hYzY2ZjJhMDQgMTAwNjQ0
Ci0tLS0gYS90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NS5jCi0rKysgYi90
ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NS5jCi1AQCAtNzUsMTQgKzc1LDE0
IEBAIGludCBUU1RfVE9UQUwgPSAzOwkJLyogVG90YWwgbnVtYmVyIG9mIHRlc3QgY29uZGl0aW9u
cyAqLwotIHN0YXRpYyBpbnQgYnVmc2l6ZSA9IEJVRlNJWkU7CS8qIEJ1ZmZlciBzaXplLiBEZWZh
dWx0IDRrICovCi0gc3RhdGljIGludCBpdGVyID0gMjA7CQkvKiBJdGVyYXRpb25zLiBEZWZhdWx0
IDIwICovCi0gc3RhdGljIGludCBudmVjdG9yID0gMjA7CS8qIFZlY3RvciBhcnJheS4gRGVmYXVs
dCAyMCAqLwotLXN0YXRpYyBvZmY2NF90IG9mZnNldCA9IDA7CS8qIFN0YXJ0IG9mZnNldC4gRGVm
YXVsdCAwICovCi0rc3RhdGljIG9mZl90IG9mZnNldCA9IDA7CS8qIFN0YXJ0IG9mZnNldC4gRGVm
YXVsdCAwICovCi0gc3RhdGljIGNoYXIgZmlsZW5hbWVbTEVOXTsJLyogVGVzdCBkYXRhIGZpbGUg
Ki8KLSBzdGF0aWMgaW50IGZkMSA9IC0xOwotIC8qCi0gICogcnVudGVzdDogV3JpdGUgdGhlIGRh
dGEgaW4gdmVjdG9yIGFycmF5IHRvIHRoZSBmaWxlLiBSZWFkIHRoZSBkYXRhCi0gICoJZnJvbSB0
aGUgZmlsZSBpbnRvIGFub3RoZXIgdmVjdG9yeSBhcnJheSBhbmQgdmVyaWZ5LiBSZXBlYXQgdGhl
IHRlc3QuCi0gKi8KLS1pbnQgcnVudGVzdChpbnQgZmRfciwgaW50IGZkX3csIGludCBpdGVyLCBv
ZmY2NF90IG9mZnNldCwgaW50IGFjdGlvbikKLStpbnQgcnVudGVzdChpbnQgZmRfciwgaW50IGZk
X3csIGludCBpdGVyLCBvZmZfdCBvZmZzZXQsIGludCBhY3Rpb24pCi0gewotIAlpbnQgaTsKLSAJ
c3RydWN0IGlvdmVjICppb3YxLCAqaW92MiwgKmlvdnA7Ci1AQCAtMjE4LDcgKzIxOCw3IEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCi0gCQl0c3RfYnJrbShUQlJPSywgY2xlYW51
cCwgImZkX3cgb3BlbiBmYWlsZWQgZm9yICVzOiAlcyIsCi0gCQkJIGZpbGVuYW1lLCBzdHJlcnJv
cihlcnJubykpOwotIAl9Ci0tCWlmICgoZmRfciA9IG9wZW42NChmaWxlbmFtZSwgT19ESVJFQ1Qg
fCBPX1JET05MWSB8IE9fQ1JFQVQsIDA2NjYpKSA8IDApIHsKLSsJaWYgKChmZF9yID0gb3Blbihm
aWxlbmFtZSwgT19ESVJFQ1QgfCBPX1JET05MWSB8IE9fQ1JFQVQsIDA2NjYpKSA8IDApIHsKLSAJ
CXRzdF9icmttKFRCUk9LLCBjbGVhbnVwLCAiZmRfciBvcGVuIGZhaWxlZCBmb3IgJXM6ICVzIiwK
LSAJCQkgZmlsZW5hbWUsIHN0cmVycm9yKGVycm5vKSk7Ci0gCX0KLUBAIC0yNDAsNyArMjQwLDcg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKLSAJCXRzdF9icmttKFRCUk9LLCBj
bGVhbnVwLCAiZmRfdyBvcGVuIGZhaWxlZCBmb3IgJXM6ICVzIiwKLSAJCQkgZmlsZW5hbWUsIHN0
cmVycm9yKGVycm5vKSk7Ci0gCX0KLS0JaWYgKChmZF9yID0gb3BlbjY0KGZpbGVuYW1lLCBPX1JE
T05MWSB8IE9fQ1JFQVQsIDA2NjYpKSA8IDApIHsKLSsJaWYgKChmZF9yID0gb3BlbihmaWxlbmFt
ZSwgT19SRE9OTFkgfCBPX0NSRUFULCAwNjY2KSkgPCAwKSB7Ci0gCQl0c3RfYnJrbShUQlJPSywg
Y2xlYW51cCwgImZkX3Igb3BlbiBmYWlsZWQgZm9yICVzOiAlcyIsCi0gCQkJIGZpbGVuYW1lLCBz
dHJlcnJvcihlcnJubykpOwotIAl9Ci1AQCAtMjYxLDcgKzI2MSw3IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCi0gCQl0c3RfYnJrbShUQlJPSywgY2xlYW51cCwgImZkX3cgb3Bl
biBmYWlsZWQgZm9yICVzOiAlcyIsCi0gCQkJIGZpbGVuYW1lLCBzdHJlcnJvcihlcnJubykpOwot
IAl9Ci0tCWlmICgoZmRfciA9IG9wZW42NChmaWxlbmFtZSwgT19ESVJFQ1QgfCBPX1JET05MWSB8
IE9fQ1JFQVQsIDA2NjYpKSA8IDApIHsKLSsJaWYgKChmZF9yID0gb3BlbihmaWxlbmFtZSwgT19E
SVJFQ1QgfCBPX1JET05MWSB8IE9fQ1JFQVQsIDA2NjYpKSA8IDApIHsKLSAJCXRzdF9icmttKFRC
Uk9LLCBjbGVhbnVwLCAiZmRfciBvcGVuIGZhaWxlZCBmb3IgJXM6ICVzIiwKLSAJCQkgZmlsZW5h
bWUsIHN0cmVycm9yKGVycm5vKSk7Ci0gCX0KLWRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVs
L2lvL2RpcmVjdF9pby9kaW90ZXN0Ni5jIGIvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3RfaW8v
ZGlvdGVzdDYuYwotaW5kZXggYTA2ZTZiODJiLi4xOTA1MzgwZjAgMTAwNjQ0Ci0tLS0gYS90ZXN0
Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0Ni5jCi0rKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0Ni5jCi1AQCAtNjIsNyArNjIsNyBAQCBpbnQgVFNUX1RP
VEFMID0gMzsKLSAKLSBzdGF0aWMgaW50IGl0ZXIgPSAxMDA7Ci0gc3RhdGljIGludCBidWZzaXpl
ID0gQlVGU0laRTsKLS1zdGF0aWMgb2ZmNjRfdCBvZmZzZXQgPSAwOwotK3N0YXRpYyBvZmZfdCBv
ZmZzZXQgPSAwOwotIHN0YXRpYyBpbnQgbnZlY3RvciA9IDIwOwotIHN0YXRpYyBjaGFyIGZpbGVu
YW1lW0xFTl07Ci0gc3RhdGljIGludCBmZDEgPSAtMTsKLUBAIC04NCw3ICs4NCw3IEBAIHN0YXRp
YyB2b2lkIHByZ191c2FnZSh2b2lkKQotICovCi0gaW50IHJ1bnRlc3QoaW50IGZkX3IsIGludCBm
ZF93LCBpbnQgY2hpbGRudW0sIGludCBhY3Rpb24pCi0gewotLQlvZmY2NF90IHNlZWtvZmY7Ci0r
CW9mZl90IHNlZWtvZmY7Ci0gCWludCBpLCByZXQgPSAtMTsKLSAJc3NpemVfdCBuID0gMDsKLSAJ
c3RydWN0IGlvdmVjICppb3ZfciwgKmlvdl93OwotZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvZmNudGwvZmNudGwxOC5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9m
Y250bC9mY250bDE4LmMKLWluZGV4IDVlZWZiZDEyOC4uMTEwNWRkMzkzIDEwMDY0NAotLS0tIGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDE4LmMKLSsrKyBiL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwxOC5jCi1AQCAtMTAzLDExICsxMDMsMTEgQEAg
aW50IG1haW4oaW50IGFjLCBjaGFyICoqYXYpCi0gCXRzdF9yZXNtKFRJTkZPLCAiRW50ZXIgYmxv
Y2sgMiIpOwotIAlmYWlsID0gMDsKLSAJLyogRXJyb3IgY29uZGl0aW9uIGlmIGFkZHJlc3MgaXMg
YmFkICovCi0tCXJldHZhbCA9IGZjbnRsKGZkLCBGX0dFVExLNjQsIChzdHJ1Y3QgZmxvY2sgKilJ
TlZBTF9GTEFHKTsKLSsJcmV0dmFsID0gZmNudGwoZmQsIEZfR0VUTEssIChzdHJ1Y3QgZmxvY2sg
KilJTlZBTF9GTEFHKTsKLSAJaWYgKGVycm5vID09IEVGQVVMVCkgewotLQkJdHN0X3Jlc20oVFBB
U1MsICJUZXN0IEZfR0VUTEs2NDogZm9yIGVycm5vIEVGQVVMVCBQQVNTRUQiKTsKLSsJCXRzdF9y
ZXNtKFRQQVNTLCAiVGVzdCBGX0dFVExLOiBmb3IgZXJybm8gRUZBVUxUIFBBU1NFRCIpOwotIAl9
IGVsc2UgewotLQkJdHN0X3Jlc20oVEZBSUwsICJUZXN0IEZfR0VUTEs2NDogZm9yIGVycm5vIEVG
QVVMVCBGQUlMRUQiKTsKLSsJCXRzdF9yZXNtKFRGQUlMLCAiVGVzdCBGX0dFVExLOiBmb3IgZXJy
bm8gRUZBVUxUIEZBSUxFRCIpOwotIAkJZmFpbCA9IDE7Ci0gCX0KLSAJaWYgKGZhaWwpIHsKLWRp
ZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzQuYyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwvZmNudGwzNC5jCi1pbmRleCAzNDQyMTE0ZmYu
LjUzNmRlYWQyOSAxMDA2NDQKLS0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmNudGwv
ZmNudGwzNC5jCi0rKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzQu
YwotQEAgLTU0LDcgKzU0LDcgQEAgdm9pZCAqdGhyZWFkX2ZuXzAxKHZvaWQgKmFyZykKLSAKLSAJ
bWVtc2V0KGJ1ZiwgKGludHB0cl90KWFyZywgd3JpdGVfc2l6ZSk7Ci0gCi0tCXN0cnVjdCBmbG9j
azY0IGxjayA9IHsKLSsJc3RydWN0IGZsb2NrIGxjayA9IHsKLSAJCS5sX3doZW5jZSA9IFNFRUtf
U0VULAotIAkJLmxfc3RhcnQgID0gMCwKLSAJCS5sX2xlbiAgICA9IDEsCi1kaWZmIC0tZ2l0IGEv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDM2LmMgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzYuYwotaW5kZXggZDZiMDdmYzQxLi40ZTRkNDhhZmMg
MTAwNjQ0Ci0tLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzYuYwot
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDM2LmMKLUBAIC03Miw3
ICs3Miw3IEBAIHN0YXRpYyB2b2lkICpmbl9vZmRfdyh2b2lkICphcmcpCi0gCWludCBmZCA9IFNB
RkVfT1BFTihmbmFtZSwgT19SRFdSKTsKLSAJbG9uZyB3dCA9IHBhLT5jbnQ7Ci0gCi0tCXN0cnVj
dCBmbG9jazY0IGxjayA9IHsKLSsJc3RydWN0IGZsb2NrIGxjayA9IHsKLSAJCS5sX3doZW5jZSA9
IFNFRUtfU0VULAotIAkJLmxfc3RhcnQgID0gcGEtPm9mZnNldCwKLSAJCS5sX2xlbiAgICA9IHBh
LT5sZW5ndGgsCi1AQCAtMTUxLDcgKzE1MSw3IEBAIHN0YXRpYyB2b2lkICpmbl9vZmRfcih2b2lk
ICphcmcpCi0gCWludCBpOwotIAlpbnQgZmQgPSBTQUZFX09QRU4oZm5hbWUsIE9fUkRXUik7Ci0g
Ci0tCXN0cnVjdCBmbG9jazY0IGxjayA9IHsKLSsJc3RydWN0IGZsb2NrIGxjayA9IHsKLSAJCS5s
X3doZW5jZSA9IFNFRUtfU0VULAotIAkJLmxfc3RhcnQgID0gcGEtPm9mZnNldCwKLSAJCS5sX2xl
biAgICA9IHBhLT5sZW5ndGgsCi1kaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9sbHNlZWsvTWFrZWZpbGUgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xsc2Vlay9NYWtl
ZmlsZQotaW5kZXggMDQ0NjE5ZmI4Li44YTkxNmQwZmEgMTAwNjQ0Ci0tLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2xsc2Vlay9NYWtlZmlsZQotKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9sbHNlZWsvTWFrZWZpbGUKLUBAIC02LDMgKzYsNSBAQCB0b3Bfc3JjZGlyCQk/PSAu
Li8uLi8uLi8uLgotIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL3Rlc3RjYXNlcy5t
awotIAotIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL2dlbmVyaWNfbGVhZl90YXJn
ZXQubWsKLSsKLStDRkxBR1MgKz0gLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9MQVJHRUZJTEVf
U09VUkNFCi1kaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sbHNlZWsvbGxz
ZWVrMDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGxzZWVrL2xsc2VlazAxLmMKLWlu
ZGV4IDUwZjM1NDkzZC4uZWZiNDQ0ZGM4IDEwMDY0NAotLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9sbHNlZWsvbGxzZWVrMDEuYwotKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9sbHNlZWsvbGxzZWVrMDEuYwotQEAgLTQsNyArNCw3IEBACi0gICogICAwNy8yMDAxIFBvcnRl
ZCBieSBXYXluZSBCb3llcgotICAqLwotIC8qCi0tICogVmVyaWZ5IHRoYXQgbHNlZWs2NCgpIGNh
bGwgc3VjY2VlZHMgdG8gc2V0IHRoZSBmaWxlIHBvaW50ZXIgcG9zaXRpb24gdG8gYW4KLSsgKiBW
ZXJpZnkgdGhhdCBsc2VlaygpIGNhbGwgc3VjY2VlZHMgdG8gc2V0IHRoZSBmaWxlIHBvaW50ZXIg
cG9zaXRpb24gdG8gYW4KLSAgKiBvZmZzZXQgbGFyZ2VyIHRoYW4gZmlsZSBzaXplIGxpbWl0IChS
TElNSVRfRlNJWkUpLiBBbHNvLCB2ZXJpZnkgdGhhdCBhbnkKLSAgKiBhdHRlbXB0IHRvIHdyaXRl
IHRvIHRoaXMgbG9jYXRpb24gZmFpbHMuCi0gICovCi1AQCAtMjcsMjIgKzI3LDIyIEBAIHN0YXRp
YyBpbnQgZmlsZGVzOwotIAotIHN0YXRpYyB2b2lkIHZlcmlmeV9sbHNlZWsodm9pZCkKLSB7Ci0t
CVRFU1QobHNlZWs2NChmaWxkZXMsIChsb2ZmX3QpICg4MCAqIEJVRlNJWiksIFNFRUtfU0VUKSk7
Ci0rCVRFU1QobHNlZWsoZmlsZGVzLCAobG9mZl90KSAoODAgKiBCVUZTSVopLCBTRUVLX1NFVCkp
OwotIAlpZiAoVFNUX1JFVCA9PSAoODAgKiBCVUZTSVopKQotLQkJdHN0X3JlcyhUUEFTUywgImxz
ZWVrNjQoKSBjYW4gc2V0IGZpbGUgcG9pbnRlciBwb3NpdGlvbiBsYXJnZXIgdGhhbiBmaWxlIHNp
emUgbGltaXQiKTsKLSsJCXRzdF9yZXMoVFBBU1MsICJsc2VlaygpIGNhbiBzZXQgZmlsZSBwb2lu
dGVyIHBvc2l0aW9uIGxhcmdlciB0aGFuIGZpbGUgc2l6ZSBsaW1pdCIpOwotIAllbHNlCi0tCQl0
c3RfcmVzKFRGQUlMLCAibHNlZWs2NCgpIHJldHVybmVkIHdyb25nIHZhbHVlICVsZCB3aGVuIHdy
aXRlIHBhc3QgZmlsZSBzaXplIiwgVFNUX1JFVCk7Ci0rCQl0c3RfcmVzKFRGQUlMLCAibHNlZWso
KSByZXR1cm5lZCB3cm9uZyB2YWx1ZSAlbGQgd2hlbiB3cml0ZSBwYXN0IGZpbGUgc2l6ZSIsIFRT
VF9SRVQpOwotIAotIAlpZiAod3JpdGUoZmlsZGVzLCB3cml0ZV9idWZmLCBCVUZTSVopID09IC0x
KQotIAkJdHN0X3JlcyhUUEFTUywid3JpdGUgZmFpbGVkIGFmdGVyIGZpbGUgc2l6ZSBsaW1pdCIp
OwotIAllbHNlCi0gCQl0c3RfYnJrKFRGQUlMLCAid3JpdGUgc3VjY2Vzc2Z1bCBhZnRlciBmaWxl
IHNpemUgbGltaXQiKTsKLSAKLS0JVEVTVChsc2VlazY0KGZpbGRlcywgKGxvZmZfdCkgQlVGU0la
LCBTRUVLX1NFVCkpOwotKwlURVNUKGxzZWVrKGZpbGRlcywgKGxvZmZfdCkgQlVGU0laLCBTRUVL
X1NFVCkpOwotIAlpZiAoVFNUX1JFVCA9PSBCVUZTSVopCi0tCQl0c3RfcmVzKFRQQVNTLCJsc2Vl
azY0KCkgY2FuIHNldCBmaWxlIHBvaW50ZXIgcG9zaXRpb24gdW5kZXIgZmlsZXIgc2l6ZSBsaW1p
dCIpOwotKwkJdHN0X3JlcyhUUEFTUywibHNlZWsoKSBjYW4gc2V0IGZpbGUgcG9pbnRlciBwb3Np
dGlvbiB1bmRlciBmaWxlciBzaXplIGxpbWl0Iik7Ci0gCWVsc2UKLS0JCXRzdF9icmsoVEZBSUws
ImxzZWVrNjQoKSByZXR1cm5zIHdyb25nIHZhbHVlICVsZCB3aGVuIHdyaXRlIHVuZGVyIGZpbGUg
c2l6ZSIsIFRTVF9SRVQpOwotKwkJdHN0X2JyayhURkFJTCwibHNlZWsoKSByZXR1cm5zIHdyb25n
IHZhbHVlICVsZCB3aGVuIHdyaXRlIHVuZGVyIGZpbGUgc2l6ZSIsIFRTVF9SRVQpOwotIAotIAlp
ZiAod3JpdGUoZmlsZGVzLCB3cml0ZV9idWZmLCBCVUZTSVopICE9IC0xKQotIAkJdHN0X3JlcyhU
UEFTUywgIndyaXRlIHN1Y2NjZXNzZnVsbHkgdW5kZXIgZmlsZSBzaXplIGxpbWl0Iik7Ci1kaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sbHNlZWsvbGxzZWVrMDIuYyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbGxzZWVrL2xsc2VlazAyLmMKLWluZGV4IDNkOWMyMWZj
OS4uNTQzMTk2OWY5IDEwMDY0NAotLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sbHNl
ZWsvbGxzZWVrMDIuYwotKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sbHNlZWsvbGxz
ZWVrMDIuYwotQEAgLTUsOCArNSw4IEBACi0gICovCi0gLyoKLSAgKiBEZXNjcmlwdGlvbjoKLS0g
KiAxKSBsc2VlazY0KDIpIGZhaWxzIGFuZCBzZXRzIGVycm5vIHRvIEVJTlZBTCB3aGVuIHdoZW5j
ZSBpcyBpbnZhbGlkLgotLSAqIDIpIGxzZWVrNjQoMikgZmFpbHMgYW5zIHNldHMgZXJybm8gdG8g
RUJBREYgd2hlbiBmZCBpcyBub3QgYW4gb3BlbgotKyAqIDEpIGxzZWVrKDIpIGZhaWxzIGFuZCBz
ZXRzIGVycm5vIHRvIEVJTlZBTCB3aGVuIHdoZW5jZSBpcyBpbnZhbGlkLgotKyAqIDIpIGxzZWVr
KDIpIGZhaWxzIGFucyBzZXRzIGVycm5vIHRvIEVCQURGIHdoZW4gZmQgaXMgbm90IGFuIG9wZW4K
LSAgKiBmaWxlIGRlc2NyaXB0b3IuCi0gICovCi0gCi1AQCAtMzksMTcgKzM5LDE3IEBAIHN0YXRp
YyB2b2lkIHZlcmlmeV9sbHNlZWsodW5zaWduZWQgaW50IG4pCi0gewotIAlzdHJ1Y3QgdGNhc2Ug
KnRjID0gJnRjYXNlc1tuXTsKLSAKLS0JVEVTVChsc2VlazY0KCp0Yy0+ZmQsIChsb2ZmX3QpIDEs
IHRjLT53aGVuY2UpKTsKLSsJVEVTVChsc2VlaygqdGMtPmZkLCAobG9mZl90KSAxLCB0Yy0+d2hl
bmNlKSk7Ci0gCWlmIChUU1RfUkVUICE9IChvZmZfdCkgLTEpIHsKLS0JCXRzdF9yZXMoVEZBSUws
ICJsc2VlazY0KCVkLCAxLCAlZCkgc3VjY2VlZGVkIHVuZXhwZWN0ZWRseSAoJWxkKSIsCi0rCQl0
c3RfcmVzKFRGQUlMLCAibHNlZWsoJWQsIDEsICVkKSBzdWNjZWVkZWQgdW5leHBlY3RlZGx5ICgl
bGQpIiwKLSAJCQkqdGMtPmZkLCB0Yy0+d2hlbmNlLCBUU1RfUkVUKTsKLSAJCXJldHVybjsKLSAJ
fQotIAlpZiAoVFNUX0VSUiA9PSB0Yy0+ZXhwX2VycikgewotLQkJdHN0X3JlcyhUUEFTUyB8IFRU
RVJSTk8sICJsc2VlazY0KCVkLCAxLCAlZCkgZmFpbGVkIGFzIGV4cGVjdGVkIiwKLSsJCXRzdF9y
ZXMoVFBBU1MgfCBUVEVSUk5PLCAibHNlZWsoJWQsIDEsICVkKSBmYWlsZWQgYXMgZXhwZWN0ZWQi
LAotIAkJCSp0Yy0+ZmQsIHRjLT53aGVuY2UpOwotIAl9IGVsc2UgewotLQkJdHN0X3JlcyhURkFJ
TCB8IFRURVJSTk8sICJsc2VlazY0KCVkLCAxLCAlZCkgZmFpbGVkICIKLSsJCXRzdF9yZXMoVEZB
SUwgfCBUVEVSUk5PLCAibHNlZWsoJWQsIDEsICVkKSBmYWlsZWQgIgotIAkJICAgICAgICAidW5l
eHBlY3RlZGx5LCBleHBlY3RlZCAlcyIsICp0Yy0+ZmQsIHRjLT53aGVuY2UsCi0gCQkgICAgICAg
IHRzdF9zdHJlcnJubyh0Yy0+ZXhwX2VycikpOwotIAl9Ci1kaWZmIC0tZ2l0IGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9sbHNlZWsvbGxzZWVrMDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvbGxzZWVrL2xsc2VlazAzLmMKLWluZGV4IGQ3ODBmMmFmNi4uNmMzNDExOWU1IDEwMDY0
NAotLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sbHNlZWsvbGxzZWVrMDMuYwotKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9sbHNlZWsvbGxzZWVrMDMuYwotQEAgLTcyLDcg
KzcyLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKnN0cl93aGVuY2UoaW50IHdoZW5jZSkKLSAJfQot
IH0KLSAKLS1zdGF0aWMgdm9pZCB2ZXJpZnlfbHNlZWs2NCh1bnNpZ25lZCBpbnQgbikKLStzdGF0
aWMgdm9pZCB2ZXJpZnlfbHNlZWsodW5zaWduZWQgaW50IG4pCi0gewotIAlzdHJ1Y3QgdGNhc2Ug
KnRjID0gJnRjYXNlc1tuXTsKLSAJY2hhciByZWFkX2J1ZlsxMjhdOwotQEAgLTgyLDcgKzgyLDcg
QEAgc3RhdGljIHZvaWQgdmVyaWZ5X2xzZWVrNjQodW5zaWduZWQgaW50IG4pCi0gCi0gCVNBRkVf
UkVBRCgxLCBmZCwgcmVhZF9idWYsIDQpOwotIAotLQlURVNUKGxzZWVrNjQoZmQsIHRjLT5vZmYs
IHRjLT53aGVuY2UpKTsKLSsJVEVTVChsc2VlayhmZCwgdGMtPm9mZiwgdGMtPndoZW5jZSkpOwot
IAotIAlpZiAoVFNUX1JFVCA9PSAtMSkgewotICAgICAgICAgICAgICAgICB0c3RfcmVzKFRGQUlM
IHwgVFRFUlJOTywgImxsc2VlayBmYWlsZWQgb24gJXMgIiwgVEVTVF9GSUxFKTsKLUBAIC0xMjEs
NiArMTIxLDYgQEAgZXhpdDoKLSBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Ci0gCS5u
ZWVkc190bXBkaXIgPSAxLAotIAkuc2V0dXAgPSBzZXR1cCwKLS0JLnRlc3QgPSB2ZXJpZnlfbHNl
ZWs2NCwKLSsJLnRlc3QgPSB2ZXJpZnlfbHNlZWssCi0gCS50Y250ID0gQVJSQVlfU0laRSh0Y2Fz
ZXMpLAotIH07Ci1kaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuL01h
a2VmaWxlIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuL01ha2VmaWxlCi1pbmRleCAw
NDQ2MTlmYjguLjhhOTE2ZDBmYSAxMDA2NDQKLS0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvb3Blbi9NYWtlZmlsZQotKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuL01h
a2VmaWxlCi1AQCAtNiwzICs2LDUgQEAgdG9wX3NyY2RpcgkJPz0gLi4vLi4vLi4vLi4KLSBpbmNs
dWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay90ZXN0Y2FzZXMubWsKLSAKLSBpbmNsdWRlICQo
dG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1rCi0rCi0rQ0ZMQUdT
ICs9IC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRQotZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3Blbi9vcGVuMTIuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvb3Blbi9vcGVuMTIuYwotaW5kZXggYmRmMjlhOWE4Li5jODQwZGU1M2Qg
MTAwNjQ0Ci0tLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW4vb3BlbjEyLmMKLSsr
KyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3Blbi9vcGVuMTIuYwotQEAgLTIzMywxNCAr
MjMzLDE0IEBAIHN0YXRpYyB2b2lkIHRlc3RfY2xvZXhlYyh2b2lkKQotIHN0YXRpYyB2b2lkIHRl
c3RfbGFyZ2VmaWxlKHZvaWQpCi0gewotIAlpbnQgZmQ7Ci0tCW9mZjY0X3Qgb2Zmc2V0OwotKwlv
ZmZfdCBvZmZzZXQ7Ci0gCi0gCWZkID0gU0FGRV9PUEVOKGNsZWFudXAsIExBUkdFX0ZJTEUsCi0g
CQkJCU9fTEFSR0VGSUxFIHwgT19SRFdSIHwgT19DUkVBVCwgMDc3Nyk7Ci0gCi0tCW9mZnNldCA9
IGxzZWVrNjQoZmQsIDQuMSoxMDI0KjEwMjQqMTAyNCwgU0VFS19TRVQpOwotKwlvZmZzZXQgPSBs
c2VlayhmZCwgNC4xKjEwMjQqMTAyNCoxMDI0LCBTRUVLX1NFVCk7Ci0gCWlmIChvZmZzZXQgPT0g
LTEpCi0tCQl0c3RfYnJrbShUQlJPSyB8IFRFUlJOTywgY2xlYW51cCwgImxzZWVrNjQgZmFpbGVk
Iik7Ci0rCQl0c3RfYnJrbShUQlJPSyB8IFRFUlJOTywgY2xlYW51cCwgImxzZWVrIGZhaWxlZCIp
OwotIAotIAlTQUZFX1dSSVRFKGNsZWFudXAsIDEsIGZkLCBMQVJHRV9GSUxFLCBzaXplb2YoTEFS
R0VfRklMRSkpOwotIAotZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3Bl
bmF0L01ha2VmaWxlIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuYXQvTWFrZWZpbGUK
LWluZGV4IDA0NDYxOWZiOC4uOGE5MTZkMGZhIDEwMDY0NAotLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9vcGVuYXQvTWFrZWZpbGUKLSsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvb3BlbmF0L01ha2VmaWxlCi1AQCAtNiwzICs2LDUgQEAgdG9wX3NyY2RpcgkJPz0gLi4vLi4v
Li4vLi4KLSBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay90ZXN0Y2FzZXMubWsKLSAK
LSBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1r
Ci0rCi0rQ0ZMQUdTICs9IC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJD
RQotZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3BlbmF0L29wZW5hdDAy
LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW5hdC9vcGVuYXQwMi5jCi1pbmRleCAy
Y2UxMTkwMzMuLmY2MTEzODUyYSAxMDA2NDQKLS0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvb3BlbmF0L29wZW5hdDAyLmMKLSsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3Bl
bmF0L29wZW5hdDAyLmMKLUBAIC0yMiw3ICsyMiw3IEBACi0gICogICAyKW9wZW5hdCgpIHN1Y2Nl
ZWRzIHRvIGVuYWJsZSB0aGUgY2xvc2Utb24tZXhlYyBmbGFnIGZvciBhCi0gICogICAgIGZpbGUg
ZGVzY3JpcHRvciwgd2hlbiAnZmxhZ3MnIGlzIHNldCB0byBPX0NMT0VYRUMuCi0gICogICAzKW9w
ZW5hdCgpIHN1Y2NlZWRzIHRvIGFsbG93IGZpbGVzIHdob3NlIHNpemVzIGNhbm5vdCBiZQotLSAq
ICAgICByZXByZXNlbnRlZCBpbiBhbiBvZmZfdCBidXQgY2FuIGJlIHJlcHJlc2VudGVkIGluIGFu
IG9mZjY0X3QKLSsgKiAgICAgcmVwcmVzZW50ZWQgaW4gYW4gb2ZmX3QgYnV0IGNhbiBiZSByZXBy
ZXNlbnRlZCBpbiBhbiBvZmZfdAotICAqICAgICB0byBiZSBvcGVuZWQsIHdoZW4gJ2ZsYWdzJyBp
cyBzZXQgdG8gT19MQVJHRUZJTEUuCi0gICogICA0KW9wZW5hdCgpIHN1Y2NlZWRzIHRvIG5vdCB1
cGRhdGUgdGhlIGZpbGUgbGFzdCBhY2Nlc3MgdGltZQotICAqICAgICAoc3RfYXRpbWUgaW4gdGhl
IGlub2RlKSB3aGVuIHRoZSBmaWxlIGlzIHJlYWQsIHdoZW4gJ2ZsYWdzJwotQEAgLTE5MywxMiAr
MTkzLDEyIEBAIHZvaWQgdGVzdGZ1bmNfY2xvZXhlYyh2b2lkKQotIHZvaWQgdGVzdGZ1bmNfbGFy
Z2VmaWxlKHZvaWQpCi0gewotIAlpbnQgZmQ7Ci0tCW9mZjY0X3Qgb2Zmc2V0OwotKwlvZmZfdCBv
ZmZzZXQ7Ci0gCi0gCWZkID0gU0FGRV9PUEVOKGNsZWFudXAsIExBUkdFX0ZJTEUsCi0gCQkJCU9f
TEFSR0VGSUxFIHwgT19SRFdSIHwgT19DUkVBVCwgMDc3Nyk7Ci0gCi0tCW9mZnNldCA9IGxzZWVr
NjQoZmQsIDQuMSoxMDI0KjEwMjQqMTAyNCwgU0VFS19TRVQpOwotKwlvZmZzZXQgPSBsc2Vlayhm
ZCwgNC4xKjEwMjQqMTAyNCoxMDI0LCBTRUVLX1NFVCk7Ci0gCWlmIChvZmZzZXQgPT0gLTEpCi0g
CQl0c3RfYnJrbShUQlJPSyB8IFRFUlJOTywgY2xlYW51cCwgImxzZWVrNjQgZmFpbGVkIik7Ci0g
Ci1kaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2Uv
TWFrZWZpbGUgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9NYWtl
ZmlsZQotaW5kZXggMDQ0NjE5ZmI4Li44YTkxNmQwZmEgMTAwNjQ0Ci0tLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9NYWtlZmlsZQotKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2UvTWFrZWZpbGUKLUBAIC02LDMgKzYsNSBA
QCB0b3Bfc3JjZGlyCQk/PSAuLi8uLi8uLi8uLgotIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNs
dWRlL21rL3Rlc3RjYXNlcy5tawotIAotIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21r
L2dlbmVyaWNfbGVhZl90YXJnZXQubWsKLSsKLStDRkxBR1MgKz0gLURfRklMRV9PRkZTRVRfQklU
Uz02NCAtRF9MQVJHRUZJTEVfU09VUkNFCi1kaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDEuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvc3luY19maWxlX3JhbmdlL3N5bmNfZmlsZV9yYW5nZTAxLmMKLWluZGV4
IDE4N2VmNjA3MS4uNDcxODhhYTQ4IDEwMDY0NAotLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDEuYwotKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDEuYwotQEAg
LTQ0LDggKzQ0LDggQEAgc3RhdGljIGludCBiZmQgPSAtMTsKLSAKLSBzdHJ1Y3QgdGVzdF9jYXNl
IHsKLSAJaW50ICpmZDsKLS0Jb2ZmNjRfdCBvZmZzZXQ7Ci0tCW9mZjY0X3QgbmJ5dGVzOwotKwlv
ZmZfdCBvZmZzZXQ7Ci0rCW9mZl90IG5ieXRlczsKLSAJdW5zaWduZWQgaW50IGZsYWdzOwotIAlp
bnQgZXJyb3I7Ci0gfSB0Y2FzZXNbXSA9IHsKLWRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9zeW5jX2ZpbGVfcmFuZ2UwMi5jIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19maWxlX3JhbmdlMDIuYwotaW5k
ZXggNWRhNzUxYzcwLi4yOGE4MTU2YzggMTAwNjQ0Ci0tLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9zeW5jX2ZpbGVfcmFuZ2UwMi5jCi0rKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9zeW5jX2ZpbGVfcmFuZ2UwMi5jCi1A
QCAtMzEsMTAgKzMxLDEwIEBACi0gCi0gc3RydWN0IHRlc3RjYXNlIHsKLSAJY2hhciAqZm5hbWU7
Ci0tCW9mZjY0X3Qgc3luY19vZmY7Ci0tCW9mZjY0X3Qgc3luY19zaXplOwotKwlvZmZfdCBzeW5j
X29mZjsKLSsJb2ZmX3Qgc3luY19zaXplOwotIAlzaXplX3QgZXhwX3N5bmNfc2l6ZTsKLS0Jb2Zm
NjRfdCB3cml0ZV9vZmY7Ci0rCW9mZl90IHdyaXRlX29mZjsKLSAJc2l6ZV90IHdyaXRlX3NpemVf
bWI7Ci0gCWNvbnN0IGNoYXIgKmRlc2M7Ci0gfTsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sdHAvbHRwXzIwMjIwOTMwLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9s
dHBfMjAyMzAxMjcuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyMjA5MzAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sdHAvbHRwXzIwMjMwMTI3LmJiCmluZGV4IDU2OGE2MzIwYzEuLjQzMjVhYTY2NzIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMjIwOTMwLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMjMwMTI3LmJiCkBAIC0yNCwxMiAr
MjQsMTEgQEAgVFVORV9DQ0FSR1M6cmVtb3ZlOng4Ni02NCA9ICItbWZwbWF0aD1zc2UiCiAKIENG
TEFHUzphcHBlbmQ6cG93ZXJwYzY0ID0gIiAtRF9fU0FORV9VU0VSU1BBQ0VfVFlQRVNfXyIKIENG
TEFHUzphcHBlbmQ6bWlwc2FyY2huNjQgPSAiIC1EX19TQU5FX1VTRVJTUEFDRV9UWVBFU19fIgot
U1JDUkVWID0gImI3NjNmODE5OThmMTlmNzgzOTgyZDM5MzdkMWZkMDViY2Y2NDljMTYiCitTUkNS
RVYgPSAiZGQyZDYxYWMxYTFlMDk3OTdhNjE2NWY0NzhhYmQ0YTlmNGY0MzAzNSIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAuZ2l0O2JyYW5jaD1t
YXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1SZW1vdmUtT09N
LXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9kaXNhYmxl
X2hhbmdpbmdfdGVzdHMucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0Y2FzZXMt
Rml4LWxhcmdlZmlsZS1zdXBwb3J0LnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTID0gIiR7V09S
S0RJUn0vZ2l0IgotLSAKMi4zNy4zCgo=

--===============7201675083987800761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 102 recipes from the core2-32 sysroot...done.
Removing 112 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:09701b9df4394cf891bb086914b7900595f58fdf"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 455 Local 259 Mirrors 0 Missed 196 Current 188 (56% match, 69% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 210 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 216 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 611 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe curl-7.87.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_setscene)
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running setscene task 420 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: Running setscene task 421 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 649 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 664 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 665 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 666 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 695 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 696 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 708 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: Running task 709 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 710 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: Running task 713 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 714 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 715 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 716 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 737 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 741 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 742 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 744 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: Running task 763 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: Running task 765 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 777 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 810 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_fetch)
NOTE: Running task 811 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 812 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_fetch)
NOTE: Running task 819 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 820 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 823 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 824 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 827 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 828 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 829 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 830 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_fetch)
NOTE: Running task 833 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_fetch)
NOTE: Running task 835 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 844 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running task 845 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_fetch)
NOTE: Running task 846 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_fetch)
NOTE: Running task 847 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: Running task 848 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: Running task 849 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 851 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: recipe diffutils-3.8-r0: task do_fetch: Started
NOTE: recipe ltp-20230127-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: Running task 852 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe liburcu-0.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 854 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Started
NOTE: recipe make-4.4-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe cpio-2.13-r0: task do_fetch: Started
NOTE: Running task 856 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 857 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 859 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 860 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_unpack)
NOTE: Running task 861 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 862 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 863 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_unpack)
NOTE: Running task 864 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_fetch: Succeeded
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe make-4.4-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_setscene)
NOTE: Running task 865 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 866 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: recipe ltp-20230127-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 889 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 890 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 891 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: Running task 894 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 895 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_unpack)
NOTE: Running task 896 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_unpack)
NOTE: Running task 897 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 898 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 899 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running task 908 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 909 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 910 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: Running task 911 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_fetch)
NOTE: Running task 914 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: recipe liburcu-0.13.2-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: Running task 919 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 920 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 921 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_unpack)
NOTE: Running task 931 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 932 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe diffutils-3.8-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 933 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: Running task 934 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 935 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: Running task 936 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 937 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe ltp-20230127-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: Running task 938 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe gdb-12.1-r0: task do_fetch: Started
NOTE: Running task 939 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: Running task 940 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 941 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_unpack)
NOTE: Running task 942 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe make-4.4-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 943 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 944 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: Running task 945 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gdb-12.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 946 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 947 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 948 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_setscene)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 949 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 954 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 955 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_unpack)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_setscene)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe cpio-2.13-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe make-4.4-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_setscene: Started
NOTE: Running task 956 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 957 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: Running task 958 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_patch)
NOTE: Running task 959 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe gdb-12.1-r0: task do_unpack: Started
NOTE: Running task 979 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 980 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: Running setscene task 473 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: Running setscene task 474 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Started
NOTE: Running setscene task 476 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 477 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Started
NOTE: recipe cpio-2.13-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 478 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 983 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_patch: Started
NOTE: Running task 988 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 991 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 992 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: Running task 993 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: Running task 994 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 995 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 996 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 997 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: Running task 998 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: Running task 999 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 1000 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.8-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_setscene: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 481 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running setscene task 484 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: Running setscene task 487 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 490 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 491 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: Running setscene task 493 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 494 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1003 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1008 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 502 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1029 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1034 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1035 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: Running task 1036 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1037 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1038 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1039 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_patch)
NOTE: Running task 1040 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1041 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1043 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe diffutils-3.8-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1044 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 1045 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: Running task 1048 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_patch)
NOTE: Running task 1049 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 1050 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1051 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1052 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1053 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: Running task 1054 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe liburcu-0.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1056 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Started
NOTE: Running setscene task 511 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 1062 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 1063 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1064 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 515 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1065 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 518 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running task 1067 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1076 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 1077 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cpio-2.13-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: Running setscene task 520 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_unpack: Started
NOTE: recipe iproute2-6.1.0-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 1125 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1135 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 1136 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1137 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1138 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1139 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: Running task 1140 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: Running task 1141 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1142 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 1143 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1144 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1145 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe diffutils-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_patch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: Running task 1146 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1147 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230127-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1149 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1154 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: Running task 1155 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1160 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230127-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1161 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_patch: Succeeded
NOTE: Running task 1162 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: Running task 1163 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1164 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 1165 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1166 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: Running task 1169 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1170 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 533 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 1171 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe ltp-20230127-r0: task do_patch: Succeeded
NOTE: Running task 1172 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_patch)
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: Running task 1173 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_deploy_source_date_epoch)
NOTE: Running task 1174 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1175 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1176 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Started
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1178 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1183 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: Running task 1184 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic unihash changed to 87e3982a3a8d914a089a32e03f65aecb958f66025e4541972d254fd052c1b199
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running setscene task 534 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: Running task 1186 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1187 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 537 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1192 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.87.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1197 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 542 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdb-12.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1206 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdb-12.1-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1207 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1208 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1225 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_setscene: Started
NOTE: recipe gdb-12.1-r0: task do_patch: Succeeded
NOTE: Running task 1226 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 567 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 574 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 579 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 618 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 624 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 643 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1417 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1494 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1495 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1544 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1572 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1577 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1589 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1596 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1653 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1673 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1674 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1688 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1690 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1703 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1720 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1743 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1752 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1755 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1756 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1761 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1766 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1767 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1794 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1815 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1816 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1830 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1831 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1832 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1833 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1845 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1846 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_write_rpm)
NOTE: recipe make-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1847 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1849 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1850 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: Running task 1851 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1852 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1853 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1854 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1855 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1856 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: Running task 1857 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1859 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: Running task 1860 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1861 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: Running task 1864 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: Running task 1865 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: Running task 1867 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe liburcu-0.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1868 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 1870 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: Running task 1871 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: Running task 1874 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe make-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: Running task 1875 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: Running task 1876 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_configure)
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe liburcu-0.13.2-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1877 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe diffutils-3.8-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_configure)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: Running task 1879 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: Running task 1880 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe make-4.4-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: Running task 1882 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe cpio-2.13-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: Running task 1883 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1884 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1885 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 1886 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: Running task 1887 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 1888 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 1889 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1890 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 1891 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 1892 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 1893 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1894 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 1895 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: Running task 1896 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 1897 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 1898 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 1899 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 1900 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1901 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1903 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 1904 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1905 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1906 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1909 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1910 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: Running task 1911 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 1912 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_unpack: Succeeded
NOTE: Running task 1914 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1915 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_symlink_kernsrc: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1916 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: Running task 1917 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1918 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1919 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_kernel_checkout: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 1920 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 1922 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1923 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 1924 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1926 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: Running task 1927 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1928 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1929 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1930 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1931 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: Running task 1932 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 1933 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1934 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1935 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1936 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1937 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: Running task 1938 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1939 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1941 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: Running task 1942 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: Running task 1943 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe make-4.4-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1944 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_configure)
NOTE: Running task 1945 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1946 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe make-4.4-r0: task do_compile: Started
NOTE: recipe ltp-20230127-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1948 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 1949 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1950 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: Running task 1951 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: Running task 1952 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 1953 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1955 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: Running task 1956 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1957 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 1958 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1959 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1960 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe make-4.4-r0: task do_compile: Succeeded
NOTE: Running task 1962 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1963 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe make-4.4-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Running task 1964 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1965 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1966 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1967 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe make-4.4-r0: task do_install: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: Running task 1968 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: recipe make-4.4-r0: task do_package: Started
NOTE: Running task 1969 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe liburcu-0.13.2-r0: task do_configure: Succeeded
NOTE: Running task 1970 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_compile)
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe liburcu-0.13.2-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_install: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: Running task 1972 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1973 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 1974 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: Running task 1975 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Started
NOTE: recipe iptables-1.8.8-r0: task do_compile: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: Running task 1976 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_install)
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 1977 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe iptables-1.8.8-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1978 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1979 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 1980 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: Running task 1982 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 1983 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe iptables-1.8.8-r0: task do_install: Succeeded
NOTE: Running task 1984 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_package)
NOTE: Running task 1985 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Started
NOTE: Running task 1986 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1988 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: Running task 1989 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1990 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: Running task 1991 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1992 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1993 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1994 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1996 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1998 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe make-4.4-r0: task do_package: Succeeded
NOTE: Running task 1999 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2000 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.4-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: Running task 2001 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2002 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2003 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: Running task 2004 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe make-4.4-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: Running task 2005 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: Running task 2006 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: Running task 2007 of 2214 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Failed
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_compile: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_package: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: recipe cpio-2.13-r0: task do_configure: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: recipe ltp-20230127-r0: task do_configure: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.5+gitAUTOINC+142fcf0b8f_404168c1ce-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 2007 tasks of which 1619 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.1.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/btrfs-tools/6.1.2-r0/temp/log.do_packagedata.2321769
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata) failed with exit code '1'

--===============7201675083987800761==
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
meta-yocto-bsp       = "tmp-auh-upgrades:09701b9df4394cf891bb086914b7900595f58fdf"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 17 Mirrors 0 Missed 91 Current 561 (15% match, 86% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
Removing 5 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 565 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/btrfs-tools/6.1.2-r0/temp/log.do_packagedata_setscene.1067320
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 663 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_setscene)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_252.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_252.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1347 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe systemd-1_252.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1373 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: Running task 1375 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1376 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1496 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: Running task 1571 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_setscene: Started
NOTE: Running task 1661 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1664 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_fetch)
NOTE: Running task 1667 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1668 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1675 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1686 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1687 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1688 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1717 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_fetch)
NOTE: Running task 1724 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1725 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: Running task 1759 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_fetch)
NOTE: Running task 1802 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 1803 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1804 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1805 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1806 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1808 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_fetch)
NOTE: Running task 1809 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_fetch)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: Running task 1831 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1832 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1888 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1889 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe liburcu-0.13.2-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: Running task 1930 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: Running task 1931 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1977 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe ltp-20230127-r0: task do_fetch: Started
NOTE: Running task 1978 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1979 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_fetch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: Running task 1980 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: Running task 1994 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 1995 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1996 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 1997 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-12.1-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe cpio-2.13-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 2010 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2017 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2032 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 2033 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: Running task 2034 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2035 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_unpack)
NOTE: Running task 2036 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/systemd/1_252.4-r0/temp/log.do_packagedata_setscene.1067539
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe liburcu-0.13.2-r0: task do_unpack: Started
NOTE: recipe ltp-20230127-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 667 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_package_setscene)
NOTE: Running task 2037 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_unpack)
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: Running task 2038 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_unpack)
NOTE: Running task 2039 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2040 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2041 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2095 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 2097 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: Running task 2098 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 2099 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 2101 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe gdb-12.1-r0: task do_unpack: Started
NOTE: recipe ltp-20230127-r0: task do_unpack: Started
NOTE: Running task 2102 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2103 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe cpio-2.13-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: Running task 2104 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2107 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2108 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_patch)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 2109 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2110 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2111 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2112 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 2122 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2124 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.13-r0: task do_unpack: Succeeded
NOTE: Running task 2125 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_252.4-r0: task do_package_setscene: Started
NOTE: Running task 2126 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2127 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.13.2-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: Running task 2128 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2129 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.13-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: Running task 2130 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: Running task 2131 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2132 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 2133 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2134 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2135 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2136 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2137 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: Running task 2138 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2139 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: Running task 2140 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2141 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2142 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.13-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2144 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2145 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_patch: Succeeded
NOTE: Running task 2146 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2147 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2148 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2149 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: Running task 2150 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe ltp-20230127-r0: task do_unpack: Succeeded
NOTE: Running task 2151 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_patch)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: Running task 2152 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: Running task 2153 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_configure)
NOTE: recipe ltp-20230127-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2154 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2155 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2156 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_deploy_source_date_epoch)
NOTE: Running task 2158 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2159 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 2160 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Started
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic unihash changed to 87e3982a3a8d914a089a32e03f65aecb958f66025e4541972d254fd052c1b199
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 2161 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: Running task 2162 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2163 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2164 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 2165 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: recipe gdb-12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2166 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: Running task 2167 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_patch)
NOTE: recipe gdb-12.1-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_252.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 2168 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: Running task 2187 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata)
NOTE: Running task 2188 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2190 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_252.4-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 2192 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2193 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe ltp-20230127-r0: task do_configure: Started
NOTE: recipe gdb-12.1-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 2195 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2196 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 2198 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_252.4-r0: task do_packagedata: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2201 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2203 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2204 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 2205 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2209 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2210 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2211 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2213 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2214 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2215 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2216 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2217 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2218 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2219 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2220 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2222 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2223 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2225 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2226 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2227 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe liburcu-0.13.2-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.2-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2230 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2231 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2234 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2236 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2237 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2238 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2240 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2241 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_install)
NOTE: recipe liburcu-0.13.2-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2245 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2246 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.2-r0: task do_install: Succeeded
NOTE: Running task 2247 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_populate_sysroot)
NOTE: Running task 2248 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe liburcu-0.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.13.2-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe liburcu-0.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2250 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2251 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2253 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2254 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2255 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2256 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2257 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Started
NOTE: recipe ltp-20230127-r0: task do_configure: Succeeded
NOTE: Running task 2258 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_compile)
NOTE: recipe ltp-20230127-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: Running task 2259 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2260 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2261 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe liburcu-0.13.2-r0: task do_package: Succeeded
NOTE: Running task 2262 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_packagedata: Started
NOTE: Running task 2263 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2264 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2265 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2266 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: Running task 2267 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: Running task 2268 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2269 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_package)
NOTE: Running task 2270 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_populate_sysroot)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2272 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2273 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2274 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2275 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: Running task 2276 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2277 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2279 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2280 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2281 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_install: Succeeded
NOTE: Running task 2282 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install_ptest_base)
NOTE: recipe cpio-2.13-r0: task do_configure: Succeeded
NOTE: Running task 2283 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_compile)
NOTE: recipe cpio-2.13-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm unihash changed to c5ab16ede564ba686f023b9c35b15f6e204f1473fb8af0375c375a659a7b234f
NOTE: recipe cpio-2.13-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_package: Succeeded
NOTE: recipe cpio-2.13-r0: task do_install: Started
NOTE: Running task 2285 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2287 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package)
NOTE: Running task 2288 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2289 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe cpio-2.13-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package)
NOTE: recipe cpio-2.13-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2291 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: Running task 2292 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe cpio-2.13-r0: task do_package: Succeeded
NOTE: Running task 2296 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_packagedata)
NOTE: recipe cpio-2.13-r0: task do_packagedata: Started
NOTE: recipe cpio-2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package_write_rpm)
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2300 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2301 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2302 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2303 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: Running task 2304 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm)
NOTE: Running task 2305 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm unihash changed to ae393ad6390db66ce412716a58ae15fca5718e0175b3d849e78f51ee127986cc
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: Running task 2308 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 2309 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2310 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_compile: Succeeded
NOTE: Running task 2311 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_install: Succeeded
NOTE: Running task 2312 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_package)
NOTE: Running task 2313 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_populate_sysroot)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2314 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_configure)
NOTE: recipe gdb-12.1-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_package: Succeeded
NOTE: Running task 2316 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata: Succeeded
NOTE: recipe gdb-12.1-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_compile)
NOTE: recipe gdb-12.1-r0: task do_compile: Started
NOTE: recipe gdb-12.1-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_install)
NOTE: recipe gdb-12.1-r0: task do_install: Started
NOTE: recipe gdb-12.1-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_package)
NOTE: recipe gdb-12.1-r0: task do_package: Started
NOTE: recipe gdb-12.1-r0: task do_package: Succeeded
NOTE: Running task 2320 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_packagedata)
NOTE: recipe gdb-12.1-r0: task do_packagedata: Started
NOTE: recipe gdb-12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2321 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_package_write_rpm)
NOTE: recipe gdb-12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdb-12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_install)
NOTE: recipe ltp-20230127-r0: task do_install: Started
NOTE: recipe ltp-20230127-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package)
NOTE: Running task 2324 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_sysroot)
NOTE: recipe ltp-20230127-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230127-r0: task do_package: Started
NOTE: recipe ltp-20230127-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ltp-20230127-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_packagedata)
NOTE: recipe ltp-20230127-r0: task do_packagedata: Started
NOTE: recipe ltp-20230127-r0: task do_packagedata: Succeeded
NOTE: Running task 2326 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package_write_rpm)
NOTE: Running task 2327 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package_qa)
NOTE: recipe ltp-20230127-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20230127-r0: task do_package_qa: Started
NOTE: recipe ltp-20230127-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2328 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_build)
NOTE: Tasks Summary: Attempted 2328 tasks of which 2078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7201675083987800761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ltp: SRC_URI changed from "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://disable_hanging_tests.patch file://0001-testcases-Fix-largefile-support.patch" to "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://disable_hanging_tests.patch"
packages/core2-32-poky-linux/ltp: PV changed from "20220930" to "20230127"
packages/core2-32-poky-linux/ltp: PKGV changed from 20220930 [default] to 20230127 [default]
packages/core2-32-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/random-access-del-create /opt/ltp/testcases/bin/.debug/getitimer03 /opt/ltp/testcases/bin/.debug/fork02 /opt/ltp/testcases/bin/.debug/setitimer03 /opt/ltp/testcases/bin/.debug/cgroup_regression_6_2 /opt/ltp/testcases/bin/.debug/mount03_setuid_test /opt/ltp/testcases/bin/.debug/create-files /opt/ltp/testcases/bin/.debug/random-access", added "/opt/ltp/testcases/bin/.debug/dirtyc0w_shmem_child /opt/ltp/testcases/bin/.debug/prctl10 /opt/ltp/testcases/bin/.debug/cgroup_core02 /opt/ltp/testcases/bin/.debug/openat04 /opt/ltp/testcases/bin/.debug/hugefork01 /opt/ltp/testcases/bin/.debug/hugefork02 /opt/ltp/testcases/bin/.debug/hugemmap30 /opt/ltp/testcases/bin/.debug/hugemmap31 /opt/ltp/testcases/bin/.debug/hugemmap16 /opt/ltp/testcases/bin/.debug/hugemmap17 /opt/ltp/testcases/bin/.debug/hugemmap14 /opt/ltp/testcases/bin/.debug/hugemmap15 /opt/ltp/testcases/bin/.debug/hugemmap12 /opt/ltp/testcases/bin
 /.debug/hugemmap13 /opt/ltp/testcases/bin/.debug/hugemmap10 /opt/ltp/testcases/bin/.debug/hugemmap11 /opt/ltp/testcases/bin/.debug/mount03_suid_child /opt/ltp/testcases/bin/.debug/nice05 /opt/ltp/testcases/bin/.debug/hugemmap18 /opt/ltp/testcases/bin/.debug/hugemmap19 /opt/ltp/testcases/bin/.debug/hugefallocate01 /opt/ltp/testcases/bin/.debug/hugefallocate02 /opt/ltp/testcases/bin/.debug/hugemmap29 /opt/ltp/testcases/bin/.debug/hugemmap28 /opt/ltp/testcases/bin/.debug/hugemmap27 /opt/ltp/testcases/bin/.debug/hugemmap26 /opt/ltp/testcases/bin/.debug/hugemmap25 /opt/ltp/testcases/bin/.debug/hugemmap24 /opt/ltp/testcases/bin/.debug/hugemmap23 /opt/ltp/testcases/bin/.debug/hugemmap22 /opt/ltp/testcases/bin/.debug/hugemmap21 /opt/ltp/testcases/bin/.debug/hugemmap20 /opt/ltp/testcases/bin/.debug/dirtyc0w_shmem /opt/ltp/testcases/bin/.debug/madvise03 /opt/ltp/testcases/bin/.debug/cve-2022-4378 /opt/ltp/testcases/bin/.debug/hugemmap07 /opt/ltp/testcases/bin/.debug/hugemmap09 /opt/ltp/testca
 ses/bin/.debug/hugemmap08"
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 743232692 to 770641308 (+4%)
packages/core2-32-poky-linux/ltp/ltp-dbg: PV changed from "20220930" to "20230127"
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGV changed from 20220930 [default] to 20230127 [default]
packages/core2-32-poky-linux/ltp/ltp-dev: FILELIST: added "/opt/ltp/include/tst_rand_data.h /opt/ltp/include/tst_epoll.h"
packages/core2-32-poky-linux/ltp/ltp-dev: PKGSIZE changed from 266224 to 273448 (+3%)
packages/core2-32-poky-linux/ltp/ltp-dev: PV changed from "20220930" to "20230127"
packages/core2-32-poky-linux/ltp/ltp-dev: PKGV changed from 20220930 [default] to 20230127 [default]
packages/core2-32-poky-linux/ltp/ltp-doc: PV changed from "20220930" to "20230127"
packages/core2-32-poky-linux/ltp/ltp-doc: PKGV changed from 20220930 [default] to 20230127 [default]
packages/core2-32-poky-linux/ltp/ltp-locale: PV changed from "20220930" to "20230127"
packages/core2-32-poky-linux/ltp/ltp-locale: PKGV changed from 20220930 [default] to 20230127 [default]
packages/core2-32-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/d
 ebug/ltp/20220930-r0/testcases/kernel/syscalls/setfsuid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setregid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/memfd_create -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/signalfd -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/oom -> /usr/src
 /debug/ltp/20230127-r0/testcases/kernel/mem/oom, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20230127-r0/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20230127-r0/testcase
 s/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ustat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/pci/tpci_kernel
 , directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fdatasync, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_p
 osix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fcntl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sound -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20230127-r0/
 testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pselect, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, directory renamed /usr
 /src/debug/ltp/20220930-r0/testcases/kernel/syscalls/bpf -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/bpf, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/pidns, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcwd, directory renamed /usr/src
 /debug/ltp/20220930-r0/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/clock_settime -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20230127-r0/test
 cases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_adjtime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/personality, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20230127-r0/
 testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/
 conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/op
 en_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20230127-r0/tes
 tcases/open_posix_testsuite/conformance/interfaces/mlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/share -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/tkill -> /us
 r/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memc
 py, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/libclone -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/libclone, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite
 /conformance/interfaces/aio_suspend -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20220930-r0/utils/sctp/testlib -> /usr/src/debug/ltp/20230127-r0/utils/sctp/testlib, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fsconfig -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsconfig, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/202301
 27-r0/testcases/kernel/syscalls/vmsplice, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mmapstress, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /us
 r/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/can/cve -> /usr/src/debug/ltp/20230127-r0/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fanotify, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fchownat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/ltp/20220930-r0/test
 cases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20230127-r0/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/cap_bound -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpo
 licy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/include -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformanc
 e/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/set_thread_area -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_thread_area, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20230127-r0/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20220930-r0/tools/apicmds -> /usr/src/debug/ltp/20230127-r0/tools/apicmds, directory rena
 med /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /us
 r/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getuid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigtimedwait -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renam
 ed /usr/src/debug/ltp/20220930-r0/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20230127-r0/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/semop -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_
 testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/timers/timers, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/mqns -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuset/cpuset_syscall_test -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src
 /debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/periodic_cpu_load -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/clone3 -> /usr/src/debug/ltp/20230127-r0/tes
 tcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/smack -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp
 /20220930-r0/pan -> /usr/src/debug/ltp/20230127-r0/pan, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interface
 s/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20220930-r0/libs/libltpnewipc -> /usr/src/debug/ltp/20230127-r0/libs/libltpnewipc, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/syncfs, directory renamed 
 /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20230127-r0/te
 stcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/aio_h, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sbrk -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20220930-
 r0/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20230127-r0/testcases/op
 en_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/io/aio -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/
 open_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mlockall -> /usr/src/de
 bug/ltp/20230127-r0/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20230127-r0/testcases/o
 pen_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/float/power -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/execveat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls
 /execveat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mprotect -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pth
 read_condattr_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/deb
 ug/ltp/20220930-r0/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/eventfd2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setparam, directory
  renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pause, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> 
 /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_hotplug_test, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20220930-r0/te
 stcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/io/ltp-aiodio -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /u
 sr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/llseek, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/
 mem/mtest01, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/keyctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/inte
 rfaces/shm_unlink -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/request_key, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/include -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/include, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getsco
 pe, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/prio-wake -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/t
 ools -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/tools, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open_tree, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/packet -> /usr/src/debug/ltp/20230127-r0/testcases/network/packet, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/sched_jitter, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/sctp -> /usr/src/debug/ltp/20230127
 -r0/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/select, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/stress/pi-tests, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/uevents -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/src/debug/ltp
 /20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/zram, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/include -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/include, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/ker
 nel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/epoll_pwait 
 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/time -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/atof -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/ltp/20230127-r0/testcases
 /kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20230127-r0/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfac
 es/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/lib -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/gethostname -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/
 signal_h, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/f00f -> /usr/src/debug/ltp/20230127-r0/testcases/misc/f00f, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signal, d
 irectory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/socket, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20230
 127-r0/testcases/kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sysc
 alls/recv, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/crypto -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ulimit, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/access, directory renamed /usr/src/debug
 /ltp/20220930-r0/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20220930-r0/libs/libltpvdso -> /usr/src/debug/ltp/20230127-r0/libs/libltpvdso, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20220930-r0/libs/libltpsigwait -> /usr/src/debug/ltp/20230127-r0/libs/libltpsigwait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getrandom -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrandom, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/sched_latency -> /usr/src/debug/
 ltp/20230127-r0/testcases/realtime/func/sched_latency, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pread, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20230127
 -r0/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/waitid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/block/block_dev_user 
 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/block/block_dev_user, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/sockets -> /usr/src/debug/ltp/20230127-r0/testcases/network/sockets, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/
 cpuacct, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/statx -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/statx, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20230127-r0/testc
 ases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/io_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20230127-r0/test
 cases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20220930-r0/t
 estcases/kernel/syscalls/setsockopt -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/20220930-r0/libs/libltpipc -> /usr/src/debug/ltp/20230127-r0/libs/libltpipc, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/hrtimer-prio, directory renam
 ed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/move_mount, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/s
 rc/debug/ltp/20220930-r0/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_fill, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/debug/ltp/202209
 30-r0/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/pthread_kill_la
 tency, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr
 _destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/hugeshmget -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmget, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/timer_delete -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20230127-r0/te
 stcases/kernel/sched/sched_stress, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getxattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/lib -> /usr/src/debug/ltp/20230127-r0/testcases/lib, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20
 230127-r0/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20230127-r0/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam, directory renamed /usr
 /src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/ke
 rnel/syscalls/abort -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsync, directory renamed /usr/src/debug/ltp/20220930-r0/utils/sctp/include/netinet -> /usr/src/debug/ltp/20230127-r0/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/futex, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/
 conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rename, directory renam
 ed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mmap -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fremovexattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp
 /20230127-r0/testcases/kernel/syscalls/alarm, directory renamed /usr/src/debug/ltp/20220930-r0/tools/genload -> /usr/src/debug/ltp/20230127-r0/tools/genload, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/hyperthreading/ht_affinity, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime ->
  /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execve, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/unshare -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unshare, directory renamed /usr/src/debug/ltp/2022093
 0-r0/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/inotify -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /u
 sr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sysca
 lls/getgid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/utsname -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/utsname, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_get_
 priority_min -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/ksm -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthre
 ad_attr_setstacksize, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/ipc/semaphore -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/ipc/semaphore, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/s
 yscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/netstress -> /usr/src/debug/ltp/20230127-r0/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculat
 ive, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20220930-r0/include/old -> /usr/src/debug/ltp/20230127-r0/include/old, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvfrom, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/recvmmsg -> /usr/sr
 c/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/libcontrollers, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20230127-r0/testcases/kernel
 /syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/accept, directory renamed
  /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mq_notify -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_notify, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_di, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/filecaps -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/renameat, directory renamed /usr/src/d
 ebug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/time, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/
 interfaces/sigpending -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/lib6 -> /usr/src/debug/ltp/20230127-r0/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/flock -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/flock, directory ren
 amed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/commands/eject -> /usr/src/debug/ltp/20230127-r0/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pipe -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debu
 g/ltp/20220930-r0/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/k
 ernel/syscalls/utime -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/umount
 2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umount2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/2022
 0930-r0/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20230127-r0/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/cfs-scheduler -> /usr/src/debug/ltp/202301
 27-r0/testcases/kernel/sched/cfs-scheduler, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/pty -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/pty, directory renamed /usr/src/debug/ltp/20220930-r0/utils/sctp/func_tests -> /usr/src/debug/ltp/20230127-r0/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/irq -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/wait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20230127-r0/testc
 ases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/kill -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/kill, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/input -> /usr/src/debug/ltp/20230127
 -r0/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20230127-r0/tes
 tcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/shmt, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/syscall -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/
 syscalls/readv -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/crash -> /usr/src/debug/ltp/20230127-r0/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20230127-r0/testcases/kerne
 l/mem/vmtests, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/timens -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src
 /debug/ltp/20220930-r0/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20230127-r0/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sched_setaffinity -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pkeys -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pkeys, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sysca
 lls/capget -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/s
 etgid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/doio -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kern
 el/controllers/memcg/regression -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/regression, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/lib -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/lib, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conf
 ormance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/io_setup -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/
 src/debug/ltp/20220930-r0/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fsmount -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/inode, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/syslog -> /usr/src/debug/ltp/20230127-r0/testca
 ses/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/
 20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20220930-r0/libs/libltpswap -> /usr/src/debug/ltp/20230127-r0/libs/libltpswap, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug
 /ltp/20220930-r0/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/trigo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20230127-r0/tes
 tcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/cl
 ose_range -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getdtablesize -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdtablesize, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20230127-r0/test
 cases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20230127-r0/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/float -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmdt, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/202
 20930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/symlink, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/munmap -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/munmap, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/unlink -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unlink, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/eventfd -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/s
 yscalls/capset -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/security/tomoyo -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/numa -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timed
 rdlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/abs -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/splice, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigfillset, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20220930-r0
 /testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/202301
 27-r0/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/kvm -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/kvm, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20230127-r0/testcases/
 kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/munlock -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/power_management -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/power_management, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/
 debug/ltp/20220930-r0/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/tcp_cmds/sendfile -> /usr/src/debug/ltp/20230127-r0/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, director
 y renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20230127-r0/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/modify_ldt -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/modify_ldt, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20220930-r0/utils/sctp/lib -> /usr/src/debug/ltp/20230127-r0/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/page -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/sysca
 lls/wait4 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/doio/include, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfac
 es/pthread_key_delete, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/lib -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20220930-r0/libs/libltpuinput -> /usr/src/debug/ltp/20230127-r0/libs/libltpuinput, directory renamed /usr/src/debug/ltp/20220
 930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/device-drivers/uaccess -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20230127-r0/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/src/debug/ltp/2022
 0930-r0/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/msgget -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/semget -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/deb
 ug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mount_setattr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount_setattr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/misc/math/fptests -> /usr/src/debug/ltp/20230127-r0/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/202301
 27-r0/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20230127-r0/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/sched_football -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ioctl -> /usr/src/debug/ltp/20230127-r0/testcas
 es/kernel/syscalls/ioctl, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigqueueinfo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_
 posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_tid_address, di
 rectory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sendto -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20230127-r0/te
 stcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/memcg -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/debug/l
 tp/20220930-r0/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ipc/shmat -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/realtime/perf/latency -> /usr/src/debug/ltp/20230127-r0/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20230127-r0
 /testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setgroups -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setgroups, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gethostid, directory renamed /
 usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mincore -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20220930-r0/testcas
 es/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getrlimit ->
  /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20220930-r0/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/fsync, removed "/usr/src/debug/ltp/20220930-r0/include/lapi/pidfd.h /usr/src/debug/ltp/20220930-r0/include/lapi/sched.h /usr/src/debug/ltp/20220930-r0/lib/tst_af_alg.c /usr/src/debug/ltp/20220930-r0/lib/tst_device.c /usr/src/debug/ltp/20220930-r0/include/lapi/init_module.h /usr/src/debug/ltp/20220930-r0/include/safe_file_ops_fn.h /usr/src/debug/ltp/20220930-r0/lib/tst_mkfs.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/madvise/madvise08.c /usr/src/debug/ltp/20220930-r0/include/tst_pid.h /usr/src/debug/ltp/20220930-r0/include/tst_process_state.h /usr/src/debug/ltp/20220930-r0/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20220930-r0/lib/tst_get_bad_addr.c /usr/src/debug/ltp/20220930-r0/lib/safe_pthread.c /usr/
 src/debug/ltp/20220930-r0/lib/tst_timer.c /usr/src/debug/ltp/20220930-r0/include/tst_kconfig.h /usr/src/debug/ltp/20220930-r0/lib/safe_file_ops.c /usr/src/debug/ltp/20220930-r0/include/tst_netlink.h /usr/src/debug/ltp/20220930-r0/lib/tst_assert.c /usr/src/debug/ltp/20220930-r0/include/lapi/io_uring.h /usr/src/debug/ltp/20220930-r0/include/tst_buffers.h /usr/src/debug/ltp/20220930-r0/include/tst_clone.h /usr/src/debug/ltp/20220930-r0/include/tst_sched.h /usr/src/debug/ltp/20220930-r0/include/tst_taint.h /usr/src/debug/ltp/20220930-r0/include/tst_timer.h /usr/src/debug/ltp/20220930-r0/include/tst_wallclock.h /usr/src/debug/ltp/20220930-r0/lib/tst_kernel.c /usr/src/debug/ltp/20220930-r0/lib/tst_lockdown.c /usr/src/debug/ltp/20220930-r0/lib/tst_safe_io_uring.c /usr/src/debug/ltp/20220930-r0/include/ipcmsg.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c /usr/src/debug/ltp/20220930-r0/lib/tst_taint.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/h
 ugetlb/hugemmap/hugemmap02.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl05.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2016-7042.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cgroup/cgroup_core01.c /usr/src/debug/ltp/20220930-r0/include/tst_crypto.h /usr/src/debug/ltp/20220930-r0/include/tst_cgroup.h /usr/src/debug/ltp/20220930-r0/lib/tst_tmpdir.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2016-7117.c /usr/src/debug/ltp/20220930-r0/lib/tst_cpu.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/madvise/madvise01.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl03.c /usr/src/debug/ltp/20220930-r0/lib/tst_rtctime.c /usr/src/debug/ltp/20220930-r0/include/tst_net.h
  /usr/src/debug/ltp/20220930-r0/include/tst_kvercmp.h /usr/src/debug/ltp/20220930-r0/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fs-bench/random-access-del-create.c /usr/src/debug/ltp/20220930-r0/lib/tst_fs_link_count.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getitimer/getitimer01.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setitimer/setitimer01.c /usr/src/debug/ltp/20220930-r0/include/tst_rtnetlink.h /usr/src/debug/ltp/20220930-r0/include/tst_fs.h /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2017-17052.c /usr/src/debug/ltp/20220930-r0/lib/tst_net.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2017-16939.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/madvise/madvise10.c /usr/src/debug/ltp/20220930-r0/lib/cloner.c /usr/src/debug/ltp/20220930-r0/lib/tst_cmd.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getitimer/getitimer03.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/se
 titimer/setitimer03.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2016-10044.c /usr/src/debug/ltp/20220930-r0/lib/tst_cgroup.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork02.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/madvise/madvise09.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/nice/nice01.c /usr/src/debug/ltp/20220930-r0/include/parse_vdso.h /usr/src/debug/ltp/20220930-r0/lib/errnos.h /usr/src/debug/ltp/20220930-r0/include/tst_netdevice.h /usr/src/debug/ltp/20220930-r0/lib/tst_ioctl.c /usr/src/debug/ltp/20220930-r0/lib/random_range.c /usr/src/debug/ltp/20220930-r0/include/tst_assert.h /usr/src/debug/ltp/20220930-r0/include/tst_uinput.h /usr/src/debug/ltp/20220930-r0/lib/tst_parse_opts.c /usr/src/debug/ltp/20220930-r0/lib/tst_memutils.c /usr/src/debug/ltp/20220930-r0/lib/tst_fs_has_free.c /usr/src/debug/ltp/20220930-r0/lib/tst_resource.c /usr/src/debug/ltp/20220930-r0/lib/tst_fips.c /usr/src/debug/ltp/20220930-r0/include/tst_
 fuzzy_sync.h /usr/src/debug/ltp/20220930-r0/lib/tst_process_state.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2017-17053.c /usr/src/debug/ltp/20220930-r0/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20220930-r0/lib/tst_dir_is_empty.c /usr/src/debug/ltp/20220930-r0/testcases/cve/meltdown.c /usr/src/debug/ltp/20220930-r0/testcases/cve/stack_clash.c /usr/src/debug/ltp/20220930-r0/include/lapi/common_timers.h /usr/src/debug/ltp/20220930-r0/lib/tst_hugepage.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2014-0196.c /usr/src/debug/ltp/20220930-r0/include/tst_sys_conf.h /usr/src/debug/ltp/20220930-r0/lib/tst_safe_sysv_ipc.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/nice/nice03.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cgroup/cgroup_regression_6_2.c /usr/src/debug/ltp/20220930-r0/include/libswap.h /usr/src/debug/ltp/20220930-r0/include/ipcsem.h /usr/src/debug/ltp/20220930-r0/testcases/cve/icmp_rate_limit01.c /usr/src/debug/ltp/20220930-r0
 /lib/tst_pid.c /usr/src/debug/ltp/20220930-r0/lib/tst_uid.c /usr/src/debug/ltp/20220930-r0/include/tst_module.h /usr/src/debug/ltp/20220930-r0/include/tst_lockdown.h /usr/src/debug/ltp/20220930-r0/lib/tst_kconfig.c /usr/src/debug/ltp/20220930-r0/include/safe_stdio_fn.h /usr/src/debug/ltp/20220930-r0/lib/tst_ansi_color.c /usr/src/debug/ltp/20220930-r0/lib/tst_capability.c /usr/src/debug/ltp/20220930-r0/lib/parse_opts.c /usr/src/debug/ltp/20220930-r0/include/lapi/keyctl.h /usr/src/debug/ltp/20220930-r0/include/tst_private.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cgroup/cgroup_regression_getdelays.c /usr/src/debug/ltp/20220930-r0/lib/tst_fs_setup.c /usr/src/debug/ltp/20220930-r0/include/tst_capability.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/madvise/madvise02.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2017-2671.c /usr/src/debug/ltp/20220930-r0/include/tst_memutils.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fs-bench/random-access.
 c /usr/src/debug/ltp/20220930-r0/include/lapi/clone.h /usr/src/debug/ltp/20220930-r0/lib/get_path.c /usr/src/debug/ltp/20220930-r0/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20220930-r0/lib/tst_thread_state.c /usr/src/debug/ltp/20220930-r0/include/tst_hugepage.h /usr/src/debug/ltp/20220930-r0/lib/tst_path_has_mnt_flags.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/getitimer/getitimer02.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/setitimer/setitimer02.c /usr/src/debug/ltp/20220930-r0/lib/tst_crypto.c /usr/src/debug/ltp/20220930-r0/lib/tst_fs_type.c /usr/src/debug/ltp/20220930-r0/lib/safe_stdio.c /usr/src/debug/ltp/20220930-r0/lib/tst_bool_expr.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl06.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork03.c /usr/src/debug/ltp/20220930-r0/include/time64_variants.h /usr/src/debug/ltp/20220930-r0/lib/tst_rtnetlink.c /usr/src/debug/ltp/20220930-r0/include/tst_safe_prw.h /usr/
 src/debug/ltp/20220930-r0/lib/tst_clone.c /usr/src/debug/ltp/20220930-r0/lib/safe_macros.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl06.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork04.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl04.c /usr/src/debug/ltp/20220930-r0/lib/tst_safe_timerfd.c /usr/src/debug/ltp/20220930-r0/lib/tst_safe_macros.c /usr/src/debug/ltp/20220930-r0/include/tst_rtctime.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork01.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fs-bench/create-files.c /usr/src/debug/ltp/20220930-r0/include/tst_clocks.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/nice/nice04.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork11.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork08.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/madvise/madvise06.c /usr/src/debug/ltp/20220930-r0/include/ts
 t_sig_proc.h /usr/src/debug/ltp/20220930-r0/lib/tst_status.c /usr/src/debug/ltp/20220930-r0/include/safe_net_fn.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork05.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mount/mount03_setuid_test.c /usr/src/debug/ltp/20220930-r0/lib/tst_coredump.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork13.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/nice/nice02.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl08.c /usr/src/debug/ltp/20220930-r0/lib/tst_buffers.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork06.c /usr/src/debug/ltp/20220930-r0/lib/tst_safe_file_at.c /usr/src/debug/ltp/20220930-r0/lib/tst_sys_conf.c /usr/src/debug/ltp/20220930-r0/include/tst_safe_macros.h /usr/src/debug/ltp/20220930-r0/include/tst_test_macros.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mount/mount05.c /usr/src/debug/ltp/20220930-r0/include/lapi/kcmp.h 
 /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/openat/openat01.c /usr/src/debug/ltp/20220930-r0/lib/tst_netdevice.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2017-2618.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/openat/openat02.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/openat/openat03.c /usr/src/debug/ltp/20220930-r0/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/fs/fs-bench/boxmuler.c /usr/src/debug/ltp/20220930-r0/include/lapi/membarrier.h /usr/src/debug/ltp/20220930-r0/include/lapi/epoll.h /usr/src/debug/ltp/20220930-r0/include/lapi/watch_queue.h /usr/src/debug/ltp/20220930-r0/include/lapi/fs.h /usr/src/debug/ltp/20220930-r0/include/libsigwait.h /usr/src/debug/ltp/20220930-r0/lib/safe_net.c /usr/src/debug/ltp/20220930-r0/lib/tst_test.c /usr/src/debug/ltp/20220930-r0/include/tst_safe_io_uring.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mount/mount01.c /usr/src/debug/ltp/20220930-r0/testcas
 es/kernel/syscalls/mount/mount06.c /usr/src/debug/ltp/20220930-r0/lib/tst_checkpoint.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/openat/openat02_child.c /usr/src/debug/ltp/20220930-r0/lib/tst_res.c /usr/src/debug/ltp/20220930-r0/include/libmsgctl.h /usr/src/debug/ltp/20220930-r0/include/libnewipc.h /usr/src/debug/ltp/20220930-r0/include/lapi/openat2.h /usr/src/debug/ltp/20220930-r0/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20220930-r0/include/safe_macros_fn.h /usr/src/debug/ltp/20220930-r0/lib/tst_kvercmp.c /usr/src/debug/ltp/20220930-r0/lib/tst_checksum.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mount/mount03.c /usr/src/debug/ltp/20220930-r0/lib/tst_fill_fs.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork07.c /usr/src/debug/ltp/20220930-r0/lib/tst_clocks.c /usr/src/debug/ltp/20220930-r0/include/tst_kernel.h /usr/src/debug/ltp/20220930-r0/include/tst_ansi_color.h /usr/src/debug/ltp/20220930-r0/include/lapi/fsmount.h /usr/src/d
 ebug/ltp/20220930-r0/include/tst_arch.h /usr/src/debug/ltp/20220930-r0/include/tst_fips.h /usr/src/debug/ltp/20220930-r0/include/tst_mkfs.h /usr/src/debug/ltp/20220930-r0/include/tst_test.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork14.c /usr/src/debug/ltp/20220930-r0/lib/tst_timer_test.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace11.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace01.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace02.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace03.c /usr/src/debug/ltp/20220930-r0/include/lapi/futex.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/controllers/cgroup/cgroup_regression_fork_processes.c /usr/src/debug/ltp/20220930-r0/include/lapi/ipcbuf.h /usr/src/debug/ltp/20220930-r0/include/lapi/msgbuf.h /usr/src/debug/ltp/20220930-r0/include/lapi/sembuf.h /usr/src/debug/ltp/20220930-r0/include/lapi/shmbuf.h /usr/src/debug/ltp
 /20220930-r0/testcases/kernel/syscalls/prctl/prctl07.c /usr/src/debug/ltp/20220930-r0/include/tst_checksum.h /usr/src/debug/ltp/20220930-r0/include/tst_cpu.h /usr/src/debug/ltp/20220930-r0/include/tst_safe_pthread.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork10.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl01.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork09.c /usr/src/debug/ltp/20220930-r0/include/lapi/ustat.h /usr/src/debug/ltp/20220930-r0/include/tst_get_bad_addr.h /usr/src/debug/ltp/20220930-r0/lib/tst_sig_proc.c /usr/src/debug/ltp/20220930-r0/testcases/cve/cve-2015-3290.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/madvise/madvise07.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl09.c /usr/src/debug/ltp/20220930-r0/include/tst_bool_expr.h /usr/src/debug/ltp/20220930-r0/lib/tst_wallclock.c /usr
 /src/debug/ltp/20220930-r0/include/tst_coredump.h /usr/src/debug/ltp/20220930-r0/lib/tst_arch.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/fork/fork12.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/madvise/madvise05.c /usr/src/debug/ltp/20220930-r0/include/tst_safe_timerfd.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl06_execve.c /usr/src/debug/ltp/20220930-r0/include/tst_safe_file_at.h /usr/src/debug/ltp/20220930-r0/lib/tst_supported_fs_types.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mount/mount04.c /usr/src/debug/ltp/20220930-r0/include/tst_checkpoint.h /usr/src/debug/ltp/20220930-r0/lib/tst_sig.c /usr/src/debug/ltp/20220930-r0/include/tst_atomic.h /usr/src/debug/ltp/20220930-r0/lib/tst_fill_file.c /usr/src/debug/ltp/20220930-r0/include/lapi/quotactl.h /usr/src/debug/ltp/20220930-r0/lib/tst_module.c /usr/src/debug/ltp/20220930-r0/include/lapi/readdir.h /usr/src/debug/ltp/20220930-r0/include/lapi/bpf.h /usr/src/debu
 g/ltp/20220930-r0/include/lapi/sem.h /usr/src/debug/ltp/20220930-r0/include/tst_uid.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/prctl/prctl02.c /usr/src/debug/ltp/20220930-r0/include/tst_cmd.h /usr/src/debug/ltp/20220930-r0/include/tst_safe_clocks.h /usr/src/debug/ltp/20220930-r0/lib/tlibio.c /usr/src/debug/ltp/20220930-r0/lib/tst_virt.c /usr/src/debug/ltp/20220930-r0/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20220930-r0/include/tst_af_alg.h /usr/src/debug/ltp/20220930-r0/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace04.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace05.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace07.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace08.c /usr/src/debug/ltp/20220930-r0/include/tst_timer_test.h /usr/src/debug/ltp/20220930-r0/lib/signame.h /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/mount/mou
 nt02.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace09.c /usr/src/debug/ltp/20220930-r0/testcases/kernel/syscalls/ptrace/ptrace10.c /usr/src/debug/ltp/20220930-r0/include/tst_device.h", added "/usr/src/debug/ltp/20230127-r0/lib/tst_sig.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise01.c /usr/src/debug/ltp/20230127-r0/lib/tst_clone.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork08.c /usr/src/debug/ltp/20230127-r0/include/tst_private.h /usr/src/debug/ltp/20230127-r0/lib/tst_safe_timerfd.c /usr/src/debug/ltp/20230127-r0/lib/tst_clocks.c /usr/src/debug/ltp/20230127-r0/include/tst_lockdown.h /usr/src/debug/ltp/20230127-r0/lib/tst_fs_type.c /usr/src/debug/ltp/20230127-r0/testcases/cve/meltdown.c /usr/src/debug/ltp/20230127-r0/include/lapi/watch_queue.h /usr/src/debug/ltp/20230127-r0/include/tst_netdevice.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise07.c /usr/src/debug/ltp/20230127-r0/incl
 ude/lapi/safe_rt_signal.h /usr/src/debug/ltp/20230127-r0/include/lapi/common_timers.h /usr/src/debug/ltp/20230127-r0/lib/safe_pthread.c /usr/src/debug/ltp/20230127-r0/include/lapi/epoll.h /usr/src/debug/ltp/20230127-r0/include/tst_netlink.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl05.c /usr/src/debug/ltp/20230127-r0/lib/tst_supported_fs_types.c /usr/src/debug/ltp/20230127-r0/include/tst_kconfig.h /usr/src/debug/ltp/20230127-r0/lib/tst_safe_macros.c /usr/src/debug/ltp/20230127-r0/include/tst_process_state.h /usr/src/debug/ltp/20230127-r0/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork11.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nice/nice02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl03.c /usr/src/debug/ltp/20230127-r0/lib/tst_fs_has_free.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscal
 ls/fork/fork13.c /usr/src/debug/ltp/20230127-r0/lib/tst_fips.c /usr/src/debug/ltp/20230127-r0/lib/tst_timer.c /usr/src/debug/ltp/20230127-r0/lib/random_range.c /usr/src/debug/ltp/20230127-r0/include/lapi/kcmp.h /usr/src/debug/ltp/20230127-r0/include/lapi/futex.h /usr/src/debug/ltp/20230127-r0/lib/tst_ioctl.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl06.h /usr/src/debug/ltp/20230127-r0/include/ipcmsg.h /usr/src/debug/ltp/20230127-r0/lib/safe_net.c /usr/src/debug/ltp/20230127-r0/include/tst_assert.h /usr/src/debug/ltp/20230127-r0/include/tst_safe_timerfd.h /usr/src/debug/ltp/20230127-r0/include/tst_uinput.h /usr/src/debug/ltp/20230127-r0/lib/tst_pid.c /usr/src/debug/ltp/20230127-r0/include/tst_safe_pthread.h /usr/src/debug/ltp/20230127-r0/lib/tst_af_alg.c /usr/src/debug/ltp/20230127-r0/lib/tst_uid.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nice/nice05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl06.c /usr/src/debug/ltp
 /20230127-r0/testcases/kernel/syscalls/prctl/prctl09.c /usr/src/debug/ltp/20230127-r0/lib/safe_macros.c /usr/src/debug/ltp/20230127-r0/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20230127-r0/lib/cloner.c /usr/src/debug/ltp/20230127-r0/include/tst_safe_macros.h /usr/src/debug/ltp/20230127-r0/include/tst_test_macros.h /usr/src/debug/ltp/20230127-r0/lib/tst_device.c /usr/src/debug/ltp/20230127-r0/include/lapi/ipcbuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/msgbuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/sembuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/init_module.h /usr/src/debug/ltp/20230127-r0/include/lapi/shmbuf.h /usr/src/debug/ltp/20230127-r0/include/safe_file_ops_fn.h /usr/src/debug/ltp/20230127-r0/include/tst_safe_io_uring.h /usr/src/debug/ltp/20230127-r0/include/tst_safe_clocks.h /usr/src/debug/ltp/20230127-r0/include/tst_hugepage.h /usr/src/debug/ltp/20230127-r0/lib/tst_path_has_mnt_flags.c /usr/src/debug/ltp/20230127-r0/lib/tst_resource.c /usr/src/debug/
 ltp/20230127-r0/lib/tst_memutils.c /usr/src/debug/ltp/20230127-r0/include/tst_kernel.h /usr/src/debug/ltp/20230127-r0/lib/tst_cpu.c /usr/src/debug/ltp/20230127-r0/include/tst_arch.h /usr/src/debug/ltp/20230127-r0/include/tst_fips.h /usr/src/debug/ltp/20230127-r0/include/tst_mkfs.h /usr/src/debug/ltp/20230127-r0/lib/tst_kvercmp.c /usr/src/debug/ltp/20230127-r0/include/tst_test.h /usr/src/debug/ltp/20230127-r0/lib/tst_fill_file.c /usr/src/debug/ltp/20230127-r0/include/lapi/pidfd.h /usr/src/debug/ltp/20230127-r0/include/lapi/sched.h /usr/src/debug/ltp/20230127-r0/lib/tst_status.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/ptrace01.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2014-0196.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/ptrace02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/p
 trace/ptrace03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/ptrace04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/ptrace05.c /usr/src/debug/ltp/20230127-r0/lib/tst_safe_sysv_ipc.c /usr/src/debug/ltp/20230127-r0/include/safe_macros_fn.h /usr/src/debug/ltp/20230127-r0/include/lapi/membarrier.h /usr/src/debug/ltp/20230127-r0/lib/tst_safe_io_uring.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork01.c /usr/src/debug/ltp/20230127-r0/lib/tst_arch.c /usr/src/debug/ltp/20230127-r0/lib/tlibio.c /usr/src/debug/ltp/20230127-r0/include/tst_get_bad_addr.h /usr/src/debug/ltp/20230127-r0/lib/tst_taint.c /usr/src/debug/ltp/20230127-r0/lib/tst_fs_link_count.c /usr/src/debug/ltp/20230127-r0/lib/tst_hugepage.c /usr/src/debug/ltp/20230127-r0/lib/tst_virt.c /usr/src/debug/ltp/20230127-r0/include/parse_vdso.h /usr/src/debug/ltp/20230127-r0/lib/tst_ansi_color.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork10.c /usr/src/debug/
 ltp/20230127-r0/testcases/kernel/syscalls/mount/mount03_suid_child.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl06_execve.c /usr/src/debug/ltp/20230127-r0/include/tst_cgroup.h /usr/src/debug/ltp/20230127-r0/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20230127-r0/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20230127-r0/include/tst_buffers.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise05.c /usr/src/debug/ltp/20230127-r0/lib/tst_kernel.c /usr/src/debug/ltp/20230127-r0/lib/tst_coredump.c /usr/src/debug/ltp/20230127-r0/include/libswap.h /usr/src/debug/ltp/20230127-r0/include/ipcsem.h /usr/src/debug/ltp/20230127-r0/include/tst_safe_prw.h /usr/src/debug/ltp/20230127-r0/lib/tst_dir_is_empty.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2016-7117.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl07.c /usr/src/debug/ltp/20230127-
 r0/include/tst_cpu.h /usr/src/debug/ltp/20230127-r0/include/safe_net_fn.h /usr/src/debug/ltp/20230127-r0/lib/tst_fs_setup.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugefork/hugefork01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugefork/hugefork02.c /usr/src/debug/ltp/20230127-r0/lib/tst_rand_data.c /usr/src/debug/ltp/20230127-r0/lib/tst_wallclock.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getitimer/getitimer02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nice/nice04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl01.c /usr/src/debug/ltp/20230127-r0/include/tst_sig_proc.h /usr/src/debug/ltp/20230127-r0/include/tst_net.h /usr/src/debug/ltp/20230127-r0/include/tst_crypto.h /usr/src/debug/ltp/20230127-r0/lib/get_path.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount05.c /usr/src/debug/ltp/20230127-r0/lib/errnos.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/huge
 mmap/hugemmap12.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap21.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap22.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap23.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c /usr/src/debug/ltp/20230127-r0/include/tst_safe_file_at.h /usr/src/debug/ltp/20230127-r0/lib/tst_fill_fs.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/ptrace08.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2017-17053.c /usr/src/debug/ltp/20230127-r0/include/tst_bool_expr.h /usr/src/debug/ltp/20230127-r0/include/tst_device.h /usr/src/debug/ltp/20230127-r0/include/tst_modu
 le.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork06.c /usr/src/debug/ltp/20230127-r0/lib/tst_cgroup.c /usr/src/debug/ltp/20230127-r0/lib/tst_safe_file_at.c /usr/src/debug/ltp/20230127-r0/testcases/cve/stack_clash.c /usr/src/debug/ltp/20230127-r0/include/tst_clone.h /usr/src/debug/ltp/20230127-r0/include/tst_sched.h /usr/src/debug/ltp/20230127-r0/include/tst_taint.h /usr/src/debug/ltp/20230127-r0/include/tst_timer.h /usr/src/debug/ltp/20230127-r0/include/tst_atomic.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork04.c /usr/src/debug/ltp/20230127-r0/include/lapi/fanotify.h /usr/src/debug/ltp/20230127-r0/lib/tst_timer_test.c /usr/src/debug/ltp/20230127-r0/lib/tst_netdevice.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_regression_fork_processes.c /usr/src/debug/ltp/20230127-r0/lib/signame.h /usr/src/debug/ltp/20230127-r0/include/tst_wallclock.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount02.c 
 /usr/src/debug/ltp/20230127-r0/lib/tst_assert.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem_child.c /usr/src/debug/ltp/20230127-r0/include/tst_clocks.h /usr/src/debug/ltp/20230127-r0/include/tst_kvercmp.h /usr/src/debug/ltp/20230127-r0/include/tst_uid.h /usr/src/debug/ltp/20230127-r0/lib/tst_parse_opts.c /usr/src/debug/ltp/20230127-r0/lib/tst_checksum.c /usr/src/debug/ltp/20230127-r0/include/lapi/quotactl.h /usr/src/debug/ltp/20230127-r0/include/tst_checksum.h /usr/src/debug/ltp/20230127-r0/lib/tst_sig_proc.c /usr/src/debug/ltp/20230127-r0/lib/safe_file_ops.c /usr/src/debug/ltp/20230127-r0/lib/tst_kconfig.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2017-2671.c /usr/src/debug/ltp/20230127-r0/include/tst_af_alg.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nice/nice01.c /usr/src/debug/ltp/20230127-r0/include/tst_pid.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugefallocate/hugefallocate01.c /usr/src/debug
 /ltp/20230127-r0/testcases/kernel/syscalls/fork/fork12.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2016-10044.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount04.c /usr/src/debug/ltp/20230127-r0/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20230127-r0/lib/tst_rtnetlink.c /usr/src/debug/ltp/20230127-r0/include/lapi/readdir.h /usr/src/debug/ltp/20230127-r0/lib/safe_stdio.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2017-17052.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2022-4378.c /usr/src/debug/ltp/20230127-r0/lib/tst_buffers.c /usr/src/debug/ltp/20230127-r0/include/lapi/bpf.h /usr/src/debug/ltp/20230127-r0/include/lapi/sem.h /usr/src/debug/ltp/20230127-r0/lib/tst_rtctime.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork14.c /usr/src/debug/ltp/20230127-r0/include/lapi/ustat.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount06.c /u
 sr/src/debug/ltp/20230127-r0/testcases/cve/cve-2017-2618.c /usr/src/debug/ltp/20230127-r0/include/time64_variants.h /usr/src/debug/ltp/20230127-r0/include/libsigwait.h /usr/src/debug/ltp/20230127-r0/include/lapi/fsmount.h /usr/src/debug/ltp/20230127-r0/testcases/cve/icmp_rate_limit01.c /usr/src/debug/ltp/20230127-r0/include/lapi/io_uring.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2016-7042.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap08.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap30.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap25.c /usr/src/debug/ltp/20230127-r0/
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap26.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap27.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap28.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat/openat02_child.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap29.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap09.c /usr/src/debug/ltp/20230127-r0/lib/tst_module.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap11.c /usr/src/debug/ltp/20230127-r0/include/tst_sys_conf.h /usr/src/debug/ltp/20230127-r0/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20230127-r0/lib/tst_capability.c /usr/src/debug/ltp/20230127-r0/include/tst_coredump.h /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2017-16939.c /usr/src/debug/ltp/20230127-r0/testcases/ker
 nel/syscalls/madvise/madvise06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_core01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_core02.c /usr/src/debug/ltp/20230127-r0/lib/tst_checkpoint.c /usr/src/debug/ltp/20230127-r0/testcases/cve/cve-2015-3290.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork05.c /usr/src/debug/ltp/20230127-r0/include/tst_ansi_color.h /usr/src/debug/ltp/20230127-r0/include/tst_fs.h /usr/src/debug/ltp/20230127-r0/include/tst_rtctime.h /usr/src/debug/ltp/20230127-r0/include/tst_memutils.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise08.c /usr/src/debug/ltp/20230127-r0/include/tst_rtnetlink.h /usr/src/debug/ltp/20230127-r0/lib/tst_res.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_regression_getdelays.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/huge
 tlb/hugemmap/hugemmap13.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap14.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap16.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap17.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap18.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap20.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nice/nice03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap24.c /usr/src/debug/ltp/20230127-r0/lib/tst_cmd.c /usr/src/debug/ltp/20230127-r0/include/safe_stdio_fn.h /usr/src/debug/ltp/20230127-r0/lib/tst_bool_expr.c /usr/src/debug/ltp/20230127-r0/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20230127-r0/tes
 tcases/kernel/syscalls/setitimer/setitimer02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl02.c /usr/src/debug/ltp/20230127-r0/include/lapi/keyctl.h /usr/src/debug/ltp/20230127-r0/include/tst_rand_data.h /usr/src/debug/ltp/20230127-r0/lib/tst_sys_conf.c /usr/src/debug/ltp/20230127-r0/include/tst_checkpoint.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/ptrace09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/ptrace10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/ptrace11.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugefallocate/hugefallocate02.c /usr/src/debug/ltp/20230127-r0/include/tst_timer_test.h /usr/src/debug/ltp/20230127-r0/lib/tst_crypto.c /usr/src/debug/ltp/20230127-r0/lib/tst_lockdown.c /usr/src/debug/ltp/20230127-r0/lib/tst_mkfs.c /usr/src/debug/ltp/20230127-r0/lib/tst_net.c /usr/src/debug/ltp/20230
 127-r0/testcases/kernel/syscalls/madvise/madvise09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat/openat01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap31.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat/openat02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat/openat03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat/openat04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl/prctl08.c /usr/src/debug/ltp/20230127-r0/lib/tst_process_state.c /usr/src/debug/ltp/20230127-r0/include/lapi/openat2.h /usr/src/debug/ltp/20230127-r0/include/libmsgctl.h /usr/src/debug/ltp/20230127-r0/include/libnewipc.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h /usr/src/debug/ltp/20230127-r0/lib/parse_opts.c /usr/src/debug/ltp/20230127-r0/include/tst_cmd.h /usr/src/debug/ltp/2023
 0127-r0/lib/tst_test.c /usr/src/debug/ltp/20230127-r0/lib/tst_get_bad_addr.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork/fork03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getitimer/getitimer01.c /usr/src/debug/ltp/20230127-r0/lib/tst_tmpdir.c /usr/src/debug/ltp/20230127-r0/include/tst_fuzzy_sync.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setitimer/setitimer01.c /usr/src/debug/ltp/20230127-r0/include/lapi/fs.h /usr/src/debug/ltp/20230127-r0/include/tst_capability.h"
packages/core2-32-poky-linux/ltp/ltp-src: PKGSIZE changed from 13116612 to 13163667 (+0%)
packages/core2-32-poky-linux/ltp/ltp-src: PV changed from "20220930" to "20230127"
packages/core2-32-poky-linux/ltp/ltp-src: PKGV changed from 20220930 [default] to 20230127 [default]
packages/core2-32-poky-linux/ltp/ltp-staticdev: PV changed from "20220930" to "20230127"
packages/core2-32-poky-linux/ltp/ltp-staticdev: PKGV changed from 20220930 [default] to 20230127 [default]
packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/cgroup_regression_6_2 /opt/ltp/testcases/bin/setitimer03 /opt/ltp/testcases/bin/cgroup_regression_9_1.sh /opt/ltp/testcases/bin/fs-bench-test.sh /opt/ltp/testcases/bin/fork02 /opt/ltp/testcases/bin/cgroup_regression_9_2.sh /opt/ltp/testcases/bin/create-files /opt/ltp/testcases/bin/random-access /opt/ltp/runtest/ltp-aio-stress.part2 /opt/ltp/testcases/bin/fs-bench-test2.sh /opt/ltp/runtest/ltp-aio-stress.part1 /opt/ltp/testcases/bin/getitimer03 /opt/ltp/testcases/bin/mount03_setuid_test /opt/ltp/testcases/bin/modaltr.sh /opt/ltp/testcases/bin/random-access-del-create", added "/opt/ltp/testcases/bin/cgroup_regression_6_2.sh /opt/ltp/testcases/bin/mount03_suid_child /opt/ltp/testcases/bin/hugemmap31 /opt/ltp/testcases/bin/hugemmap28 /opt/ltp/testcases/bin/hugemmap08 /opt/ltp/testcases/bin/hugemmap09 /opt/ltp/testcases/bin/hugemmap18 /opt/ltp/testcases/bin/hugemmap19 /opt/ltp/testcases/bin/hugemmap29 /opt/ltp
 /testcases/bin/hugemmap14 /opt/ltp/testcases/bin/hugemmap07 /opt/ltp/testcases/bin/hugemmap24 /opt/ltp/testcases/bin/hugefork01 /opt/ltp/testcases/bin/hugefork02 /opt/ltp/testcases/bin/hugemmap12 /opt/ltp/testcases/bin/hugemmap13 /opt/ltp/testcases/bin/hugemmap22 /opt/ltp/testcases/bin/hugemmap23 /opt/ltp/testcases/bin/hugemmap11 /opt/ltp/testcases/bin/hugemmap17 /opt/ltp/testcases/bin/hugemmap10 /opt/ltp/testcases/bin/hugemmap21 /opt/ltp/testcases/bin/cve-2022-4378 /opt/ltp/testcases/bin/dirtyc0w_shmem_child /opt/ltp/testcases/bin/cgroup_core02 /opt/ltp/testcases/bin/madvise03 /opt/ltp/testcases/bin/hugefallocate02 /opt/ltp/testcases/bin/hugefallocate01 /opt/ltp/testcases/bin/openat04 /opt/ltp/testcases/bin/prctl10 /opt/ltp/testcases/bin/dirtyc0w_shmem /opt/ltp/testcases/bin/nice05 /opt/ltp/runtest/ltp-aio-stress /opt/ltp/testcases/bin/hugemmap15 /opt/ltp/testcases/bin/hugemmap25 /opt/ltp/testcases/bin/hugemmap16 /opt/ltp/testcases/bin/hugemmap26 /opt/ltp/testcases/bin/hugemmap30 /
 opt/ltp/testcases/bin/hugemmap27 /opt/ltp/testcases/bin/hugemmap20"
packages/core2-32-poky-linux/ltp/ltp: PKGSIZE changed from 421397813 to 439117870 (+4%)
packages/core2-32-poky-linux/ltp/ltp: PV changed from "20220930" to "20230127"
packages/core2-32-poky-linux/ltp/ltp: PKGV changed from 20220930 [default] to 20230127 [default]
Changes to packages/core2-32-poky-linux/ltp (sysroot):
  /opt/ltp/include/tst_epoll.h was added
  /opt/ltp/include/tst_rand_data.h was added

--===============7201675083987800761==
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
meta-yocto-bsp       = "tmp-auh-upgrades:09701b9df4394cf891bb086914b7900595f58fdf"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 17 Mirrors 0 Missed 91 Current 561 (15% match, 86% complete)
Removing 5 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 565 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/btrfs-tools/6.1.2-r0/temp/log.do_packagedata_setscene.695186
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 663 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_setscene)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_252.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_252.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_252.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1347 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1373 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1374 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1376 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_setscene: Started
NOTE: Running task 1496 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: Running task 1571 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1633 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1634 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1657 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1658 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1659 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1664 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1665 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1668 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1671 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_fetch)
NOTE: Running task 1680 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: Running task 1719 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/systemd/1_252.4-r0/temp/log.do_packagedata_setscene.695405
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 667 of 669 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_package_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1743 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1744 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: Running task 1761 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 1803 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_fetch)
NOTE: Running task 1804 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1805 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1806 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_fetch)
NOTE: Running task 1808 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1810 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1811 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1812 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1813 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 1900 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 1901 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_unpack)
NOTE: Running task 1902 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: Running task 1914 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1915 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1916 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_fetch: Succeeded
NOTE: recipe ltp-20230127-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: Running task 1937 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1967 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 1968 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe gdb-12.1-r0: task do_fetch: Started
NOTE: Running task 1981 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: Running task 1985 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe cpio-2.13-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-12.1-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 2032 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_unpack)
NOTE: Running task 2039 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: Running task 2040 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 2041 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230127-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: Running task 2042 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2047 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_unpack)
NOTE: Running task 2048 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2049 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_unpack: Started
NOTE: recipe systemd-1_252.4-r0: task do_package_setscene: Started
NOTE: Running task 2091 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 2092 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 2093 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2094 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2095 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 2099 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 2100 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: recipe cpio-2.13-r0: task do_unpack: Started
NOTE: recipe gdb-12.1-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: Running task 2110 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230127-r0: task do_unpack: Started
NOTE: Running task 2111 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: Running task 2112 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2113 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2115 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2116 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2117 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2118 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: Running task 2119 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_patch)
NOTE: Running task 2120 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: Running task 2121 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe cpio-2.13-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: Running task 2123 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 2124 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2125 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2126 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: Running task 2127 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_patch: Started
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.13-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: Running task 2128 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.13.2-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: Running task 2129 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2130 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: Running task 2131 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2132 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2133 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 2134 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 2135 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2136 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2137 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2138 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2139 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_configure)
NOTE: Running task 2140 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_patch: Succeeded
NOTE: Running task 2141 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2142 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: Running task 2143 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_configure: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2144 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 2145 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2146 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_patch: Succeeded
NOTE: Running task 2147 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 2148 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2149 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: Running task 2150 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: Running task 2151 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_configure)
NOTE: Running task 2152 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230127-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: Running task 2154 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe cpio-2.13-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2155 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe ltp-20230127-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2156 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: Running task 2157 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe ltp-20230127-r0: task do_patch: Succeeded
NOTE: Running task 2158 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_deploy_source_date_epoch)
NOTE: Running task 2159 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 2160 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2161 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic unihash changed to 87e3982a3a8d914a089a32e03f65aecb958f66025e4541972d254fd052c1b199
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 2162 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2163 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2164 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 2165 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe gdb-12.1-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: Running task 2166 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 2167 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe systemd-1_252.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gdb-12.1-r0: task do_patch: Started
NOTE: Running task 2186 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata)
NOTE: Running task 2187 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2189 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2190 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_252.4-r0: task do_packagedata: Started
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2192 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 2193 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2194 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2195 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe gdb-12.1-r0: task do_patch: Succeeded
NOTE: Running task 2196 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 2197 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe systemd-1_252.4-r0: task do_packagedata: Succeeded
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 2200 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: Running task 2202 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2203 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2204 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 2205 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2208 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2209 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2210 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2211 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2213 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2214 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2216 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2218 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2219 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2220 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 2221 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2222 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2223 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2224 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe liburcu-0.13.2-r0: task do_configure: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2225 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2226 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe liburcu-0.13.2-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2227 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2228 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2230 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2234 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2235 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2236 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: Running task 2237 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2238 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2239 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2241 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: Running task 2242 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2243 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_install)
NOTE: recipe liburcu-0.13.2-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2244 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2245 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe liburcu-0.13.2-r0: task do_install: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2246 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_populate_sysroot)
NOTE: Running task 2247 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: Running task 2248 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_package)
NOTE: recipe liburcu-0.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.2-r0: task do_package: Started
NOTE: recipe liburcu-0.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2249 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2250 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: Running task 2251 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2252 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_configure: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: Running task 2254 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_configure: Succeeded
NOTE: Running task 2255 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe ltp-20230127-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2256 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2258 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2259 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: Running task 2260 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2261 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe liburcu-0.13.2-r0: task do_package: Succeeded
NOTE: Running task 2262 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.2.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe liburcu-0.13.2-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2263 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2264 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: Running task 2265 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2266 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_package)
NOTE: Running task 2267 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_populate_sysroot)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2268 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: Running task 2269 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: Running task 2270 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2271 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2273 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2274 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2276 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: Running task 2277 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2279 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2280 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2281 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe cpio-2.13-r0: task do_configure: Succeeded
NOTE: Running task 2282 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_install: Succeeded
NOTE: Running task 2283 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install_ptest_base)
NOTE: recipe cpio-2.13-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm unihash changed to 44e105d299cedd9104fa7803b856c2edccd5f13220531117a24e1381e3d3742d
NOTE: recipe cpio-2.13-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_install)
NOTE: recipe cpio-2.13-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Succeeded
NOTE: Running task 2285 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2286 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package)
NOTE: recipe gawk-5.2.1-r0: task do_package: Started
NOTE: recipe cpio-2.13-r0: task do_install: Succeeded
NOTE: Running task 2287 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package)
NOTE: recipe cpio-2.13-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2289 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2290 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2291 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2292 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2293 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2294 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe cpio-2.13-r0: task do_package: Succeeded
NOTE: Running task 2296 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_packagedata)
NOTE: recipe cpio-2.13-r0: task do_packagedata: Started
NOTE: recipe cpio-2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package_write_rpm)
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package: Succeeded
NOTE: Running task 2301 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2302 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: Running task 2303 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2304 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2305 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm unihash changed to 058f297e1c53b42fcab993b87bce2bda50a54ed54559268fc67ec20b26017e80
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: Running task 2308 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 2309 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2310 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_compile: Succeeded
NOTE: Running task 2311 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_install: Succeeded
NOTE: Running task 2312 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_package)
NOTE: Running task 2313 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_populate_sysroot)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2314 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_configure)
NOTE: recipe gdb-12.1-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_package: Succeeded
NOTE: Running task 2316 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata: Succeeded
NOTE: recipe gdb-12.1-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_compile)
NOTE: recipe gdb-12.1-r0: task do_compile: Started
NOTE: recipe gdb-12.1-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_install)
NOTE: recipe gdb-12.1-r0: task do_install: Started
NOTE: recipe gdb-12.1-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_package)
NOTE: recipe gdb-12.1-r0: task do_package: Started
NOTE: recipe gdb-12.1-r0: task do_package: Succeeded
NOTE: Running task 2320 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_packagedata)
NOTE: recipe gdb-12.1-r0: task do_packagedata: Started
NOTE: recipe gdb-12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2321 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_package_write_rpm)
NOTE: recipe gdb-12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdb-12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_install)
NOTE: recipe ltp-20230127-r0: task do_install: Started
NOTE: recipe ltp-20230127-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package)
NOTE: Running task 2324 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_sysroot)
NOTE: recipe ltp-20230127-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230127-r0: task do_package: Started
NOTE: recipe ltp-20230127-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ltp-20230127-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_packagedata)
NOTE: recipe ltp-20230127-r0: task do_packagedata: Started
NOTE: recipe ltp-20230127-r0: task do_packagedata: Succeeded
NOTE: Running task 2326 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package_write_rpm)
NOTE: Running task 2327 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package_qa)
NOTE: recipe ltp-20230127-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20230127-r0: task do_package_qa: Started
NOTE: recipe ltp-20230127-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2328 of 2328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_build)
NOTE: Tasks Summary: Attempted 2328 tasks of which 2078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7201675083987800761==
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
meta-yocto-bsp       = "tmp-auh-upgrades:09701b9df4394cf891bb086914b7900595f58fdf"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 100 Local 17 Mirrors 0 Missed 83 Current 561 (17% match, 87% complete)
Removing 3 stale sstate objects for arch qemumips...done.
Removing 5 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 565 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/btrfs-tools/6.1.2-r0/temp/log.do_packagedata_setscene.1436740
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 655 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_package_setscene)
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_252.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_252.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_252.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1343 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1371 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1372 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: Running task 1374 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1496 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_setscene: Started
NOTE: Running task 1571 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1661 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1669 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1670 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1674 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1696 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1697 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1698 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1711 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1712 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: Running task 1755 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_fetch)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1797 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_fetch)
NOTE: Running task 1798 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1800 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1802 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_fetch)
NOTE: Running task 1803 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1804 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1805 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 1810 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1811 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: Running task 1853 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1854 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe ltp-20230127-r0: task do_fetch: Started
NOTE: Running task 1961 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1962 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: Running task 1963 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 1973 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 1974 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1975 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1979 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe gdb-12.1-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe cpio-2.13-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/systemd/1_252.4-r0/temp/log.do_packagedata_setscene.1436959
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_package_setscene)
NOTE: Running task 1984 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 1988 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: Running task 1989 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_unpack)
NOTE: Running task 1990 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-12.1-r0: task do_fetch: Succeeded
NOTE: recipe ltp-20230127-r0: task do_fetch: Succeeded
NOTE: Running task 1991 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: Running task 1992 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_unpack)
NOTE: Running task 1993 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_unpack)
NOTE: Running task 1994 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 1995 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 1996 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 1997 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 1998 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: Running task 1999 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 2030 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2044 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: Running task 2092 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe ltp-20230127-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2093 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe gdb-12.1-r0: task do_unpack: Started
NOTE: recipe cpio-2.13-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe gdb-12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: Running task 2103 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_252.4-r0: task do_package_setscene: Started
NOTE: Running task 2104 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2107 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_write_rpm)
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2109 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: Running task 2110 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: Running task 2111 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2112 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2113 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 2114 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2116 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe cpio-2.13-r0: task do_unpack: Succeeded
NOTE: Running task 2117 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: Running task 2118 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb:do_package_write_rpm)
NOTE: Running task 2119 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_patch)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2121 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2122 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe cpio-2.13-r0: task do_patch: Started
NOTE: recipe iproute2-6.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2124 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2125 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: Running task 2126 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: Running task 2127 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2128 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: Running task 2129 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2130 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2131 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2132 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: Running task 2133 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: Running task 2134 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2135 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.13-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2136 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2137 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2138 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2139 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: Running task 2140 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2141 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe ltp-20230127-r0: task do_unpack: Succeeded
NOTE: Running task 2142 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2143 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_patch)
NOTE: Running task 2144 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2145 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: Running task 2146 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe cpio-2.13-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2147 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2148 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: Running task 2149 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_patch: Succeeded
NOTE: Running task 2150 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2151 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Started
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2152 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 2153 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe ltp-20230127-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_lic unihash changed to 87e3982a3a8d914a089a32e03f65aecb958f66025e4541972d254fd052c1b199
NOTE: recipe ltp-20230127-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2155 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 2156 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 2157 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe gdb-12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2158 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_patch)
NOTE: recipe systemd-1_252.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdb-12.1-r0: task do_patch: Started
NOTE: Running task 2177 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: Running task 2178 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2180 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2181 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_252.4-r0: task do_packagedata: Started
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 2183 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2184 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_configure)
NOTE: recipe ltp-20230127-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2185 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2186 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe gdb-12.1-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 2188 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe gdb-12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2189 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 2190 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe systemd-1_252.4-r0: task do_packagedata: Succeeded
NOTE: recipe gdb-12.1-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2193 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2194 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2195 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2196 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 2197 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe gdb-12.1-r0: task do_configure: Succeeded
NOTE: Running task 2198 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_compile)
NOTE: recipe gdb-12.1-r0: task do_compile: Started
NOTE: recipe curl-7.87.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2199 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2200 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2201 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: Running task 2203 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2205 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2206 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2208 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2209 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2210 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2211 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2212 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2213 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2214 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2215 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: Running task 2216 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2217 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2218 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2219 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2220 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2221 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2222 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2223 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2224 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2225 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2226 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: Running task 2227 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2228 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2229 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2230 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2231 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2232 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2233 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2234 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2235 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2237 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2238 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2239 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2240 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe ltp-20230127-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2242 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: recipe ltp-20230127-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2243 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: Running task 2244 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2245 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2246 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2247 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2248 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: Running task 2249 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2250 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: Running task 2251 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: Running task 2252 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2253 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_package)
NOTE: Running task 2254 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2255 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_package: Started
NOTE: Running task 2256 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2257 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: Running task 2258 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2259 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2260 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2261 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: Running task 2262 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2263 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2264 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2265 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe cpio-2.13-r0: task do_configure: Succeeded
NOTE: Running task 2266 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_compile)
NOTE: recipe cpio-2.13-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2267 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2268 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install: Started
NOTE: recipe cpio-2.13-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_install)
NOTE: recipe cpio-2.13-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe cpio-2.13-r0: task do_install: Succeeded
NOTE: Running task 2271 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm unihash changed to f8296e18a59056759e516b15918db9cc66ed0fb5dda73cb655d3cfaa0b089bd3
NOTE: recipe cpio-2.13-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: Running task 2273 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2274 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2275 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2276 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2277 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2278 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe cpio-2.13-r0: task do_package: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package: Started
NOTE: Running task 2279 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2280 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.13-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2281 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe cpio-2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2282 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.13.bb:do_package_write_rpm)
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2283 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe cpio-2.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2284 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2285 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2286 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Succeeded
NOTE: Running task 2287 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2288 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm)
NOTE: Running task 2289 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: Running task 2290 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm unihash changed to 6eb976682063cb4c98212c4cdfc53021ac63c3098b842496290d62436dae006f
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 2292 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: Running task 2293 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 2294 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2295 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdb-12.1-r0: task do_compile: Succeeded
NOTE: Running task 2296 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_install)
NOTE: recipe gdb-12.1-r0: task do_install: Started
NOTE: recipe gdb-12.1-r0: task do_install: Succeeded
NOTE: Running task 2297 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_package)
NOTE: recipe gdb-12.1-r0: task do_package: Started
NOTE: recipe gdb-12.1-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_packagedata)
NOTE: recipe gdb-12.1-r0: task do_packagedata: Started
NOTE: recipe gdb-12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_12.1.bb:do_package_write_rpm)
NOTE: recipe gdb-12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdb-12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_compile: Succeeded
NOTE: Running task 2300 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_install)
NOTE: recipe ltp-20230127-r0: task do_install: Started
NOTE: recipe ltp-20230127-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package)
NOTE: Running task 2302 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_populate_sysroot)
NOTE: recipe ltp-20230127-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230127-r0: task do_package: Started
NOTE: recipe ltp-20230127-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ltp-20230127-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_packagedata)
NOTE: recipe ltp-20230127-r0: task do_packagedata: Started
NOTE: recipe ltp-20230127-r0: task do_packagedata: Succeeded
NOTE: Running task 2304 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package_write_rpm)
NOTE: Running task 2305 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_package_qa)
NOTE: recipe ltp-20230127-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20230127-r0: task do_package_qa: Started
NOTE: recipe ltp-20230127-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230127-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2306 of 2306 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230127.bb:do_build)
NOTE: Tasks Summary: Attempted 2306 tasks of which 2078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.1.3-r0 to 0:6.1.2-r0) [version-going-backwards]
ERROR: btrfs-tools-6.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:252.5-r0 to 1:252.4-r0) [version-going-backwards]
ERROR: systemd-1_252.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7201675083987800761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ltp/ltp-dev: FILELIST: added "/opt/ltp/include/tst_epoll.h /opt/ltp/include/tst_rand_data.h"
packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/fs-bench-test.sh /opt/ltp/testcases/bin/cgroup_regression_9_2.sh /opt/ltp/testcases/bin/modaltr.sh /opt/ltp/testcases/bin/mount03_setuid_test /opt/ltp/testcases/bin/random-access /opt/ltp/testcases/bin/create-files /opt/ltp/testcases/bin/fs-bench-test2.sh /opt/ltp/runtest/ltp-aio-stress.part1 /opt/ltp/testcases/bin/cgroup_regression_6_2 /opt/ltp/runtest/ltp-aio-stress.part2 /opt/ltp/testcases/bin/cgroup_regression_9_1.sh /opt/ltp/testcases/bin/getitimer03 /opt/ltp/testcases/bin/fork02 /opt/ltp/testcases/bin/setitimer03 /opt/ltp/testcases/bin/random-access-del-create", added "/opt/ltp/testcases/bin/madvise03 /opt/ltp/testcases/bin/nice05 /opt/ltp/testcases/bin/dirtyc0w_shmem_child /opt/ltp/testcases/bin/cgroup_regression_6_2.sh /opt/ltp/testcases/bin/hugemmap08 /opt/ltp/testcases/bin/hugefallocate01 /opt/ltp/testcases/bin/hugemmap18 /opt/ltp/testcases/bin/hugemmap28 /opt/ltp/testcases/bin/hugefallocate02 /
 opt/ltp/testcases/bin/hugemmap07 /opt/ltp/testcases/bin/hugemmap17 /opt/ltp/testcases/bin/hugemmap27 /opt/ltp/testcases/bin/hugemmap26 /opt/ltp/testcases/bin/cgroup_core02 /opt/ltp/testcases/bin/hugemmap25 /opt/ltp/testcases/bin/hugemmap14 /opt/ltp/testcases/bin/hugemmap24 /opt/ltp/testcases/bin/hugemmap23 /opt/ltp/testcases/bin/hugemmap22 /opt/ltp/testcases/bin/hugefork02 /opt/ltp/testcases/bin/prctl10 /opt/ltp/testcases/bin/hugemmap21 /opt/ltp/testcases/bin/hugemmap31 /opt/ltp/testcases/bin/cve-2022-4378 /opt/ltp/testcases/bin/hugefork01 /opt/ltp/testcases/bin/dirtyc0w_shmem /opt/ltp/testcases/bin/hugemmap10 /opt/ltp/testcases/bin/hugemmap20 /opt/ltp/testcases/bin/openat04 /opt/ltp/testcases/bin/mount03_suid_child /opt/ltp/testcases/bin/hugemmap19 /opt/ltp/testcases/bin/hugemmap09 /opt/ltp/testcases/bin/hugemmap29 /opt/ltp/testcases/bin/hugemmap16 /opt/ltp/testcases/bin/hugemmap15 /opt/ltp/runtest/ltp-aio-stress /opt/ltp/testcases/bin/hugemmap13 /opt/ltp/testcases/bin/hugemmap12 /
 opt/ltp/testcases/bin/hugemmap11 /opt/ltp/testcases/bin/hugemmap30"
Changes to packages/core2-32-poky-linux/ltp (sysroot):
  /opt/ltp/include/tst_epoll.h was added
  /opt/ltp/include/tst_rand_data.h was added

--===============7201675083987800761==--

