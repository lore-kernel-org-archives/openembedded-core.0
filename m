Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D800C54F65
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:55 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11830.1650052688502509474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CdFlDGVQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101802ecdec9f-9add97aa-608d-4628-8f48-ba3a6044078d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HPnuMuNrNqGDtprCOIRpy1BH9engD7h4ItM7vWSa1Sk=;
	b=CdFlDGVQwsznQ3InX542mhZPj78sOqlwhthCxxHE9Z7kHaU+qfTm1skuDsnDnQRt
	GxLroD8/EQbAVxb/H5xTDrOGP0fTkZITK+Fk6Y1skIElRESXT4U+Z5oQU+RgZLi6I/d
	IEI+E3iM5Y+k/iQHNK45lVeuWkWnXpxq7MLsKp2g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HPnuMuNrNqGDtprCOIRpy1BH9engD7h4ItM7vWSa1Sk=;
	b=C9YwvCKb6auV1P3oleZUnUF3whlLStALvgXvbdLczJSZIgHVFh5OoRXX5fKJK0ek
	Aqq4Ao3vt3OJEcC/dNo2Wi24iXOhlrkRD3OlFixbqZfchdFGV3x7cQ/O/D1esJTGnJF
	4bWVtgtDmmybcOmacqYfU1afoICwS431LOSH7wxk=
Content-Type: multipart/mixed; boundary="===============7441753225025309819=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.13.7 SUCCEEDED
Message-ID: 
 <010101802ecdec9f-9add97aa-608d-4628-8f48-ba3a6044078d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:09 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164519

