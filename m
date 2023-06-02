Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2B6CA9EAD
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7629.1685693432005786442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yj1wGI9e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b288845-c36dffb3-74bf-4901-9ab1-2a9d93982c26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zDbSmJ0CAspbKBYlI1+PKBesNkt6vUQ/n5MOIVx73+8=;
	b=Yj1wGI9ewG3lJ8ZTp7HMuueZK6fN9vvkQ/5PGQMr5sAtJE7vQPl8uq/fCVLaFDU4
	j5u7rHw83Pw4AHWgGP2I0XeFqfNgBZLgquPOUl7IOE9ctzT2ILeIQn4eVp90wCr7d/m
	plFzDUchZo3ELnQy5341Kap2WEOkK1tCIUdrD9OI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zDbSmJ0CAspbKBYlI1+PKBesNkt6vUQ/n5MOIVx73+8=;
	b=I4sqgqvof384a4aCSmjYiSB6OWNlSTzEezHDd0SrQoUrsfsz3yR//OBjxVn1d10m
	EGqyn2iJWBs8mCeWXg1ZNs/B7c6KGq9rgarRIpf0NTC1SVdroLvQG10pbxrSGaMhnIz
	zrCfR4So+YiroF5FMwq834/RCRW/PzJ0v2d/61mc=
Content-Type: multipart/mixed; boundary="===============0127835539414607567=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20230516 SUCCEEDED
Message-ID: <010101887b288845-c36dffb3-74bf-4901-9ab1-2a9d93982c26-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182230

--===============0127835539414607567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ltp* to *20230516* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20230127-20230516.patch
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
--===============0127835539414607567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:328cc442cffc00c60c1d497ed09daa8fe1f49e27"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 125 Local 21 Mirrors 0 Missed 104 Current 549 (16% match, 84% complete)
Removing 2 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 564 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 569 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 670 of 674 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-native-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 672 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-native-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.2855250
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 673 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1210 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 1218 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1430 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Started
NOTE: Running task 1561 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1562 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1574 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1611 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1612 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 1613 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 1614 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: Running task 1697 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 1719 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1756 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1759 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: Running task 1761 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1762 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1763 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1767 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 1770 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running task 1793 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: Running task 1826 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_fetch)
NOTE: Running task 1828 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1856 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: Running task 1857 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1859 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1860 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: Running task 1861 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: Running task 1864 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: Running task 1896 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1897 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1898 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1899 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 1900 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 1901 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1937 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: Running task 1938 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: Running task 1982 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 1983 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: Running task 1984 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1985 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Started
NOTE: Running task 1997 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1998 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_fetch)
NOTE: Running task 2003 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: Running task 2020 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2021 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: Running task 2035 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_unpack)
NOTE: Running task 2036 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: Running task 2050 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: Running task 2060 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: Running task 2061 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2075 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2076 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 2077 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 2078 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2079 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: Running task 2080 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2081 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2082 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2083 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2084 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2085 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 2086 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 2087 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 2088 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 2089 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 2090 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: Running task 2091 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 2092 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: Running task 2093 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2094 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 2095 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: Running task 2096 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: Running task 2097 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 2102 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2103 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 2104 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2105 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 2106 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 2107 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2108 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_unpack)
NOTE: Running task 2109 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2110 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: Running task 2111 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: Running task 2112 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: Running task 2113 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Started
NOTE: Running task 2114 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: Running task 2115 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 2116 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2117 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2118 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2119 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2120 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2121 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: Running task 2122 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: Running task 2124 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2125 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 2126 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2127 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2128 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 2129 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 2130 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: Running task 2131 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 2132 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: Running task 2133 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 2134 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Started
NOTE: Running task 2135 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2136 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2137 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2138 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 2139 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2140 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: Running task 2141 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2142 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2143 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: Running task 2144 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2145 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2146 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: Running task 2147 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: Running task 2148 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2149 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2150 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 2151 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2153 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2154 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: Running task 2155 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2168 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: Running task 2169 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2170 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2171 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: Running task 2172 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: Running task 2173 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: Running task 2174 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_configure)
NOTE: Running task 2175 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: Running task 2176 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2177 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2180 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2181 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2182 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2183 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2184 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2185 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm unihash changed to 323f22c89fd6174545a0d5ce48d82e1b153401bbd0fac3fca70dbc0f70d0b824
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2186 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2187 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2188 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2189 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2190 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2191 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2192 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2193 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2195 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2196 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2197 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 2198 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2199 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2200 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2201 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to c3ca39641415af11b18e51985610882b5db34385bc62c01c84eed5aaa2c8cfb1
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2202 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2203 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: Running task 2205 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2207 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 2208 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2209 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2210 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2211 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2213 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2214 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2215 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2216 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2217 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2220 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: Running task 2221 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2223 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2224 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2225 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: Running task 2226 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 2227 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2230 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2231 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2232 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 2233 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2234 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Succeeded
NOTE: Running task 2235 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_install)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: Running task 2237 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 2239 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2240 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2241 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2243 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Succeeded
NOTE: Running task 2244 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2245 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Succeeded
NOTE: Running task 2246 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package)
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2247 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2248 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2249 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2250 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2251 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_package)
NOTE: Running task 2254 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_package: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Succeeded
NOTE: Running task 2255 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2256 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Failed
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_package: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2256 tasks of which 2042 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 38 ERROR messages, returning a non-zero exit code.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/btrfs-tools/6.3-r0/temp/log.do_packagedata.2948296
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata) failed with exit code '1'

--===============0127835539414607567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:328cc442cffc00c60c1d497ed09daa8fe1f49e27"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 22 Mirrors 0 Missed 104 Current 548 (17% match, 84% complete)
Removing 3 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 550 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 564 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 569 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 671 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1210 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 1217 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1430 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3066720
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 673 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1513 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_fetch: Succeeded
NOTE: Running task 1514 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 1515 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1532 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1576 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1613 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 1614 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1615 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 1616 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1685 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1701 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 1722 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1732 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 1760 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1764 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: Running task 1765 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: Running task 1769 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: Running task 1772 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1795 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: Running task 1828 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_fetch)
NOTE: Running task 1829 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: Running task 1858 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: Running task 1859 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: Running task 1860 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1861 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1862 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: Running task 1891 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: Running task 1892 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1893 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1894 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 1895 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1899 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 1905 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: Running task 1911 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 1915 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: Running task 1916 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Started
NOTE: Running task 1987 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: Running task 1988 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 1989 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 1990 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 1991 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1992 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: Running task 1997 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_unpack)
NOTE: Running task 2002 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_fetch)
NOTE: Running task 2003 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 2009 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2018 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 2019 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: Running task 2020 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2021 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: Running task 2027 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: Running task 2028 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 2029 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: Running task 2045 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2046 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: Running task 2047 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2048 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2049 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: Running task 2050 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2051 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2052 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 2053 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 2054 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: Running task 2055 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 2060 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: Running task 2066 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2081 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2090 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2098 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: Running task 2099 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2100 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2101 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2102 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Succeeded
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: Running task 2105 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2106 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_unpack)
NOTE: Running task 2107 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2108 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: Running task 2109 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: Running task 2110 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2111 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: Running task 2112 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2113 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2114 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2115 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2116 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: Running task 2117 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2118 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Started
NOTE: Running task 2119 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 2120 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: Running task 2121 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2122 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: Running task 2123 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2124 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2125 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2126 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2127 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: Running task 2128 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2129 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2130 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: Running task 2131 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: Running task 2132 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 2133 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2134 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 2135 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2136 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Succeeded
NOTE: Running task 2137 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: Running task 2138 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_patch)
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2139 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2140 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2141 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2142 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: Running task 2143 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2144 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: Running task 2145 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2146 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2147 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: Running task 2148 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2149 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Succeeded
NOTE: Running task 2150 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2151 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: Running task 2152 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: Running task 2153 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2154 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: Running task 2155 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2156 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2157 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2170 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: Running task 2171 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2172 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_configure)
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2173 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: Running task 2174 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: Running task 2175 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Started
NOTE: Running task 2176 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2177 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2180 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2181 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2182 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2183 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm unihash changed to d69627556255d55b654e1e6a09988b13781dbc4710e947336f9e5e4045408ef7
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2184 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2185 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2186 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: Running task 2187 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2188 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2189 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2191 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2192 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2193 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2195 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2196 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2197 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2198 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2199 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2200 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2201 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to 29dc627d6d00950f803f526baf51b204cc20d1a34515e049a7815637e6a3f0bd
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2202 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Succeeded
NOTE: Running task 2203 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: Running task 2204 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: Running task 2205 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Started
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2207 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2208 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2209 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2210 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2211 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2213 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: Running task 2214 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2215 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2216 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: Running task 2217 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: Running task 2220 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2221 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: Running task 2222 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2224 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: Running task 2225 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_unpack: Succeeded
NOTE: Running task 2226 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2227 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_symlink_kernsrc: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_symlink_kernsrc: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 2228 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: Running task 2229 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: Running task 2230 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: Running task 2231 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_checkout: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2232 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2233 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2234 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2236 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2237 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Succeeded
NOTE: Running task 2238 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 2239 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2240 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2243 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: Running task 2244 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2245 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2246 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: Running task 2247 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2248 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Succeeded
NOTE: Running task 2249 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package)
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2251 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2252 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: Running task 2253 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Succeeded
NOTE: Running task 2254 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Failed
NOTE: recipe iptables-1.8.9-r0: task do_install: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_checkout: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2254 tasks of which 2042 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 38 ERROR messages, returning a non-zero exit code.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/btrfs-tools/6.3-r0/temp/log.do_packagedata.3199510
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata) failed with exit code '1'

--===============0127835539414607567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/data/file01/in.ksh /opt/ltp/testcases/data/file01/in.csh /opt/ltp/testcases/bin/testall.sh /opt/ltp/testcases/bin/tomoyo_rewrite_test /opt/ltp/testcases/bin/fcntl06 /opt/ltp/testcases/bin/tomoyo_file_test /opt/ltp/testcases/bin/semget03 /opt/ltp/testcases/bin/semget06 /opt/ltp/testcases/bin/setns_check /opt/ltp/testcases/bin/ns_create /opt/ltp/testcases/bin/newns /opt/ltp/testcases/bin/tomoyo_new_test /opt/ltp/testcases/bin/sem02 /opt/ltp/testcases/bin/sem01 /opt/ltp/testcases/bin/fcntl06_64 /opt/ltp/bin/execltp /opt/ltp/testcases/bin/runutstests_noltp.sh /opt/ltp/testcases/bin/tomoyo_filesystem_test /opt/ltp/testcases/bin/tomoyo_policy_io_test /opt/ltp/testcases/bin/ns_exec /opt/ltp/testcases/bin/ns_ifmove /opt/ltp/testcases/bin/tomoyo_accept_test /opt/ltp/testcases/bin/tomoyo_policy_memory_test /opt/ltp/testcases/bin/tomoyo_new_file_test /opt/ltp/testcases/bin/utstest", added "/opt/ltp/testcases/bin/tst_ns_
 create /opt/ltp/testcases/bin/semop05 /opt/ltp/testcases/bin/semop04 /opt/ltp/testcases/bin/fsconfig03 /opt/ltp/testcases/bin/cgroup_core03 /opt/ltp/testcases/bin/nfs08.sh /opt/ltp/testcases/bin/mq_notify03 /opt/ltp/testcases/bin/utsname04 /opt/ltp/testcases/bin/kvm_svm01 /opt/ltp/testcases/bin/utsname02 /opt/ltp/testcases/bin/utsname03 /opt/ltp/testcases/bin/utsname01 /opt/ltp/testcases/bin/hugemmap32 /opt/ltp/testcases/bin/madvise11 /opt/ltp/testcases/bin/mmap20 /opt/ltp/testcases/bin/mount07 /opt/ltp/testcases/bin/tst_ns_exec /opt/ltp/testcases/bin/tst_ns_ifmove /opt/ltp/testcases/bin/mprotect05 /opt/ltp/testcases/bin/tst_fsfreeze"

--===============0127835539414607567==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20230127-20230516.patch"