--===============7441753225025309819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.13.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-tools-upgrade-2.13.4-2.13.7.patch
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
--===============7441753225025309819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115f16f47466b48e94d17e9abfad1e0a0b27fc8f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 14 Mirrors 0 Missed 81 Current 502 (14% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 531 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1003 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_fetch)
NOTE: Running task 1103 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_fetch)
NOTE: Running task 1186 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_fetch)
NOTE: Running task 1212 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_fetch)
NOTE: Running task 1224 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 1264 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 1307 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Started
NOTE: Running task 1523 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Started
NOTE: Running task 1573 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: Running task 1574 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_unpack)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1575 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: Running task 1576 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_unpack)
NOTE: Running task 1577 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: Running task 1578 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_unpack)
NOTE: Running task 1579 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1580 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.2053187
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 596 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: Running task 1581 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1582 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1638 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1650 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Started
NOTE: Running task 1666 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_fetch)
NOTE: Running task 1673 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 1688 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: Running task 1690 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Started
NOTE: Running task 1694 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1695 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_fetch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1744 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1777 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_fetch)
NOTE: Running task 1778 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1779 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_fetch)
NOTE: Running task 1780 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1781 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_fetch)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: Running task 1887 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1888 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1890 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 1894 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Started
NOTE: Running task 1896 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_unpack)
NOTE: Running task 1897 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: Running task 1898 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Started
NOTE: Running task 1899 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1900 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1901 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: Running task 1902 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_unpack)
NOTE: Running task 1903 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_patch)
NOTE: Running task 1905 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1906 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1907 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_unpack)
NOTE: Running task 1908 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1909 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1910 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_unpack)
NOTE: Running task 1911 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1912 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1913 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: Running task 1914 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1915 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1916 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: Running task 1927 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: Running task 1928 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Started
NOTE: Running task 1929 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 1930 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1931 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1932 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: Running task 1933 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1934 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 1935 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: Running task 1937 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: Running task 1938 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_patch)
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1939 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1940 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_patch)
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1941 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: Running task 1942 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_patch)
NOTE: Running task 1943 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: Running task 1944 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: Running task 1945 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_patch)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Started
NOTE: Running task 1946 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: Running task 1947 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1948 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_configure)
NOTE: Running task 1949 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1950 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1951 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Started
NOTE: Running task 1952 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1953 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 1954 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1955 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: Running task 1956 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1957 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1958 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1959 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1960 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Succeeded
NOTE: Running task 1961 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1962 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1963 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic)
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1965 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: Running task 1966 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Started
NOTE: Running task 1967 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1968 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_configure)
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Succeeded
NOTE: Running task 1969 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic unihash changed to 2d6d90ad4b407c55b06edd90d2c7cee84f1993412aaa27053b635ffe52ceceb9
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1970 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe iptables-1.8.7-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1971 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1972 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1973 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1974 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1975 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1976 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1977 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: Running task 1978 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1979 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: Running task 1980 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1981 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1982 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1983 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1984 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1985 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_configure)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1987 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1988 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1989 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1990 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1991 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1992 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1993 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: Running task 1994 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1995 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1996 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: Running task 1997 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1998 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1999 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_compile)
NOTE: recipe iptables-1.8.7-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_unpack: Succeeded
NOTE: Running task 2000 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2001 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_checkout: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2002 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_compile)
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_install)
NOTE: recipe iptables-1.8.7-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2006 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2007 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2008 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 2009 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: Running task 2010 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_validate_branches)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_validate_branches: Started
NOTE: Running task 2011 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_validate_branches: Succeeded
NOTE: Running task 2012 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 2013 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_metadata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2014 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2015 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_patch)
NOTE: Running task 2016 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_patch: Succeeded
NOTE: Running task 2017 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configme)
NOTE: Running task 2018 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2019 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_install)
NOTE: recipe liburcu-0.13.1-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 2022 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_populate_sysroot)
NOTE: Running task 2023 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_package)
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2024 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_configure)
NOTE: Running task 2026 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2027 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_compile)
NOTE: recipe liburcu-0.13.1-r0: task do_package: Succeeded
NOTE: Running task 2029 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2030 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2032 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_install: Started
NOTE: recipe socat-1.7.4.3-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_package: Started
NOTE: Running task 2035 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2036 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2037 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2038 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure)
NOTE: recipe elfutils-0.186-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 2039 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2040 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: Running task 2041 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2042 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_package: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: Running task 2043 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2045 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2046 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2048 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2049 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: Running task 2050 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2051 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_configure: Succeeded
NOTE: Running task 2052 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configcheck)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2054 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_configcheck: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.186-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2057 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2058 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_compile)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Succeeded
NOTE: Running task 2059 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 2060 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2061 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2062 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_install)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_package)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Succeeded
NOTE: Running task 2064 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_compile: Succeeded
NOTE: Running task 2065 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2066 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_populate_sysroot)
NOTE: Running task 2068 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2069 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2070 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2072 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_install: Succeeded
NOTE: Running task 2073 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2074 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_populate_sysroot)
NOTE: Running task 2075 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_package)
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_package: Started
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2076 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2077 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_configure)
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2078 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_compile)
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_compile: Succeeded
NOTE: Running task 2079 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_shared_workdir)
NOTE: Running task 2080 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_link_images)
NOTE: Running task 2081 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_transform_kernel)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2082 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile_kernelmodules)
NOTE: Running task 2083 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_compile_kernelmodules: Started
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2084 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_install)
NOTE: recipe iproute2-5.17.0-r0: task do_install: Started
NOTE: recipe iproute2-5.17.0-r0: task do_install: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Succeeded
NOTE: Running task 2085 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2086 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2087 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_strip)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_strip: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_strip: Succeeded
NOTE: Running task 2088 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_sizecheck)
NOTE: recipe elfutils-0.186-r0: task do_package: Succeeded
NOTE: Running task 2089 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_packagedata)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_sizecheck: Succeeded
NOTE: Running task 2090 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Succeeded
NOTE: Running task 2091 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_package)
NOTE: recipe iproute2-5.17.0-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_install: Succeeded
NOTE: Running task 2092 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_package)
NOTE: Running task 2093 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_bundle_initramfs)
NOTE: Running task 2094 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_configure)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Succeeded
NOTE: Running task 2097 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_compile)
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Started
NOTE: recipe iproute2-5.17.0-r0: task do_package: Succeeded
NOTE: Running task 2098 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_packagedata)
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Succeeded
NOTE: Running task 2099 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Succeeded
NOTE: Running task 2100 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Succeeded
NOTE: Running task 2101 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_packagedata)
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2102 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_package: Succeeded
NOTE: Running task 2103 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_packagedata)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_packagedata: Succeeded
NOTE: Running task 2104 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy)
NOTE: Running task 2105 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_deploy: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_7c084cf3a7-r0: task do_deploy: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Succeeded
NOTE: Running task 2106 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2107 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Succeeded
NOTE: Running task 2108 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2109 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package)
NOTE: Running task 2110 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Succeeded
NOTE: Running task 2111 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_packagedata)
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2112 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_write_rpm)
NOTE: Running task 2113 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_qa)
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2114 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2114 tasks of which 1868 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-src went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dbg went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-staticdev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-doc went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-locale went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7441753225025309819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115f16f47466b48e94d17e9abfad1e0a0b27fc8f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 14 Mirrors 0 Missed 81 Current 502 (14% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 531 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1003 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_fetch)
NOTE: Running task 1106 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_fetch)
NOTE: Running task 1188 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_fetch)
NOTE: Running task 1214 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_fetch)
NOTE: Running task 1226 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 1266 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 1283 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_fetch: Started
NOTE: Running task 1286 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.1778934
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 596 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1287 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_unpack)
NOTE: Running task 1288 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1289 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_unpack)
NOTE: Running task 1290 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: Running task 1291 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_unpack)
NOTE: Running task 1363 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Started
NOTE: Running task 1520 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: Running task 1533 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: Running task 1577 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_unpack: Started
NOTE: Running task 1647 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1662 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_fetch)
NOTE: Running task 1669 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: Running task 1688 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_fetch)
NOTE: Running task 1689 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1740 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1773 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1774 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_fetch)
NOTE: Running task 1775 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1776 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_fetch)
NOTE: Running task 1777 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_fetch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: Running task 1883 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1887 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_write_rpm)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1888 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1889 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1890 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Succeeded
NOTE: Running task 1891 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running task 1892 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1893 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1894 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1895 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_unpack)
NOTE: Running task 1896 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_unpack)
NOTE: Running task 1897 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 1898 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1899 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1901 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 1904 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: Running task 1905 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1906 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Started
NOTE: Running task 1909 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: Running task 1912 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1913 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_unpack)
NOTE: Running task 1914 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1915 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_unpack)
NOTE: Running task 1916 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_unpack)
NOTE: Running task 1918 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: Running task 1919 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 1920 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1922 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 1925 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: Running task 1926 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 1927 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Succeeded
NOTE: Running task 1928 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: Running task 1929 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1930 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1931 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 1932 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1933 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 1934 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1935 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_patch)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1936 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: Running task 1937 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_patch)
NOTE: Running task 1938 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_patch)
NOTE: Running task 1939 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: Running task 1940 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1941 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_patch)
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1943 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1944 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 1945 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 1946 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1947 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1948 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1949 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1950 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic)
NOTE: Running task 1951 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1952 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1953 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1954 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1955 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe iptables-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1956 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1957 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: Running task 1958 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1960 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic unihash changed to 2d6d90ad4b407c55b06edd90d2c7cee84f1993412aaa27053b635ffe52ceceb9
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1961 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 1962 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: Running task 1963 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_configure)
NOTE: Running task 1964 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: Running task 1965 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1966 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: Running task 1967 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: Running task 1968 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1969 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1970 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: Running task 1971 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: Running task 1972 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: Running task 1973 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1974 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1975 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1976 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1977 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1978 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: Running task 1979 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1980 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1981 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1982 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1983 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: Running task 1984 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1985 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_configure)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1987 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: Running task 1988 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1989 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: Running task 1990 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1991 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: Running task 1992 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1993 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: Running task 1994 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1995 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1996 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: Running task 1997 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1998 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_unpack: Succeeded
NOTE: Running task 1999 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_symlink_kernsrc)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2000 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_checkout: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2001 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_compile)
NOTE: recipe iptables-1.8.7-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2002 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 2005 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_validate_branches)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_validate_branches: Started
NOTE: recipe iptables-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2006 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_install)
NOTE: recipe iptables-1.8.7-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_validate_branches: Succeeded
NOTE: Running task 2007 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_metadata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 2008 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2009 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe iptables-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2010 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2011 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2012 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 2013 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2014 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2015 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_patch)
NOTE: Running task 2016 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_patch: Succeeded
NOTE: Running task 2017 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configme)
NOTE: Running task 2018 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2019 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_install)
NOTE: recipe liburcu-0.13.1-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 2022 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_populate_sysroot)
NOTE: Running task 2023 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_package)
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2024 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Started
NOTE: recipe liburcu-0.13.1-r0: task do_package: Succeeded
NOTE: Running task 2026 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2029 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2030 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_compile)
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2032 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: Running task 2033 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2034 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2035 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_install: Succeeded
NOTE: Running task 2036 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_package: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2037 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2038 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2039 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2040 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2041 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2042 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure)
NOTE: recipe elfutils-0.186-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 2043 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe socat-1.7.4.3-r0: task do_package: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_packagedata)
NOTE: Running task 2045 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_configme: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: Running task 2046 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_configure)
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2047 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2049 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: Running task 2050 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2051 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2052 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_configure: Succeeded
NOTE: Running task 2053 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configcheck)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_configcheck: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_compile)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_configure: Succeeded
NOTE: Running task 2057 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2058 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 2059 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Succeeded
NOTE: Running task 2060 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2061 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2062 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_install)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_package)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Succeeded
NOTE: Running task 2064 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2065 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Succeeded
NOTE: Running task 2066 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_populate_sysroot)
NOTE: Running task 2067 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2068 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_compile: Succeeded
NOTE: Running task 2069 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2070 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2072 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_install: Succeeded
NOTE: Running task 2073 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2074 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_populate_sysroot)
NOTE: Running task 2075 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_package)
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_package: Started
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2076 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2077 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_configure)
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2078 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_compile)
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_compile: Succeeded
NOTE: Running task 2079 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_shared_workdir)
NOTE: Running task 2080 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_link_images)
NOTE: Running task 2081 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_transform_kernel)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2082 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile_kernelmodules)
NOTE: Running task 2083 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_compile_kernelmodules: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2085 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Started
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2086 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_install)
NOTE: recipe iproute2-5.17.0-r0: task do_install: Started
NOTE: recipe iproute2-5.17.0-r0: task do_install: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_package: Succeeded
NOTE: Running task 2087 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_packagedata)
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Succeeded
NOTE: Running task 2088 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_package)
NOTE: recipe iproute2-5.17.0-r0: task do_package: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2089 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_strip)
NOTE: Running task 2090 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2091 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_strip: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_strip: Succeeded
NOTE: Running task 2092 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_sizecheck)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_sizecheck: Succeeded
NOTE: Running task 2093 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Succeeded
NOTE: Running task 2094 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_compile)
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_install: Succeeded
NOTE: Running task 2095 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_package)
NOTE: Running task 2096 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_bundle_initramfs)
NOTE: Running task 2097 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_package: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2098 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_packagedata)
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Succeeded
NOTE: Running task 2099 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Succeeded
NOTE: Running task 2100 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Succeeded
NOTE: Running task 2101 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_packagedata)
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2102 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_package: Succeeded
NOTE: Running task 2103 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_packagedata)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_packagedata: Succeeded
NOTE: Running task 2104 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy)
NOTE: Running task 2105 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_deploy: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_b6fd1a7dd8-r0: task do_deploy: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Succeeded
NOTE: Running task 2106 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2107 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Succeeded
NOTE: Running task 2108 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2109 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package)
NOTE: Running task 2110 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Succeeded
NOTE: Running task 2111 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_packagedata)
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2112 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_write_rpm)
NOTE: Running task 2113 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_qa)
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2114 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2114 tasks of which 1866 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-src went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dbg went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-staticdev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-doc went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-locale went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7441753225025309819==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-lttng-tools-upgrade-2.13.4-2.13.7.patch"