RnJvbSBmOWVjYjA3MDAzMjM3ZTRjNzliZDUwMjVmNjY3NDY0YzUyOTUzNmViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAyMDoxMzowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
cDogdXBncmFkZSAyMDIzMDEyNyAtPiAyMDIzMDUxNgoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbHRwL3tsdHBfMjAyMzAxMjcuYmIgPT4gbHRwXzIwMjMwNTE2LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9sdHAve2x0cF8yMDIzMDEyNy5iYiA9PiBsdHBfMjAyMzA1MTYuYmJ9ICg5
OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyMzAxMjcu
YmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDIzMDUxNi5iYgpzaW1pbGFyaXR5
IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDIz
MDEyNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyMzA1MTYu
YmIKaW5kZXggNDMyNWFhNjY3Mi4uODgyMmZkNDY3NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2x0cC9sdHBfMjAyMzAxMjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2x0cC9sdHBfMjAyMzA1MTYuYmIKQEAgLTI0LDcgKzI0LDcgQEAgVFVORV9DQ0FSR1M6cmVtb3Zl
Ong4Ni02NCA9ICItbWZwbWF0aD1zc2UiCiAKIENGTEFHUzphcHBlbmQ6cG93ZXJwYzY0ID0gIiAt
RF9fU0FORV9VU0VSU1BBQ0VfVFlQRVNfXyIKIENGTEFHUzphcHBlbmQ6bWlwc2FyY2huNjQgPSAi
IC1EX19TQU5FX1VTRVJTUEFDRV9UWVBFU19fIgotU1JDUkVWID0gImRkMmQ2MWFjMWExZTA5Nzk3
YTYxNjVmNDc4YWJkNGE5ZjRmNDMwMzUiCitTUkNSRVYgPSAiM2ViYzJkZmE4NWMyNDQ1YmI2OGQ4
YzBkNjZlMzNjNGRhMWUxYjNhNyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpbnV4
LXRlc3QtcHJvamVjdC9sdHAuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1SZW1vdmUtT09NLXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRj
aCBcCi0tIAoyLjM5LjIKCg==

--===============0127835539414607567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 48 recipes from the core2-32 sysroot...done.
Removing 110 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:328cc442cffc00c60c1d497ed09daa8fe1f49e27"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 468 Local 364 Mirrors 0 Missed 104 Current 185 (77% match, 84% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 187 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 188 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 189 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-4.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 726 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 728 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 753 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: Running task 770 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 332 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_packagedata_setscene)
NOTE: Running task 782 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 783 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 784 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running setscene task 333 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running task 785 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 803 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 804 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 813 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 814 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: Running task 815 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 816 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: Running task 825 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 826 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_fetch)
NOTE: Running task 827 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 828 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 829 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: Running task 830 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: Running task 831 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 855 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 856 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_fetch)
NOTE: Running task 858 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_packagedata_setscene)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe procps-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: Running setscene task 348 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: Running task 901 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: Running setscene task 350 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 365 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 908 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 909 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 910 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 911 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 912 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: Running task 913 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 914 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 915 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 367 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 917 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Started
NOTE: recipe procps-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running setscene task 374 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.4026633
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 378 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 382 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: Running setscene task 383 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_setscene)
NOTE: Running setscene task 396 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 918 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 946 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: Running task 947 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: Running task 948 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 957 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 958 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 959 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 960 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 968 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: Running task 969 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 974 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 978 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 985 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: Running task 989 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: Running task 990 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 433 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 434 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 991 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 992 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 993 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: Running task 994 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: Running task 995 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 1004 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1005 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_unpack)
NOTE: Running task 1006 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Started
NOTE: Running task 1007 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1008 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 1009 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 1013 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: Running setscene task 439 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 454 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_setscene)
NOTE: Running setscene task 457 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running setscene task 462 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 467 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 470 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 472 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 476 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1025 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 484 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1070 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1077 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 1078 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1081 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 1082 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1083 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1084 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1089 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1090 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_package_setscene: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Started
NOTE: Running task 1091 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: Running task 1092 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 496 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1101 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1106 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: Running task 1140 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1141 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 522 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1150 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: Running task 1151 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 531 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1152 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1153 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 532 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Started
NOTE: Running task 1154 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1163 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running setscene task 546 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1181 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Succeeded
NOTE: Running task 1189 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1190 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: Running task 1195 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: Running task 1196 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1197 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1198 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: Running task 1199 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: Running task 1200 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: Running task 1206 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1216 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: Running task 1222 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: Running task 1224 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: Running task 1225 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: Running task 1226 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 556 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1235 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 561 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 564 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1240 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_setscene: Started
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe curl-8.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1249 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 576 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 1262 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_setscene)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 588 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 653 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1606 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1626 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1779 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1789 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1800 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1815 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1832 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1868 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1879 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1892 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1904 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1936 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1994 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2011 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: Running task 2016 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2017 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2019 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2036 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2048 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2049 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2051 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2052 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2053 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: Running task 2054 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2055 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2056 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2057 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2058 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: Running task 2059 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2060 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: Running task 2061 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2062 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2063 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: Running task 2064 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2065 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: Running task 2066 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2067 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: Running task 2068 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2069 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2070 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2071 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2072 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2073 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 2074 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: Running task 2075 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: Running task 2076 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2077 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2078 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 2079 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: Running task 2084 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2085 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2086 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2087 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2088 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2089 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2090 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2091 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2092 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm unihash changed to c6dbaafa66d2eb6a8ec7f8220bb15989e5c17a32af2a89292352541c182348a4
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2093 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: Running task 2095 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: Running task 2096 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: Running task 2097 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2098 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2099 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Succeeded
NOTE: Running task 2100 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 2101 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2102 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: Running task 2104 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2105 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 2106 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2107 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2108 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2109 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2110 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2111 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2112 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2113 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2114 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2115 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: Running task 2116 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2117 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 2118 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2119 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 2120 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: Running task 2121 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2122 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2123 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2124 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: Running task 2125 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2126 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: Running task 2127 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Succeeded
NOTE: Running task 2128 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Started
NOTE: Running task 2129 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2130 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2131 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2132 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2133 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Succeeded
NOTE: Running task 2134 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Started
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2136 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.9-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_package)
NOTE: Running task 2139 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_package: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2140 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: Running task 2141 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2142 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Failed
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_package: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2142 tasks of which 1927 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 38 ERROR messages, returning a non-zero exit code.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/btrfs-tools/6.3-r0/temp/log.do_packagedata.4182811
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata) failed with exit code '1'

--===============0127835539414607567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:328cc442cffc00c60c1d497ed09daa8fe1f49e27"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 22 Mirrors 0 Missed 104 Current 540 (17% match, 84% complete)
Removing 3 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 542 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 556 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 561 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 663 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1210 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 1218 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1429 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3345313
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 665 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: Running task 1438 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_fetch: Succeeded
NOTE: Running task 1439 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 1440 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1527 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1576 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1613 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1614 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 1615 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 1616 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1683 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 1701 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1722 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1731 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1757 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1763 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_unpack: Started
NOTE: Running task 1764 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: Running task 1768 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: Running task 1769 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running task 1789 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: Running task 1820 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: Running task 1822 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_fetch)
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: Running task 1845 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 1846 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: Running task 1848 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 1849 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: Running task 1850 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 1884 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: Running task 1885 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1886 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 1887 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1888 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: Running task 1900 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1901 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 1902 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: Running task 1932 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: Running task 1933 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Started
NOTE: Running task 1975 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_fetch)
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 1976 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1980 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: Running task 2015 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 2016 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: Running task 2017 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_unpack)
NOTE: Running task 2026 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 2027 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2040 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2041 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 2042 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2054 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: Running task 2055 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: Running task 2056 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: Running task 2057 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: Running task 2058 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: Running task 2061 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Started
NOTE: Running task 2063 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 2064 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2065 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2066 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: Running task 2067 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2068 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: Running task 2069 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 2070 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Started
NOTE: Running task 2071 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 2072 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2073 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 2074 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 2075 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: Running task 2076 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2077 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2078 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2079 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 2080 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2081 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: Running task 2082 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_unpack)
NOTE: Running task 2083 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 2084 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 2085 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: Running task 2086 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: Running task 2088 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 2089 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2090 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: Running task 2091 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: Running task 2093 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2094 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running task 2095 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2096 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2098 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2099 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: Running task 2100 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2101 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2102 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2103 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2104 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: Running task 2105 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: Running task 2107 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2108 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2109 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2110 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2111 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2112 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 2113 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2114 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: Running task 2115 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2117 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_patch)
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2118 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2119 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2120 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2121 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: Running task 2123 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2124 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2125 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2126 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2127 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2128 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: Running task 2129 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Succeeded
NOTE: Running task 2130 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: Running task 2131 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: Running task 2132 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2133 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: Running task 2134 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: Running task 2148 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2149 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: Running task 2150 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2151 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: Running task 2152 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: Running task 2153 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: Running task 2154 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: Running task 2155 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2156 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2157 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2160 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm unihash changed to 42dcb578e85f62e0275357d55448e0359c8da1bfdad846eecd9b04f4d4a2a2ba
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 2161 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2162 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2163 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2164 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2165 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2166 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2167 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2168 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2169 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2170 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: Running task 2171 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2173 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: Running task 2174 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2175 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2177 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2178 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2179 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to 9d4159c521bea23483bff350b2990f3f6d9b3e05ab0b11a75431fe504314c465
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2180 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2181 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Succeeded
NOTE: Running task 2182 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: Running task 2184 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2185 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2186 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: Running task 2187 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2188 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2189 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2191 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2192 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2193 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2194 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2195 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2196 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2197 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2198 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2199 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2200 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 2201 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2204 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 2205 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2206 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2207 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2209 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: Running task 2210 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2211 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2212 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_unpack: Succeeded
NOTE: Running task 2213 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2214 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_kernel_checkout: Started
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: Running task 2215 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2216 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Succeeded
NOTE: Running task 2217 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2218 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2219 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2221 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 2222 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2223 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: Running task 2225 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2227 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2228 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: Running task 2229 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2230 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe iptables-1.8.9-r0: task do_install: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: Running task 2231 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_package)
NOTE: Running task 2232 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_package: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Failed
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_package: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_kernel_checkout: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2233 tasks of which 2020 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 38 ERROR messages, returning a non-zero exit code.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/btrfs-tools/6.3-r0/temp/log.do_packagedata.3442530
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata) failed with exit code '1'

--===============0127835539414607567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:328cc442cffc00c60c1d497ed09daa8fe1f49e27"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 22 Mirrors 0 Missed 104 Current 548 (17% match, 84% complete)
Removing 3 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 550 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 564 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 569 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 671 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3525116
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 673 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1210 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 1217 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1429 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1542 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1543 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1574 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1611 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1612 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 1613 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1614 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: Running task 1698 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1728 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1729 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 1758 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1762 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: Running task 1763 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1767 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running task 1770 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: Running task 1793 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1818 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1819 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1828 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: Running task 1829 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_fetch)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Succeeded
NOTE: Running task 1830 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 1831 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1832 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1833 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 1834 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 1835 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 1836 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: Running task 1865 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1866 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: Running task 1867 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: Running task 1868 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 1870 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 1909 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: Running task 1910 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1911 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: Running task 1912 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1916 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: Running task 1917 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: Running task 1924 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1925 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1926 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: Running task 1928 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1929 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: Running task 1930 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: Running task 1931 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 1949 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: Running task 1956 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1987 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1992 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1993 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 1994 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: Running task 2006 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2013 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_fetch)
NOTE: Running task 2014 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: Running task 2015 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 2020 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 2022 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2023 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2024 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2026 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: Running task 2027 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2028 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 2029 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2030 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 2041 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: Running task 2060 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: Running task 2083 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: Running task 2099 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2100 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 2101 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2102 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 2104 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2105 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Succeeded
NOTE: Running task 2107 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2108 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_unpack)
NOTE: Running task 2109 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 2110 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2111 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2112 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2113 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: Running task 2114 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2115 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: Running task 2117 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: Running task 2118 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2119 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2120 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2121 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 2122 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2124 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: Running task 2125 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2126 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2127 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: Running task 2128 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2129 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2130 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: Running task 2131 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 2132 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2133 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2134 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: Running task 2135 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2136 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2137 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: Running task 2138 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: Running task 2139 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2140 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2141 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: Running task 2142 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2143 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_patch)
NOTE: Running task 2144 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2145 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 2146 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Started
NOTE: Running task 2147 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: Running task 2148 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: Running task 2149 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: Running task 2150 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: Running task 2151 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: Running task 2152 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Succeeded
NOTE: Running task 2153 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: Running task 2154 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 2155 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: Running task 2168 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2169 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: Running task 2170 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: Running task 2171 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2172 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: Running task 2173 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_configure)
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Started
NOTE: Running task 2174 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2175 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: Running task 2176 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: Running task 2177 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2180 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2181 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2182 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm unihash changed to 981a6890c7705619a249fe2f681d9d180bd2376ea7bd2db24ae3037729bf8c06
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2184 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2185 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2186 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to 7a40ad16159fd42468d502f392af93a1e0fa0145fad766805c737265d64aa213
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2188 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2189 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 2190 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 2191 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2192 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2193 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2194 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2195 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2196 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2197 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2198 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2199 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2200 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2201 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2202 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2203 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: Running task 2205 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Started
NOTE: Running task 2206 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2207 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: Running task 2208 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2209 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: Running task 2210 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2211 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: Running task 2212 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Succeeded
NOTE: Running task 2213 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2214 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2215 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2217 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: Running task 2218 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: Running task 2219 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2222 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: Running task 2223 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2224 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2225 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2226 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2227 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2229 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 2230 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: Running task 2231 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2232 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2233 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: Running task 2234 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 2236 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2237 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2238 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2239 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2240 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Succeeded
NOTE: Running task 2241 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_install)
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2243 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2244 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2245 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2246 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2247 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2248 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Succeeded
NOTE: Running task 2249 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2251 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_package)
NOTE: Running task 2254 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2255 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2256 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Succeeded
NOTE: Running task 2257 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2258 of 2356 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_configure)
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Failed
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_package: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2258 tasks of which 2042 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 23 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 38 ERROR messages, returning a non-zero exit code.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/btrfs-tools/6.3-r0/temp/log.do_packagedata.3627167
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata) failed with exit code '1'