From 1b3c8cf8b9346e434ff53b7f7fe7d5a54e8aa424 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 18:07:52 +0000
Subject: [PATCH] lttng-tools: upgrade 2.13.4 -> 2.13.7

---
 .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.7.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb
index 0ea4da05ce..0fa85679f4 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
+SRC_URI[sha256sum] = "d17a02e8f178a7cf3403e3c9edfb90ad3a1628e20aa0b5131408ae47f722f08d"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.27.0


--===============7441753225025309819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST: added "/usr/lib/lttng-tools/ptest/tests/regression/ust/java-log4j2/test_agent_log4j2_domain_log4j /usr/lib/lttng-tools/ptest/tests/regression/kernel/test_syscall /usr/lib/lttng-tools/ptest/tests/regression/kernel/test_select_poll_epoll /usr/lib/lttng-tools/ptest/tests/regression/ust/java-log4j2/Makefile /usr/lib/lttng-tools/ptest/tests/regression/kernel/validate_select_poll_epoll.py /usr/lib/lttng-tools/ptest/tests/regression/kernel/test_userspace_probe /usr/lib/lttng-tools/ptest/tests/regression/kernel/test_rotation_destroy_flush"

--===============7441753225025309819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 49 recipes from the core2-32 sysroot...done.
Removing 96 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115f16f47466b48e94d17e9abfad1e0a0b27fc8f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 370 Local 285 Mirrors 0 Missed 85 Current 174 (77% match, 84% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 175 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 176 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 203 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 647 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_fetch)
NOTE: Running task 691 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 695 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 719 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 729 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 735 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_fetch)
NOTE: Running task 736 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_fetch)
NOTE: Running task 743 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 754 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_fetch)
NOTE: Running task 755 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 759 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 764 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_fetch)
NOTE: Running task 765 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_fetch)
NOTE: Running task 766 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 767 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 768 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_fetch)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 816 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-utils-20170421-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 817 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 818 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 819 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 820 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 821 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running setscene task 284 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running setscene task 285 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 822 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 823 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 824 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_unpack)
NOTE: recipe grep-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 825 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_unpack)
NOTE: Running task 826 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata_setscene)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: Running task 827 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 828 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 829 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 830 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.2607473
NOTE: recipe eudev-3.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 831 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: recipe libgcrypt-1.9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: Running setscene task 294 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 295 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: recipe gnutls-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Started
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 304 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: recipe grep-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 305 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: Running setscene task 313 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 841 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: Running task 842 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_fetch)
NOTE: Running task 843 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_fetch)
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 844 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe grep-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 374 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 857 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: Running task 859 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 881 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Started
NOTE: Running task 895 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Started
NOTE: Running task 909 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: Running task 911 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 913 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_unpack)
NOTE: Running task 914 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_patch)
NOTE: Running task 916 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 920 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 921 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_patch)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_unpack: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Started
NOTE: Running task 922 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 923 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_unpack)
NOTE: Running task 936 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 939 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_unpack)
NOTE: Running task 941 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_patch)
NOTE: Running task 942 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_setscene)
NOTE: Running task 943 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_unpack)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 944 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_unpack)
NOTE: Running task 945 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 946 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 387 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe musl-utils-20170421-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: Running setscene task 399 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 954 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe libgpg-error-1.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Started
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 999 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1000 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1001 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 416 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: Running task 1007 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 422 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1012 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe musl-utils-20170421-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1013 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1014 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1015 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1016 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1017 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1018 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1019 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Succeeded
NOTE: Running task 1024 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1025 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1028 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: Running task 1033 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_patch)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_patch: Succeeded
NOTE: Running task 1034 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1035 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1036 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1046 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 433 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1047 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_patch)
NOTE: Running setscene task 440 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1052 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1053 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-utils-20170421-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1055 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_patch)
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 451 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1056 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1057 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1058 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_setscene: Succeeded
NOTE: Running task 1091 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 465 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_setscene)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1092 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1101 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1102 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic)
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_package_setscene: Started
NOTE: Running task 1103 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic unihash changed to 2d6d90ad4b407c55b06edd90d2c7cee84f1993412aaa27053b635ffe52ceceb9
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1104 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 469 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_package_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_package_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-11.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 521 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1390 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1505 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1624 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1654 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1676 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1679 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1680 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1688 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1689 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1721 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1722 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1735 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1752 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_package_write_rpm)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1753 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-utils-20170421-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1754 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 1755 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 1756 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Started
NOTE: Running task 1757 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1758 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe musl-utils-20170421-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1760 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1761 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1763 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: Running task 1764 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_configure: Started
NOTE: Running task 1765 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1766 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1767 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: Running task 1768 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1769 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1771 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1772 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_configure)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Started
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1773 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe musl-utils-20170421-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_compile)
NOTE: recipe musl-utils-20170421-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_unpack: Succeeded
NOTE: Running task 1775 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_symlink_kernsrc)
NOTE: recipe musl-utils-20170421-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_install)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1777 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_checkout)
NOTE: recipe musl-utils-20170421-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_checkout: Started
NOTE: recipe musl-utils-20170421-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_package)
NOTE: recipe musl-utils-20170421-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1779 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1780 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1781 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1782 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1783 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe musl-utils-20170421-r0: task do_package: Succeeded
NOTE: Running task 1784 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_packagedata)
NOTE: recipe musl-utils-20170421-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1785 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe musl-utils-20170421-r0: task do_packagedata: Succeeded
NOTE: Running task 1786 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_package_write_rpm: Started
NOTE: Running task 1787 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1788 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe musl-utils-20170421-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1789 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1790 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1791 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1792 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 1793 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_validate_branches)
NOTE: recipe iptables-1.8.7-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_validate_branches: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1794 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_validate_branches: Succeeded
NOTE: Running task 1795 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1796 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_metadata: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1797 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: Running task 1799 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1800 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: Running task 1801 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: Running task 1802 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1803 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1804 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 1805 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_metadata: Succeeded
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1806 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_patch)
NOTE: Running task 1807 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_version_sanity_check)
NOTE: Running task 1808 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 1809 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 1810 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1811 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe iptables-1.8.7-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_patch: Succeeded
NOTE: Running task 1812 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configme)
NOTE: Running task 1813 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configme: Started
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1814 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1815 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: Running task 1817 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 1818 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: Running task 1819 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: Running task 1820 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1821 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1822 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: Running task 1824 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: Running task 1825 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Succeeded
NOTE: Running task 1826 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_install)
NOTE: recipe liburcu-0.13.1-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 1827 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 1828 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_populate_sysroot)
NOTE: Running task 1829 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_package)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Succeeded
NOTE: Running task 1830 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_compile)
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_package: Started
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1831 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1832 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_configure)
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Succeeded
NOTE: Running task 1833 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.3-r0: task do_install: Started
NOTE: recipe socat-1.7.4.3-r0: task do_install: Succeeded
NOTE: Running task 1834 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_package)
NOTE: recipe socat-1.7.4.3-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 1835 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 1836 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_package: Succeeded
NOTE: Running task 1837 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 1838 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1839 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 1841 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 1842 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1844 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1845 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: Running task 1846 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1847 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1848 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_configure)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configme: Succeeded
NOTE: Running task 1849 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configcheck)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configcheck: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_compile)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 1853 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 1854 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 1855 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 1856 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Succeeded
NOTE: Running task 1857 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1858 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1859 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure)
NOTE: Running task 1860 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1861 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Succeeded
NOTE: Running task 1862 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_install)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 1863 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 1864 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Succeeded
NOTE: Running task 1865 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Started
NOTE: Running task 1866 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Succeeded
NOTE: Running task 1867 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 1868 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 1869 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1870 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.186-r0: task do_configure: Succeeded
NOTE: Running task 1871 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Succeeded
NOTE: Running task 1873 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_populate_sysroot)
NOTE: Running task 1874 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1875 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1876 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Succeeded
NOTE: Running task 1877 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_install: Succeeded
NOTE: Running task 1879 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_populate_sysroot)
NOTE: Running task 1880 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_package)
NOTE: recipe elfutils-0.186-r0: task do_package: Started
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1881 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1882 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_configure)
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1883 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_compile)
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_package: Succeeded
NOTE: Running task 1884 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_packagedata)
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_compile: Succeeded
NOTE: Running task 1885 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_shared_workdir)
NOTE: Running task 1886 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_link_images)
NOTE: Running task 1887 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_transform_kernel)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_shared_workdir: Succeeded
NOTE: Running task 1888 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile_kernelmodules)
NOTE: Running task 1889 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_compile_kernelmodules: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Succeeded
NOTE: Running task 1890 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1891 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Started
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1892 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_install)
NOTE: recipe iproute2-5.17.0-r0: task do_install: Started
NOTE: recipe iproute2-5.17.0-r0: task do_install: Succeeded
NOTE: Running task 1893 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_package)
NOTE: recipe iproute2-5.17.0-r0: task do_package: Started
NOTE: recipe iproute2-5.17.0-r0: task do_package: Succeeded
NOTE: Running task 1894 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_packagedata)
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 1895 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_strip)
NOTE: Running task 1896 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_strip: Started
NOTE: Running task 1897 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_strip: Succeeded
NOTE: Running task 1898 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_sizecheck)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_sizecheck: Succeeded
NOTE: Running task 1899 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_compile)
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_package)
NOTE: Running task 1902 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_bundle_initramfs)
NOTE: Running task 1903 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Succeeded
NOTE: Running task 1904 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Succeeded
NOTE: Running task 1905 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Succeeded
NOTE: Running task 1906 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_packagedata)
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1907 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Succeeded
NOTE: Running task 1908 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1909 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Succeeded
NOTE: Running task 1910 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1911 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package)
NOTE: Running task 1912 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_package: Succeeded
NOTE: Running task 1913 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_packagedata)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Succeeded
NOTE: Running task 1914 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_packagedata)
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1915 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_write_rpm)
NOTE: Running task 1916 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_qa)
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_packagedata: Succeeded
NOTE: Running task 1917 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy)
NOTE: Running task 1918 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1919 of 1919 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_build)
NOTE: Tasks Summary: Attempted 1919 tasks of which 1643 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-src went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dbg went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-staticdev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-doc went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-locale went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7441753225025309819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115f16f47466b48e94d17e9abfad1e0a0b27fc8f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 14 Mirrors 0 Missed 81 Current 502 (14% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 531 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1003 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_fetch)
NOTE: Running task 1103 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: Running task 1105 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_fetch)
NOTE: Running task 1185 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_fetch)
NOTE: Running task 1211 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_fetch)
NOTE: Running task 1223 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 1263 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Started
NOTE: Running task 1480 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_unpack)
NOTE: Running task 1481 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_fetch: Started
NOTE: Running task 1522 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1534 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: Running task 1565 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: Running task 1590 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: Running task 1591 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_unpack)
NOTE: Running task 1601 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: Running task 1640 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1655 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_fetch)
NOTE: Running task 1662 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 1681 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_fetch)
NOTE: Running task 1682 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Started
NOTE: Running task 1715 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1716 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1717 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_unpack)
NOTE: Running task 1718 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.1451821
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 596 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: Running task 1720 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Started
NOTE: Running task 1721 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1722 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1739 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Succeeded
NOTE: Running task 1773 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_fetch)
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: Running task 1774 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_fetch)
NOTE: Running task 1775 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1776 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_fetch)
NOTE: Running task 1777 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1779 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1780 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 1781 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_unpack)
NOTE: Running task 1788 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_unpack: Started
NOTE: Running task 1789 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1790 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_patch)
NOTE: Running task 1791 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1792 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: Running task 1806 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1807 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1808 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1826 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1843 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Started
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 1844 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_unpack)
NOTE: Running task 1845 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_unpack)
NOTE: Running task 1846 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1847 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1864 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1865 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_patch)
NOTE: Running task 1866 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_unpack)
NOTE: Running task 1867 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: Running task 1904 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_package_write_rpm)
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: Running task 1905 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Started
NOTE: Running task 1906 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_patch)
NOTE: Running task 1907 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: Running task 1908 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 1912 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 1914 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1915 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1916 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1917 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: Running task 1918 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1919 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 1920 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Succeeded
NOTE: Running task 1921 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1922 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1923 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1924 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1925 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: Running task 1927 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_patch)
NOTE: Running task 1928 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Started
NOTE: Running task 1929 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1930 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1931 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1932 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1943 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1944 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1945 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1946 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1947 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1948 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 1949 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1950 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1951 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1952 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1953 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1954 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1955 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: Running task 1956 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1957 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1958 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 1959 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic unihash changed to 2d6d90ad4b407c55b06edd90d2c7cee84f1993412aaa27053b635ffe52ceceb9
NOTE: Running task 1960 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: Running task 1961 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: Running task 1962 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1963 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1964 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1965 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: Running task 1966 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: Running task 1967 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: Running task 1968 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: Running task 1969 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 1970 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1971 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1972 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1973 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1974 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: Running task 1975 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1976 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1977 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1978 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: Running task 1979 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1980 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1981 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: Running task 1982 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1983 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1984 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1985 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_configure)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1986 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1987 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1988 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1990 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1991 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1992 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1993 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1994 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1995 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1996 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1997 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1998 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_unpack: Succeeded
NOTE: Running task 1999 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2000 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_checkout: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2001 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_compile)
NOTE: recipe iptables-1.8.7-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2002 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2003 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2004 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_compile)
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Started
NOTE: recipe iptables-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_install)
NOTE: recipe iptables-1.8.7-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 2006 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_validate_branches)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_validate_branches: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_validate_branches: Succeeded
NOTE: Running task 2007 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)
NOTE: recipe iptables-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2008 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2009 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_metadata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: Running task 2010 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2011 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2012 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2013 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2014 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2015 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_patch)
NOTE: Running task 2016 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_version_sanity_check)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_patch: Succeeded
NOTE: Running task 2017 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configme)
NOTE: Running task 2018 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2019 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_install: Started
NOTE: Running task 2021 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 2022 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_populate_sysroot)
NOTE: Running task 2023 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_package)
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2024 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2027 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe liburcu-0.13.1-r0: task do_package: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_compile)
NOTE: Running task 2029 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2030 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: Running task 2031 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2032 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: Running task 2033 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_install: Started
NOTE: recipe socat-1.7.4.3-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2035 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2036 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2037 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2038 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe socat-1.7.4.3-r0: task do_package: Succeeded
NOTE: Running task 2039 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2041 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2042 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2043 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2044 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2045 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2046 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: Running task 2047 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2048 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2049 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2050 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2051 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_configure)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2052 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2054 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2055 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_compile)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_configure: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2056 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configcheck)
NOTE: recipe elfutils-0.186-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configcheck: Started
NOTE: Running task 2057 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2058 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 2059 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2060 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_install)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Succeeded
NOTE: Running task 2061 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Succeeded
NOTE: Running task 2062 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_package)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2064 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_compile: Succeeded
NOTE: Running task 2065 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2066 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_populate_sysroot)
NOTE: Running task 2068 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2069 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2070 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2072 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_install: Succeeded
NOTE: Running task 2073 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2074 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_populate_sysroot)
NOTE: Running task 2075 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_package)
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_package: Started
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2076 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2077 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_configure)
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2078 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_compile)
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_compile: Succeeded
NOTE: Running task 2079 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_shared_workdir)
NOTE: Running task 2080 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_link_images)
NOTE: Running task 2081 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_transform_kernel)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2082 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile_kernelmodules)
NOTE: Running task 2083 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_transform_kernel: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_compile_kernelmodules: Started
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2084 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_install)
NOTE: recipe iproute2-5.17.0-r0: task do_install: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Succeeded
NOTE: Running task 2085 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2086 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile)
NOTE: recipe iproute2-5.17.0-r0: task do_install: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_package: Succeeded
NOTE: Running task 2087 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_packagedata)
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Succeeded
NOTE: Running task 2088 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_package)
NOTE: recipe iproute2-5.17.0-r0: task do_package: Started
NOTE: recipe iproute2-5.17.0-r0: task do_package: Succeeded
NOTE: Running task 2089 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_packagedata)
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2090 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_strip)
NOTE: Running task 2091 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_strip: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_strip: Succeeded
NOTE: Running task 2092 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_configure)
NOTE: Running task 2093 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_sizecheck)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_sizecheck: Succeeded
NOTE: Running task 2094 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_compile)
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_install: Succeeded
NOTE: Running task 2096 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_package)
NOTE: Running task 2097 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_bundle_initramfs)
NOTE: Running task 2098 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Succeeded
NOTE: Running task 2099 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Succeeded
NOTE: Running task 2100 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Succeeded
NOTE: Running task 2101 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_packagedata)
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2102 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Succeeded
NOTE: Running task 2103 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2104 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Succeeded
NOTE: Running task 2105 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2106 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package)
NOTE: Running task 2107 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_package: Succeeded
NOTE: Running task 2108 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_packagedata)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Succeeded
NOTE: Running task 2109 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_packagedata)
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_packagedata: Succeeded
NOTE: Running task 2110 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy)
NOTE: Running task 2111 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2112 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_write_rpm)
NOTE: Running task 2113 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_qa)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2114 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2114 tasks of which 1862 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-src went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dbg went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-staticdev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-doc went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-locale went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7441753225025309819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115f16f47466b48e94d17e9abfad1e0a0b27fc8f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 14 Mirrors 0 Missed 81 Current 502 (14% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 531 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1003 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_fetch)
NOTE: Running task 1106 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_fetch)
NOTE: Running task 1168 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: Running task 1187 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_fetch)
NOTE: Running task 1213 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_fetch)
NOTE: Running task 1225 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 1265 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe liburcu-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: Running task 1475 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_unpack)
NOTE: Running task 1476 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Started
NOTE: Running task 1519 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_unpack)
NOTE: Running task 1525 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_fetch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: Running task 1567 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1568 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_unpack)
NOTE: Running task 1593 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: Running task 1609 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Started
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.2331081
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 596 of 597 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1610 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_unpack)
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Started
NOTE: recipe liburcu-0.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1611 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_patch)
NOTE: recipe liburcu-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1612 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_unpack: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_unpack: Succeeded
NOTE: Running task 1613 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_patch)
NOTE: Running task 1614 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: Running task 1615 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_patch)
NOTE: Running task 1616 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1617 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1638 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1651 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1666 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_fetch)
NOTE: Running task 1673 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 1689 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1693 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_fetch)
NOTE: Running task 1694 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Started
NOTE: Running task 1744 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Started
NOTE: Running task 1778 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1779 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1780 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_fetch)
NOTE: Running task 1781 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_fetch)
NOTE: Running task 1782 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_fetch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_patch: Succeeded
NOTE: Running task 1882 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_package_write_rpm)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 1883 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1884 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.13.3-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1885 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1895 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1896 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_unpack)
NOTE: Running task 1897 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1898 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 1899 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1900 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 1901 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Started
NOTE: Running task 1902 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: Running task 1903 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1904 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: Running task 1905 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1907 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1908 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_unpack)
NOTE: Running task 1909 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1910 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1911 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1912 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_unpack)
NOTE: Running task 1913 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_unpack)
NOTE: Running task 1914 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1916 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 1926 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: Running task 1927 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_patch: Succeeded
NOTE: Running task 1928 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running task 1929 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Started
NOTE: Running task 1930 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic)
NOTE: Running task 1931 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1932 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1933 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe liburcu-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1934 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: Running task 1935 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1936 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1937 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1938 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_patch)
NOTE: Running task 1939 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: Running task 1940 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1941 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1942 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: Running task 1943 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1944 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_patch)
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_lic: Succeeded
NOTE: Running task 1945 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_lic unihash changed to 2d6d90ad4b407c55b06edd90d2c7cee84f1993412aaa27053b635ffe52ceceb9
NOTE: recipe lttng-tools-2.13.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1946 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1947 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1948 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1949 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.7-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1951 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1952 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1953 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1954 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1955 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1956 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1957 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 1958 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1959 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: Running task 1960 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1961 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1962 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_configure)
NOTE: Running task 1963 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: Running task 1964 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1965 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: Running task 1966 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1967 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1968 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: Running task 1969 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1970 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1971 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1972 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-11.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1973 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1974 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: Running task 1975 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1976 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1977 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1978 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1979 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: Running task 1980 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1981 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1982 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1983 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1984 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1985 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1987 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1988 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1989 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1990 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1991 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1992 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1993 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1994 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1996 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1998 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1999 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_compile)
NOTE: recipe iptables-1.8.7-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2000 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_unpack: Succeeded
NOTE: Running task 2001 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2002 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_checkout)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_checkout: Started
NOTE: recipe liburcu-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_compile)
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_install)
NOTE: recipe iptables-1.8.7-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 2006 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2007 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe iptables-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2008 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2009 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2010 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 2011 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_validate_branches)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_validate_branches: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_validate_branches: Succeeded
NOTE: Running task 2012 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2013 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_metadata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2014 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2015 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2016 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_patch)
NOTE: Running task 2017 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_version_sanity_check)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configme)
NOTE: Running task 2019 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_install)
NOTE: recipe liburcu-0.13.1-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe liburcu-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 2022 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_populate_sysroot)
NOTE: Running task 2023 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_package: Started
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2024 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2025 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe liburcu-0.13.1-r0: task do_package: Succeeded
NOTE: Running task 2027 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.13.1.bb:do_packagedata)
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2029 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2030 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Started
NOTE: recipe socat-1.7.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2033 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2034 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe socat-1.7.4.3-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe socat-1.7.4.3-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_package)
NOTE: recipe socat-1.7.4.3-r0: task do_package: Started
NOTE: recipe iptables-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2036 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2037 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2038 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2039 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2040 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure)
NOTE: recipe elfutils-0.186-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.3-r0: task do_package: Succeeded
NOTE: Running task 2041 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_packagedata)
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2042 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2043 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2044 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2045 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2046 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package)
NOTE: Running task 2047 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2048 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2049 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2050 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2051 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2052 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_configure)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_configure: Succeeded
NOTE: Running task 2053 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_configcheck: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_configure: Succeeded
NOTE: Running task 2057 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_configure_ptest_base)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2058 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package: Succeeded
NOTE: Running task 2059 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_configure: Succeeded
NOTE: Running task 2060 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2061 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_install)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_install: Succeeded
NOTE: Running task 2062 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_package)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2063 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_package: Succeeded
NOTE: Running task 2064 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2065 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_install: Succeeded
NOTE: Running task 2066 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_populate_sysroot)
NOTE: Running task 2067 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Started
NOTE: recipe elfutils-0.186-r0: task do_compile: Succeeded
NOTE: Running task 2068 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2069 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2070 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2072 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_install: Succeeded
NOTE: Running task 2073 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.186-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2074 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_populate_sysroot)
NOTE: Running task 2075 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_package)
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_package: Started
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2076 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2077 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_configure)
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2078 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_compile)
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure: Succeeded
NOTE: Running task 2079 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2080 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Started
NOTE: recipe iproute2-5.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2081 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_install)
NOTE: recipe iproute2-5.17.0-r0: task do_install: Started
NOTE: recipe iproute2-5.17.0-r0: task do_install: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_package: Succeeded
NOTE: Running task 2082 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_packagedata)
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.186-r0: task do_packagedata: Succeeded
NOTE: Running task 2083 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_package)
NOTE: recipe iproute2-5.17.0-r0: task do_package: Started
NOTE: recipe iproute2-5.17.0-r0: task do_package: Succeeded
NOTE: Running task 2084 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_packagedata)
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.17.0-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_shared_workdir)
NOTE: Running task 2086 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_link_images)
NOTE: Running task 2087 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_transform_kernel)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2088 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_compile_kernelmodules)
NOTE: Running task 2089 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_compile_kernelmodules: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2090 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_strip)
NOTE: Running task 2091 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_strip: Started
NOTE: Running task 2092 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_strip: Succeeded
NOTE: Running task 2093 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_sizecheck)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_sizecheck: Succeeded
NOTE: Running task 2094 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_compile)
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_install: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_install: Succeeded
NOTE: Running task 2096 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_package)
NOTE: Running task 2097 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_bundle_initramfs)
NOTE: Running task 2098 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_package: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile: Succeeded
NOTE: Running task 2099 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2100 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_install: Succeeded
NOTE: Running task 2101 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_compile: Succeeded
NOTE: Running task 2102 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_install)
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_install: Succeeded
NOTE: Running task 2103 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package)
NOTE: recipe lttng-tools-2.13.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2104 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package)
NOTE: Running task 2105 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_populate_sysroot)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.3-r0: task do_package: Succeeded
NOTE: Running task 2106 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_packagedata)
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2107 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package: Succeeded
NOTE: Running task 2108 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_packagedata)
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2109 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_write_rpm)
NOTE: Running task 2110 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_package_qa)
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_package: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_qa: Succeeded
NOTE: Running task 2111 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_packagedata)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_packagedata: Succeeded
NOTE: Running task 2112 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy)
NOTE: Running task 2113 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_deploy: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.13.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_239f7c8f37-r0: task do_deploy: Succeeded
NOTE: recipe lttng-tools-2.13.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2114 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2114 tasks of which 1864 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-src went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dbg went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-staticdev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-dev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-doc went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl-locale went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: QA Issue: Package version for package libmnl went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7441753225025309819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-tools: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools: SRC_URI changed from "https://lttng.org/files/lttng-tools/lttng-tools-2.13.4.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://determinism.patch file://disable-tests.patch" to "https://lttng.org/files/lttng-tools/lttng-tools-2.13.7.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://determinism.patch file://disable-tests.patch"
packages/core2-32-poky-linux/lttng-tools: PV changed from "2.13.4" to "2.13.7"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGSIZE changed from 46240960 to 46644924 (+1%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PV changed from "2.13.4" to "2.13.7"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PKGSIZE changed from 240999 to 240994 (-0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PV changed from "2.13.4" to "2.13.7"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGSIZE changed from 293053 to 297234 (+1%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PV changed from "2.13.4" to "2.13.7"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PV changed from "2.13.4" to "2.13.7"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGSIZE changed from 16038911 to 16311224 (+2%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PV changed from "2.13.4" to "2.13.7"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST: added "/usr/lib/lttng-tools/ptest/tests/regression/kernel/test_rotation_destroy_flush /usr/lib/lttng-tools/ptest/tests/regression/ust/java-log4j2/test_agent_log4j2_domain_log4j /usr/lib/lttng-tools/ptest/tests/regression/kernel/test_syscall /usr/lib/lttng-tools/ptest/tests/regression/kernel/test_userspace_probe /usr/lib/lttng-tools/ptest/tests/regression/kernel/validate_select_poll_epoll.py /usr/lib/lttng-tools/ptest/tests/regression/ust/java-log4j2/Makefile /usr/lib/lttng-tools/ptest/tests/regression/kernel/test_select_poll_epoll"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGSIZE changed from 5848449 to 5920515 (+1%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PV changed from "2.13.4" to "2.13.7"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: FILELIST: directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/tools/filtering -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/tools/filtering, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/bin/lttng -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/bin/lttng, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/xml-utils -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/xml-utils, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/tools/live -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/tools/live, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/tools/rotation -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/tools/rotation, di
 rectory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/low-throughput -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/high-throughput, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-syscall-events-callstack -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-syscall-events-callstack, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/event-expr -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/event-expr, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/kernel-consumer -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/kernel-consumer, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/include/lttng/notification -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/include/lttng/notification, direct
 ory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/include/lttng/action -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/include/lttng/action, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/vendor/msgpack -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/vendor/msgpack, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/tools/notification -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/tools/notification, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/ust-dl -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/ust-dl, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/include/ltt
 ng/trigger -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/include/lttng/trigger, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/lib/lttng-ctl -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/lib/lttng-ctl, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/linking -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/overlap/demo, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/include/lttng/condition -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/include/lttng/condition, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/bin/lttng/commands -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/bin/lttng/commands, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/fork -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression
 /ust/fork, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/argpar -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/argpar, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/fd-tracker -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/fd-tracker, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/tools/trigger/hidden -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/tools/trigger/hidden, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/argpar-utils -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/argpar-utils, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/tools/health -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/tools/health, directory renamed /usr/src/debug/lttng-tools/2.13.4-
 r0/lttng-tools-2.13.4/tests/regression/kernel -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/kernel, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/config -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/config, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-ns-events -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-ns-events, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-syscall-events -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-syscall-events, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/libc-wrapper -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/libc-wrapper, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/r
 egression/ust/multi-lib -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/multi-lib, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/hashtable -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/hashtable, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/testpoint -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/testpoint, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/ust-consumer -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/ust-consumer, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/overlap/demo -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/linking, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/unit/ini_config -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.1
 3.7/tests/unit/ini_config, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/bytecode -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/bytecode, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/index -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/index, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/bin/lttng-consumerd -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/bin/lttng-consumerd, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/sessiond-comm -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/sessiond-comm, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/include/lttng -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/include/lttng, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/daemo
 n -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/daemon, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/exit-fast -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/exit-fast, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/string-utils -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/string-utils, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/bin/lttng-sessiond -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/bin/lttng-sessiond, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/userspace-probe-elf-binary -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/userspace-probe-elf-binary, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/kernel-ctl -> /usr/src/debug/lttng-t
 ools/2.13.7-r0/lttng-tools-2.13.7/src/common/kernel-ctl, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-ust-events -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-ust-events, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/tools/trigger/name -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/tools/trigger/name, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/baddr-statedump -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/baddr-statedump, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/compat -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/compat, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/multi-session -> /usr/src/debug/lttng-tools/2.13.7-r0/ltt
 ng-tools-2.13.7/tests/regression/ust/multi-session, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/tools/trigger/utils -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/tools/trigger/utils, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/relayd -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/relayd, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/event-rule -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/event-rule, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/include/lttng/event-rule -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/include/lttng/event-rule, directory renamed /usr/src/debug/lttng-tools/2.
 13.4-r0/lttng-tools-2.13.4/src/common/consumer -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/consumer, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-ust-tracef -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-ust-tracef, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/conditions -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/conditions, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/filter -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/filter, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/type-declarations -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/type-declarations, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/tap -> /usr/src/debu
 g/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/tap, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-ust-events-ns -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-ust-events-ns, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/health -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/health, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/userspace-probe-elf-cxx-binary -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/userspace-probe-elf-cxx-binary, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/clock-override -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/clock-override, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/high-throughput -> /
 usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/low-throughput, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-ust-nevents-str -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-ust-nevents-str, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-ust-nevents -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-ust-nevents, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/bin/lttng-crash -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/bin/lttng-crash, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/actions -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/actions, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/utils/testapp/gen-kernel-test-events -> /usr/src/debug/lttn
 g-tools/2.13.7-r0/lttng-tools-2.13.7/tests/utils/testapp/gen-kernel-test-events, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/bin/lttng-relayd -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/bin/lttng-relayd, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/unit -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/unit, directory renamed /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/tests/regression/ust/getcpu-override -> /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/tests/regression/ust/getcpu-override, removed "/usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/userspace-probe.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/dynamic-array.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/trace-chunk-registry.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/fs-handle-internal.h /usr/src/debug/lttng-
 tools/2.13.4-r0/lttng-tools-2.13.4/src/common/uuid.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/path.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/time.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/fs-handle.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/lttng-elf.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/waiter.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/fd-handle.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/waiter.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/buffer-view.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/readwrite.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/defaults.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/runas.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/pipe.h /usr/src/debug/lttng
 -tools/2.13.4-r0/lttng-tools-2.13.4/src/common/macros.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/uri.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/trace-chunk.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/notification.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/error-query.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/defaults.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/lttng-kernel.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/buffer-view.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/mi-lttng.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/unix.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/lttng-elf.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/log-level-rule.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/f
 utex.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/shm.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/futex.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/snapshot.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/fd-handle.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/index-allocator.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/kernel-probe.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/error.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/endpoint.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/dynamic-buffer.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/lttng-kernel-old.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/credentials.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/daemonize.h /usr/src/debug/lttng-tools/2.13.4-r
 0/lttng-tools-2.13.4/src/common/event-field-value.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/fs-handle.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/session-descriptor.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/dynamic-array.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/spawn-viewer.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/error.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/context.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/location.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/credentials.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/utils.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/context.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/filter.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/dynamic
 -buffer.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/path.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/evaluation.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/readwrite.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/domain.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/pipe.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/spawn-viewer.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/tracker.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/thread.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/payload.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/shm.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/event.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/index-allocator.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src
 /common/utils.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/unix.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/tracker.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/trigger.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/uri.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/trace-chunk.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/filter.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/payload-view.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/runas.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/payload.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/payload-view.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/time.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/uuid.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src
 /common/thread.h /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/snapshot.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/daemonize.c /usr/src/debug/lttng-tools/2.13.4-r0/lttng-tools-2.13.4/src/common/mi-lttng.c", added "/usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/fs-handle.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/spawn-viewer.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/context.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/daemonize.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/defaults.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/channel.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/shm.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/lttng-kernel.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/fd-handle.c /usr/src/debug/lttng-tools/2.1
 3.7-r0/lttng-tools-2.13.7/src/common/buffer-view.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/filter.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/uuid.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/runas.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/index-allocator.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/notification.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/path.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/pipe.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/shm.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/path.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/lttng-kernel-old.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/time.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/unix.h /usr/src/debug/lttng-tool
 s/2.13.7-r0/lttng-tools-2.13.7/src/common/dynamic-array.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/error.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/pipe.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/readwrite.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/time.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/dynamic-buffer.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/fs-handle.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/fs-handle-internal.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/trace-chunk.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/snapshot.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/log-level-rule.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/mi-lttng.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/commo
 n/payload.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/domain.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/waiter.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/filter.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/userspace-probe.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/payload.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/endpoint.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/payload-view.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/trace-chunk.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/fd-handle.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/uri.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/daemonize.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/thread.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tool
 s-2.13.7/src/common/macros.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/thread.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/event-field-value.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/buffer-view.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/tracker.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/unix.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/lttng-elf.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/runas.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/utils.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/session-descriptor.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/snapshot.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/readwrite.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/mi-lttng.h /usr/src/debug/lttng-
 tools/2.13.7-r0/lttng-tools-2.13.7/src/common/utils.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/dynamic-array.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/kernel-probe.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/tracker.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/index-allocator.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/context.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/credentials.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/error.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/dynamic-buffer.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/futex.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/futex.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/event.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/trigger
 .c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/uri.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/evaluation.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/lttng-elf.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/credentials.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/waiter.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/spawn-viewer.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/error-query.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/defaults.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/trace-chunk-registry.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/location.c /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/payload-view.h /usr/src/debug/lttng-tools/2.13.7-r0/lttng-tools-2.13.7/src/common/uuid.h"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PV changed from "2.13.4" to "2.13.7"
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGV changed from 2.13.4 [default] to 2.13.7 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGSIZE changed from 5582269 to 5619133 (+1%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PV changed from "2.13.4" to "2.13.7"

--===============7441753225025309819==--