--===============0127835539414607567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ltp: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/ns_ifmove /opt/ltp/testcases/bin/.debug/tomoyo_new_test /opt/ltp/testcases/bin/.debug/fcntl06_64 /opt/ltp/testcases/bin/.debug/tomoyo_file_test /opt/ltp/testcases/bin/.debug/newns /opt/ltp/testcases/bin/.debug/tomoyo_filesystem_test /opt/ltp/testcases/bin/.debug/tomoyo_policy_io_test /opt/ltp/testcases/bin/.debug/setns_check /opt/ltp/testcases/bin/.debug/ns_exec /opt/ltp/testcases/bin/.debug/semget06 /opt/ltp/testcases/bin/.debug/semget03 /opt/ltp/testcases/bin/.debug/ns_create /opt/ltp/testcases/bin/.debug/tomoyo_rewrite_test /opt/ltp/testcases/bin/.debug/utstest /opt/ltp/testcases/bin/.debug/sem02 /opt/ltp/testcases/bin/.debug/sem01 /opt/ltp/testcases/bin/.debug/fcntl06 /opt/ltp/testcases/bin/.debug/tomoyo_new_file_test /opt/ltp/testcases/bin/.debug/tomoyo_policy_memory_test /opt/ltp/testcases/bin/.debug/tomoyo_accept_test", added "/opt/ltp/testcases/bin/.debug/hugemmap32 /opt/ltp/testcases/b
 in/.debug/mprotect05 /opt/ltp/testcases/bin/.debug/tst_fsfreeze /opt/ltp/testcases/bin/.debug/tst_ns_exec /opt/ltp/testcases/bin/.debug/madvise11 /opt/ltp/testcases/bin/.debug/mmap20 /opt/ltp/testcases/bin/.debug/cgroup_core03 /opt/ltp/testcases/bin/.debug/mount07 /opt/ltp/testcases/bin/.debug/tst_ns_create /opt/ltp/testcases/bin/.debug/mq_notify03 /opt/ltp/testcases/bin/.debug/utsname04 /opt/ltp/testcases/bin/.debug/fsconfig03 /opt/ltp/testcases/bin/.debug/utsname01 /opt/ltp/testcases/bin/.debug/utsname03 /opt/ltp/testcases/bin/.debug/utsname02 /opt/ltp/testcases/bin/.debug/semop05 /opt/ltp/testcases/bin/.debug/semop04 /opt/ltp/testcases/bin/.debug/tst_ns_ifmove /opt/ltp/testcases/bin/.debug/kvm_svm01"
packages/core2-32-poky-linux/ltp/ltp-dbg: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 782227096 to 793568040 (+1%)
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-dev: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-dev: PKGSIZE changed from 273448 to 275282 (+1%)
packages/core2-32-poky-linux/ltp/ltp-dev: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-doc: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-doc: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-locale: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-locale: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/securebits, directory renamed /usr
 /src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sbrk -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_nanosleep -> /usr/src
 /debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rename, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpswap -> /usr/src/debug/ltp/20230516-r0/libs/libltpswap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/2023012
 7-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/libclone -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/libclone, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fremovexattr -> /usr/src
 /debug/ltp/20230516-r0/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/abs -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, direct
 ory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20230516-r0/testcase
 s/open_posix_testsuite/conformance/interfaces/pthread_cond_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/llseek, direct
 ory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/f00f -> /usr/src/debug/ltp/20230516-r0/testcases/misc/f00f, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/pci/tpci_kernel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/modify_ldt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/modify_ldt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallopt, direc
 tory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/
 conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unlink -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared ->
  /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/fsync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/d
 ebug/ltp/20230127-r0/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/int
 erfaces/pthread_once, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_delete -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kern
 el/syscalls/fsetxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fallocate, dire
 ctory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/pty -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/pty, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/inode, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/netstress -> /usr/src/debug/ltp/20230516-r0/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20230127-r0/testcase
 s/realtime/perf/latency -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20230127-r0/utils/sctp/func_tests -> /usr/src/debug/ltp/20230516-r0/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrl
 ock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/keyctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched
 _setparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/s
 yscalls/execl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdtablesize -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdtablesize, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20230127
 -r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20230127-r0/tes
 tcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuse
 t_load_balance_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount_setattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount_setattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20230516-r0/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pread, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/vfork, directory rename
 d /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/hyperthreading/ht
 _affinity, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20230127-r0/tools/apicmds -> /usr/src/debug/ltp/20230516-r0/tools/apicmds, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20230516-r0/t
 estcases/open_posix_testsuite/conformance/interfaces/sigfillset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, direc
 tory renamed /usr/src/debug/ltp/20230127-r0/tools/genload -> /usr/src/debug/ltp/20230516-r0/tools/genload, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fork, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20230516-r0/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/page -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmget -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmg
 et, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20230516-r0/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpnewipc -> /usr/src/debug/ltp/20230516-r0/libs/libltpnewipc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmdt,
  directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pipe -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_create, directory renamed /usr/s
 rc/debug/ltp/20230127-r0/testcases/kernel/include -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ustat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/lib -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy 
 -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recvfrom, directory renamed /usr/src/debug/ltp
 /20230127-r0/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/filecaps -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/
 pthread_detach -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/renameat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/co
 nformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/time, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20230127-r0/te
 stcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/power_management -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/power_management, di
 rectory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20230127-r0/lib -> /usr/src/debug/ltp/20230516-r0/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pkeys -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pkeys, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /us
 r/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setsockopt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/cfs-schedule
 r -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/cfs-scheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/
 ltp/20230516-r0/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signalfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/mqns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fs_fill, directory renamed /usr/src/debug/ltp/20230127-r0/
 testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/can/cve -> /usr/src/debug/ltp/20230516-r0/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite
 /conformance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ulimit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/inotify -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/inter
 faces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/include -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/netns -> /usr/src/d
 ebug/ltp/20230516-r0/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20230516-r0/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpsigwait -> /usr/src/debug/l
 tp/20230516-r0/libs/libltpsigwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umount2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umount2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sys
 calls/ipc/shmat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_settime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/aio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpvdso -> /usr/src/debug/ltp/20230516-r0/libs/libltpvdso, directory renamed /usr
 /src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/splice, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/sched_football -> /usr/src/debug/l
 tp/20230516-r0/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20230516-r0/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_setup 
 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthrea
 d_getspecific -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execve, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/sctp -> /usr/src/debug/ltp/20230516-r0/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/lt
 p/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20230516-r0/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcontext -> /usr/s
 rc/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20230127-r0/utils/sctp/include/netinet -> /usr/src/debug/ltp/20230516-r0/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendto -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat2 -
 > /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_adjtime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20230516-r0/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20230516-r0/testcases/realtime
 /stress/pi-tests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/smack -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgget -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/regression -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/regression, directory renamed /
 usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gethostname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, directory renamed /usr
 /src/debug/ltp/20230127-r0/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/irq -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20230516
 -r0/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/lib -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20230516-r0/testcases/open_pos
 ix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/crash -> /usr/src/debug/ltp/20230516-r0/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr
 /src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/hotplu
 g/memory_hotplug, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugefallocate -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugefallocate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/periodic_cpu_load -> /usr
 /src/debug/ltp/20230516-r0/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20230516-r0/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/syslog -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functio
 nal/timers/timers, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuacct, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20230
 127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/symlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_syscall_test 
 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getitimer, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src
 /debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_pwait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/request_key, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpipc -> /usr/src/debug/ltp/20230516-r0/libs/libltpipc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/bpf -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/
 bpf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open_tree, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_t
 estsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/doio/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/wait4 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/timens -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/
 kernel/syscalls/select -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/select, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/prio-wake -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/time 
 -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/autogroup, directory ren
 amed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20230127-r0/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20230516-r0/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clone3 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/uaccess -
 > /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/commands/eject -> /usr/src/debug/ltp/20230516-r0/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmdt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/
 20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrandom -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrandom, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_set
 affinity -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/doio 
 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug/ltp/20230127-r0/include -> /usr/src/debug/ltp/20230516-r0/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/spec
 ulative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/input -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/crypto -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/s
 etpgrp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfa
 ces/mq_unlink -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtyc0w_shmem -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/dirtyc0w_shmem, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, direc
 tory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kerne
 l/syscalls/access -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/access, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/ke
 rnel/syscalls/munmap -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/munmap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_destroy -> /usr/src/
 debug/ltp/20230516-r0/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pselect, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/renameat2, directory
  renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases
 /kernel/sound -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/syscall -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/lib -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/lib, directory renamed /usr/src/debug/ltp/20230127-r0/include/old -> /usr/src/debug/ltp/20230516-r0/include/old, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/
 kernel/syscalls/memfd_create -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sy
 scalls/pause, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setfsuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/
 setregid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sysca
 lls/setxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/kill -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/kill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel
 /syscalls/uname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20230127-r0/utils/sctp/lib -> /usr/src/debug/ltp/20230516-r0/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20
 230516-r0/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/c
 onformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/tim
 er_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/sched_stress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mmapstress, directory renamed /usr/
 src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp
 /20230127-r0/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/packet -> /usr/src/debug/ltp/20230516-r0/testcases/network/packet, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/move_mount, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/
 20230516-r0/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fdatasync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20230516-r0/testcases/
 open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_hotplug_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20230127-r0/tes
 tcases/kernel/syscalls/write -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigtimedwait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/prctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/c
 onformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fs_di, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20230516-r0/testcas
 es/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/sched_latency, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/tcp_cmds/sendfile -> /usr/src/debug/ltp/20230516-r0/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20
 230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/uevents -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculativ
 e, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/cve -> /usr/src/debug/ltp/20230516-r0/testcases/cve, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20230516-r0/t
 estcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_crea
 te -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/vmsplice, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug
 /ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchownat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/l
 tp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fanotify, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/libcontrollers, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix
 _testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/numa -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/
 interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/alarm, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/shmt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/202301
 27-r0/testcases/network/lib6 -> /usr/src/debug/ltp/20230516-r0/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigprocmask, direct
 ory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/munlock -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20230127-r0/pan -> /usr/src/debug/ltp/20230516-r0/pan, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/ltp-aiodio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsockop
 t, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20230516-r0/testca
 ses/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_
 attr_getschedpolicy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpau
 se, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/cap_bound -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsui
 te/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsmount -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/oom -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/oom, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/o
 pen_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigqueueinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20230516-r0/testcases/open_po
 six_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/fptests ->
  /usr/src/debug/ltp/20230516-r0/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/kvm -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/kvm, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20230516-r0/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/power -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/20230516-r0/testcas
 es/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/pidns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utimensat, direc
 tory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpending -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20230127
 -r0/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/zram, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setgroups -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setgroups, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ioctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer
 _settime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/statx -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mlockall -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/wai
 t, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execveat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/atof -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mincore -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp
 /20230127-r0/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/openat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/202305
 16-r0/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/trigo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sysc
 alls/mlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory
 _test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/personality, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getin
 heritsched -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/include -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/202
 30127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpuinput -> /usr/src/debug/ltp/20230516-r0/libs/libltpuinput, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unshare -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unshare, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/capset
  -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/tes
 tcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/ksm -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/sockets -> /usr/src/debug/ltp/20230516-r0/testcases/network/sockets, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelt
 ype, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_po
 six_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/include, directory renamed /usr/src/deb
 ug/ltp/20230127-r0/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/aio_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setitimer, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20230127-r0/test
 cases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_tid_address, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/block/block_dev_user -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/block/block_dev_user, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socket, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sy
 scalls/set_thread_area -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_thread_area, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugefork -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugefork, directory renamed /usr/src/debug/ltp/20230127-r0/utils/sctp/testlib -> /usr/src/debug/ltp/20230516-r0/utils/sctp/testlib, directory renamed
  /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/flock -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/flock, directory renamed /usr/sr
 c/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpu
 ctl_fj, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20230516-r0/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/
 syscalls/timerfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/sched_jitter, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/futex, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/waitid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscall
 s/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/tools, removed "/usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/setns_check.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount05.c /usr/src/debug/ltp/20230127-r0/include/lapi/bpf.h /usr/src/debug/ltp/20230127-r0/include/lapi/sem.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/ns_common.h /usr/src/debug/ltp/20230127-r0/include/lapi/readdir.h /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_getconf.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsconfig/fsconfig01.c /usr/src/debug/ltp/20230127-r0/include/lapi/init_module.h /usr/sr
 c/debug/ltp/20230127-r0/testcases/lib/tst_rod.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_rewrite_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd2/eventfd2_03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_core02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_core01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_accept_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20230127-r0/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_timeout_kill.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_net_ip_prefix.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_regression_fork_processes.c /usr/src/debug/ltp
 /20230127-r0/testcases/kernel/syscalls/ipc/semget/semget05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_notify/mq_notify01.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_get_median.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_sleep.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap04.c /usr/src/debug/ltp/20230127-r0/testcases/ke
 rnel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20230127-r0/include/lapi/watch_queue.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/ltp/20230127-r0/include/lapi/keyctl.h /usr/src/debug/ltp/20230127-r0/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20230127-r0/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20230127-r0/include/lapi/quotactl.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_regression_getdelays.c /usr/src/debug/ltp/20230127-r0/include/lapi/pidfd.h /usr/src/debug/ltp/20230127-r0/include/lapi/sched.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect/mprotect04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop/semop01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap18.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20230127-r0/te
 stcases/lib/tst_net_iface_prefix.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/ipc/semaphore/sem01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop/semop03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl24.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount01.c /usr/src/debug/ltp/20230127-r0/include/lapi/fs.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd2/eventfd2_02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_kvcmp.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_net_vars.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/
 syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_check_kconfigs.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsconfig/fsconfig02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/ns_exec.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect/mprotect01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20230127-r0/include/lapi/ustat.h /usr/src/debug/ltp/20230127-r0/include/lapi/fsmount.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_get_unused_port.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl_common.h /usr/src/debug/ltp/20230127-r0/include/lapi/openat2.h
  /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap23.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap24.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap25.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap26.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap27.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd2/eventfd2_01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap28.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/ipc/semaphore/sem02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/ns_ifmove.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c /usr/src/debug/ltp/20230127-r0/testcases
 /kernel/mem/hugetlb/hugemmap/hugemmap07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap17.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap18.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap20.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap21.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap22.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap08.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap09.c /usr/src/debug/ltp/20230127-r0/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20230127-r0/include/lapi/epoll.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect/mprotect03.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_check_drivers.c /usr/src/debug/ltp/20230127-r0/testcases/ker
 nel/syscalls/mmap/mmap001.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_file_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap19.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_hexdump.c /usr/src/debug/ltp/20230127-r0/include/lapi/kcmp.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_policy_io_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap14.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop/semop02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20230127-r0/include/lapi/membarrier.h /usr/src/debug/ltp/20230127-r0/testcases/kernel
 /syscalls/fcntl/fcntl06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise08.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap12.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount03_suid_child.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop/semop.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20230127-r0/include/lapi/common_timers.h /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_device.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_random.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20230127-
 r0/testcases/kernel/syscalls/mmap/mmap16.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_new_file_test.c /usr/src/debug/ltp/20230127-r0/include/lapi/ipcbuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/msgbuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/sembuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/shmbuf.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/newns.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl28.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20230127-r0/include/lapi/io_uring.h /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_get_free_pids.c /usr/src/debug/lt
 p/20230127-r0/testcases/lib/tst_cgctl.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect/mprotect02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_policy_memory_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/ns_create.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap15.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap17.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_supported_fs.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madv
 ise05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap13.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/utsname/utstest.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/include.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise01.c /usr/src/debug/ltp/20230127-r0/include/lapi/fanotify.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap11.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20230127-r0/include/lapi/futex.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mm
 ap03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_new_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap29.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap30.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap31.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap16.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap11.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap12.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap13.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap14.c /usr/src/debug/ltp/20230127-r0/test
 cases/kernel/mem/hugetlb/hugemmap/hugemmap15.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_checkpoint.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap08.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_notify/mq_notify02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl23.c", added "/usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount05.c /usr/src/debug/ltp/20230516-r0/include/lapi/fanotify.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname/utsname04.c /usr/src/debug/ltp/20230516-r0/include/lapi/quotactl.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_getconf.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_sleep.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname/utsname02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/sys
 calls/ipc/semget/semget05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap23.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap24.c /usr/src/debug/ltp/20230516-r0/include/lapi/fsmount.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap15.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semget/semget01.c /usr/src/debug/ltp/20230516-r0/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/2
 0230516-r0/testcases/kernel/syscalls/mmap/mmap01.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_ifmove.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_core01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_core02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_core03.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_cgctl.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap11.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_free_pids.c /usr/src/debug/ltp/20230516-r0/include/lapi/readdir.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise05.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_timeout_kill.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2/eventfd2.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap13.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise07.c /usr/src/debug/ltp/2023
 0516-r0/include/lapi/ustat.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20230516-r0/include/lapi/msgbuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/ipcbuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/sembuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/shmbuf.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap20.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_iface_prefix.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount02.c /usr/src/debug/ltp/20230516-r0/test
 cases/kernel/syscalls/mq_notify/mq_notify01.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_ip_prefix.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect04.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_median.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap001.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect03.c /usr/src/debug/ltp/20230516-r0/include/lapi/bpf.h /usr/src/debug/ltp/20230516-r0/include/lapi/sem.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise10.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname/utsname03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20230516-r0/include/lapi/io_uring.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mpr
 otect/mprotect01.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_kvcmp.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap02.c /usr/src/debug/ltp/20230516-r0/include/lapi/keyctl.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap18.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl_common.h /usr/src/debug/ltp/20230516-r0/include/lapi/init_module.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_create.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect05.c /usr/src/debug/ltp/20230516-r0/include/lapi/pidfd.h /usr/src/debug/ltp/20230516-r0/include/lapi/sched.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname/utsname01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_regression_getdelays.c /usr/src/debug/ltp/20230
 516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap13.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap14.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount01.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_check_drivers.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap18.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount07.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_supported_fs.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap16.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_rod.c /usr/src/debug/ltp/20230516-r0/include/lapi/watch_queue.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/de
 bug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsconfig/fsconfig01.c /usr/src/debug/ltp/20230516-r0/include/lapi/epoll.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsconfig/fsconfig03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl28.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_notify/mq_notify02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect02.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_hexdump.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_exec.c /usr/
 src/debug/ltp/20230516-r0/include/lapi/openat2.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2/eventfd2_03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise11.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap07.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap19.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount03_suid_child.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap09.c /usr/src/debug/ltp/20230516-r0/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_fsfreeze.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise03.c /usr/src/debug/ltp/20230516-r0/include/lapi/futex.h /usr/src/debug/ltp/202305
 16-r0/testcases/kernel/controllers/cgroup/cgroup_regression_fork_processes.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap17.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop01.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_check_kconfigs.c /usr/src/debug/ltp/20230516-r0/include/lapi/fs.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20230516-r0/include/lapi/common_timers.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_device.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_random.c /usr/src/debug/ltp/20230516-r0/include/lapi/membarrier.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsconfig/fsconfig02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise09.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/s
 yscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_notify/mq_notify03.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_checkpoint.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap25.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap26.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap27.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap07.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap08.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap09.c /usr/src/debug/ltp/20230516-r0/testcases/kerne
 l/mem/hugetlb/hugemmap/hugemmap01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c /usr/src/debug/ltp/20230516-r0/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2/eventfd2_02.c /usr/src/debug/ltp/20230516-r0/include/lapi/kcmp.h /usr/src/debug/ltp/20230516-r0/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_vars.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap14.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20230516-r0/include/lapi/close_range.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mm
 ap10.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap08.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_unused_port.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semget/semget02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap12.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap21.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap22.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2/eventfd2_01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap20.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl24.c 
 /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_common.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap28.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap29.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap30.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap31.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap16.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb
 /hugemmap/hugemmap17.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap10.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap11.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap12.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise08.c"
packages/core2-32-poky-linux/ltp/ltp-src: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-src: PKGSIZE changed from 13163667 to 12995589 (-1%)
packages/core2-32-poky-linux/ltp/ltp-src: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-staticdev: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-staticdev: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/tomoyo_file_test /opt/ltp/testcases/bin/fcntl06_64 /opt/ltp/testcases/bin/tomoyo_rewrite_test /opt/ltp/testcases/bin/tomoyo_new_test /opt/ltp/bin/execltp /opt/ltp/testcases/bin/sem02 /opt/ltp/testcases/bin/sem01 /opt/ltp/testcases/bin/newns /opt/ltp/testcases/bin/tomoyo_policy_memory_test /opt/ltp/testcases/bin/runutstests_noltp.sh /opt/ltp/testcases/bin/ns_create /opt/ltp/testcases/data/file01/in.csh /opt/ltp/testcases/bin/setns_check /opt/ltp/testcases/bin/fcntl06 /opt/ltp/testcases/bin/utstest /opt/ltp/testcases/bin/testall.sh /opt/ltp/testcases/bin/semget06 /opt/ltp/testcases/bin/semget03 /opt/ltp/testcases/bin/tomoyo_policy_io_test /opt/ltp/testcases/bin/ns_exec /opt/ltp/testcases/bin/tomoyo_new_file_test /opt/ltp/testcases/data/file01/in.ksh /opt/ltp/testcases/bin/tomoyo_accept_test /opt/ltp/testcases/bin/ns_ifmove /opt/ltp/testcases/bin/tomoyo_filesystem_test", added "/opt/ltp/testcases/bin/mprotec
 t05 /opt/ltp/testcases/bin/tst_ns_create /opt/ltp/testcases/bin/madvise11 /opt/ltp/testcases/bin/mount07 /opt/ltp/testcases/bin/mmap20 /opt/ltp/testcases/bin/hugemmap32 /opt/ltp/testcases/bin/tst_fsfreeze /opt/ltp/testcases/bin/semop05 /opt/ltp/testcases/bin/semop04 /opt/ltp/testcases/bin/cgroup_core03 /opt/ltp/testcases/bin/kvm_svm01 /opt/ltp/testcases/bin/nfs08.sh /opt/ltp/testcases/bin/fsconfig03 /opt/ltp/testcases/bin/tst_ns_ifmove /opt/ltp/testcases/bin/tst_ns_exec /opt/ltp/testcases/bin/mq_notify03 /opt/ltp/testcases/bin/utsname02 /opt/ltp/testcases/bin/utsname03 /opt/ltp/testcases/bin/utsname01 /opt/ltp/testcases/bin/utsname04"
packages/core2-32-poky-linux/ltp/ltp: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp: PKGSIZE changed from 440379562 to 444975436 (+1%)
packages/core2-32-poky-linux/ltp/ltp: PKGV changed from 20230127 [default] to 20230516 [default]

--===============0127835539414607567==--

