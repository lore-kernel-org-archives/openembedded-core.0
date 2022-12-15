Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A84BC63705
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.145446.1671136352952078623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mnoaS69U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185177d179b-a0c54529-55ae-4546-aabf-b820cddf90a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=greAoobVlgo5Sg+sR4IYWqZljJ8ymaDQ0iOB8GzZyi0=;
	b=mnoaS69UDNBaFOlfRNYXzheZ13466mgYlQIj69LhNZwiZs9aw7bIP3EorF6SkHUa
	77apTvBMHUltYLT0DbLg0rOvrFRojhWUD3H55bfCMW25l0mi1fGSotwsOl0wFUlEZzl
	Lww85t+vTxA127tr74MvEf7EUgwtEd25vtJ/Xxp0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=greAoobVlgo5Sg+sR4IYWqZljJ8ymaDQ0iOB8GzZyi0=;
	b=kTV/EznUZP9d1VVfectb9FQnl+3ey8TrpZl/W/RX7W/NHD8TlkgNx1bG0Gj16Zni
	AU7Bnuf9mSEEWPXVxkY3o5TDWVyFKxLz8azHhDO/XWcqYbBp6bCGXs/biooY608bLhW
	1DUkZvbzJuLO91zvwOOqNUJW4NVoemCIe2FPNbvM=
Content-Type: multipart/mixed; boundary="===============8546722386878101701=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bash: upgrading to 5.2.15 SUCCEEDED
Message-ID: <01010185177d179b-a0c54529-55ae-4546-aabf-b820cddf90a8-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174678

--===============8546722386878101701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bash* to *5.2.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bash-upgrade-5.2.9-5.2.15.patch
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
--===============8546722386878101701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 71 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a17119725dcec5021263a34500e71ffab7df2c57"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 5 Mirrors 0 Missed 52 Current 495 (8% match, 90% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 969 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 1127 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 1172 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 1344 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1345 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: Running task 1591 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1669 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1671 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_fetch)
NOTE: Running task 1672 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1673 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1674 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 1676 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1680 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: Running task 1751 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 1752 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1814 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 1815 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: Running task 1816 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: Running task 1817 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1818 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1819 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1820 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: Running task 1821 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1822 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: Running task 1823 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1824 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1825 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1826 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1827 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_unpack)
NOTE: Running task 1828 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1829 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1830 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 1831 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 1832 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1833 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1834 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 1835 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: Running task 1836 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1837 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1842 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Started
NOTE: Running task 1843 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1844 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1845 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 1846 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1847 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1848 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: Running task 1849 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: Running task 1850 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 1851 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1852 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1853 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1854 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1855 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 1857 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 1858 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1859 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 1860 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1861 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 05eeb70053e16d045d46887651f21d75cc4db723b2603ba4e60cf4cf88bb16d6
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running task 1862 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1863 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: Running task 1864 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 1865 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1866 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1867 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1868 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1870 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: Running task 1871 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1872 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1873 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: Running task 1874 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1875 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1876 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1877 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1878 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1880 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1881 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1882 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1883 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1884 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1885 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1886 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: Running task 1887 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1888 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1889 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1890 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1891 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1893 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1894 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1895 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1897 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1898 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1899 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1901 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1903 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1904 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1905 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: Running task 1906 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: Running task 1907 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1908 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_install)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Succeeded
NOTE: Running task 1910 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe iproute2-6.0.0-r0: task do_install: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1911 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Started
NOTE: recipe iproute2-6.0.0-r0: task do_install: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1912 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_package)
NOTE: Running task 1913 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe iproute2-6.0.0-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1914 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1915 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1916 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1917 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe iproute2-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1918 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata)
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1918 tasks of which 1802 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/iproute2/6.0.0-r0/temp/log.do_packagedata.2691259
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============8546722386878101701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a17119725dcec5021263a34500e71ffab7df2c57"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 5 Mirrors 0 Missed 52 Current 495 (8% match, 90% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 969 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 1127 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 1172 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 1344 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1345 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1588 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1669 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1670 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1671 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 1673 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_fetch)
NOTE: Running task 1674 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1676 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1680 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running task 1813 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1815 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1816 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1817 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1818 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 1819 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1820 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1821 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: Running task 1823 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1824 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1825 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1826 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1827 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1828 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1829 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 1830 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_unpack)
NOTE: Running task 1831 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1832 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 1833 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1834 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1835 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 1836 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1837 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1838 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: Running task 1841 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1842 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1843 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 1844 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1845 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1847 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: Running task 1848 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1849 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1850 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1852 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1853 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: Running task 1854 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1855 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1856 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1857 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: Running task 1858 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1859 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1860 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 1861 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1862 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1863 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1866 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1867 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1868 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: Running task 1869 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: Running task 1871 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 05eeb70053e16d045d46887651f21d75cc4db723b2603ba4e60cf4cf88bb16d6
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1873 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: Running task 1874 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1875 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1876 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: Running task 1877 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1879 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1880 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1881 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1883 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1884 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1885 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1886 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: Running task 1887 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1888 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: Running task 1889 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1890 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1891 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1893 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1894 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1895 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1898 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: Running task 1899 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1900 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1901 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1902 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1903 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1904 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1905 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1906 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1907 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1908 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_install)
NOTE: recipe iproute2-6.0.0-r0: task do_install: Started
NOTE: recipe iproute2-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1910 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_package)
NOTE: recipe iproute2-6.0.0-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1911 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1912 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Succeeded
NOTE: Running task 1913 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1914 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1915 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1916 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe iproute2-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata)
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1918 tasks of which 1802 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/iproute2/6.0.0-r0/temp/log.do_packagedata.2537863
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============8546722386878101701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a17119725dcec5021263a34500e71ffab7df2c57"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 5 Mirrors 0 Missed 52 Current 495 (8% match, 90% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 968 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 1127 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 1172 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 1342 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1343 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1591 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1669 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_fetch)
NOTE: Running task 1670 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 1671 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1672 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1674 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1675 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1680 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running task 1815 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 1817 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1818 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 1819 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: Running task 1820 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: Running task 1821 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: Running task 1823 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1824 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: Running task 1826 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1827 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1828 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1829 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_unpack)
NOTE: Running task 1830 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 1831 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1832 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1833 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1834 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 1835 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1836 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1837 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 1838 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1839 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1840 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: Running task 1841 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1842 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1843 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1844 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1845 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1847 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: Running task 1848 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1849 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1850 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1851 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1852 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1853 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1854 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1855 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: Running task 1856 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1857 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1858 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1859 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: Running task 1860 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1861 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: Running task 1862 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: Running task 1863 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running task 1864 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1865 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1867 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: Running task 1868 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1869 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: Running task 1870 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1871 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 05eeb70053e16d045d46887651f21d75cc4db723b2603ba4e60cf4cf88bb16d6
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1873 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1875 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1876 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1877 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1880 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1881 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1883 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1884 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1885 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1886 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1887 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1888 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1889 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1890 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1891 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1893 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1894 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: Running task 1895 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1896 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1898 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1899 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: Running task 1900 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1901 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1903 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: Running task 1904 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1905 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: Running task 1906 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1907 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1908 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1910 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_kernel_checkout: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1911 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1912 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_install)
NOTE: recipe iproute2-6.0.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1913 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe iproute2-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1914 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.0.0-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1915 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1916 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1917 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe iproute2-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1918 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata)
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_fe2b95c83e-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1918 tasks of which 1802 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/iproute2/6.0.0-r0/temp/log.do_packagedata.2643380
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============8546722386878101701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bash/bash-bashbug: PKGSIZE changed from 7091 to 7092 (+0%)
packages/core2-32-poky-linux/bash/bash-bashbug: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-bashbug: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-dbg: PKGSIZE changed from 3245584 to 3246456 (+0%)
packages/core2-32-poky-linux/bash/bash-dbg: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-dbg: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-dev: PKGSIZE changed from 306465 to 306601 (+0%)
packages/core2-32-poky-linux/bash/bash-dev: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-dev: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-doc: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-doc: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-loadable: PKGSIZE changed from 517285 to 517289 (+0%)
packages/core2-32-poky-linux/bash/bash-loadable: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-loadable: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-af: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-af: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-bg: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-bg: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ca: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ca: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-cs: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-cs: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-da: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-da: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-de: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-de: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-el: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-el: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-en+boldquot: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-en+boldquot: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-en+quot: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-en+quot: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-eo: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-eo: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-es: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-es: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-et: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-et: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-fi: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-fi: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-fr: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-fr: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ga: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ga: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-gl: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-gl: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-hr: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-hr: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-hu: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-hu: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-id: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-id: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-it: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-it: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ja: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ja: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ko: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ko: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-lt: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-lt: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-nb: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-nb: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-nl: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-nl: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-pl: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-pl: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-pt-br: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-pt-br: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-pt: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-pt: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ro: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ro: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-ru: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-ru: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-sk: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-sk: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-sl: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-sl: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-sr: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-sr: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-sv: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-sv: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-tr: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-tr: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-uk: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-uk: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-vi: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-vi: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-zh-cn: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-zh-cn: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-locale-zh-tw: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-locale-zh-tw: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-ptest: PKGSIZE changed from 1581674 to 1581781 (+0%)
packages/core2-32-poky-linux/bash/bash-ptest: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-ptest: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-src: PKGSIZE changed from 4390908 to 4392455 (+0%)
packages/core2-32-poky-linux/bash/bash-src: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-src: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash-staticdev: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash-staticdev: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash/bash: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash/bash: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash: PV changed from "5.2.9" to "5.2.15"
packages/core2-32-poky-linux/bash: PKGV changed from 5.2.9 [default] to 5.2.15 [default]
packages/core2-32-poky-linux/bash: SRC_URI changed from "https://ftp.gnu.org/gnu/bash/bash-5.2.9.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch" to "https://ftp.gnu.org/gnu/bash/bash-5.2.15.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch"

--===============8546722386878101701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 21 recipes from the core2-32 sysroot...done.
Removing 88 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a17119725dcec5021263a34500e71ffab7df2c57"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 316 Local 265 Mirrors 0 Missed 51 Current 160 (83% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 177 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 179 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 180 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 182 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 186 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 210 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 569 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 579 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 584 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 615 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 616 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 652 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 675 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 676 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 677 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 678 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_fetch)
NOTE: Running task 679 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 680 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 685 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe make-4.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 236 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 237 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_setscene)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: Running setscene task 242 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Started
NOTE: Running setscene task 243 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running task 729 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 736 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 742 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 743 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 744 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 745 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 747 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 748 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_unpack)
NOTE: Running task 749 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 750 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe elfutils-0.188-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 256 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 257 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 756 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 760 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 761 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 762 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 269 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_setscene)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 763 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running setscene task 281 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 783 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: Running task 784 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe musl-obstack-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 785 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 790 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.41-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: Running task 798 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 803 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 300 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: Running setscene task 306 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: Running task 828 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 314 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 320 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 833 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 834 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 840 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 841 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 854 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 859 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 335 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 864 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: Running setscene task 341 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running setscene task 343 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running task 869 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 870 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: Running task 887 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 892 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 893 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 894 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 895 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 896 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running task 897 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 898 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 907 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 916 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 917 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 05eeb70053e16d045d46887651f21d75cc4db723b2603ba4e60cf4cf88bb16d6
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 934 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: Running task 935 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: Running task 936 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 937 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 952 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe shadow-4.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 383 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 957 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 384 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 385 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 958 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 404 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 476 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1297 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1323 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1430 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1504 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1563 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1564 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1565 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1599 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1602 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1603 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1604 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1605 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: Running task 1606 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: Running task 1607 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1608 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1609 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: Running task 1610 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1611 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1612 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1613 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: Running task 1614 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1615 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1616 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1617 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1619 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1620 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1621 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1622 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: Running task 1623 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1625 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1626 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Started
NOTE: Running task 1627 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1628 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1629 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1630 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1631 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1632 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1633 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: Running task 1634 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1635 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1636 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1637 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1638 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1639 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: Running task 1640 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.0.0-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1641 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_package)
NOTE: recipe iproute2-6.0.0-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1642 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: Running task 1643 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1644 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_compile)
NOTE: recipe bash-5.2.15-r0: task do_compile: Started
NOTE: recipe iproute2-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1645 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata)
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 1646 of 1696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_compile: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1646 tasks of which 1528 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.0.0-r0/temp/log.do_packagedata.2757766
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============8546722386878101701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a17119725dcec5021263a34500e71ffab7df2c57"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 5 Mirrors 0 Missed 52 Current 495 (8% match, 90% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 969 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_fetch)
NOTE: Running task 1127 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: Running task 1172 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 1344 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1345 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1589 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1670 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1672 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1673 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_fetch)
NOTE: Running task 1674 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 1675 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_fetch)
NOTE: Running task 1676 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1680 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1811 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 1814 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Started
NOTE: Running task 1815 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iproute2-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1816 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1817 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1818 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_fetch: Succeeded
NOTE: Running task 1819 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_unpack)
NOTE: Running task 1820 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 1821 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1822 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1823 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1824 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1825 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1826 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1827 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1828 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_unpack)
NOTE: Running task 1829 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 1830 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_unpack)
NOTE: Running task 1831 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: Running task 1832 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1833 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1834 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1835 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 1836 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1837 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1841 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: Running task 1842 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_unpack: Started
NOTE: Running task 1843 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1844 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1845 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1847 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1848 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1849 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 1850 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe iproute2-6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1851 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1852 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1853 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: Running task 1854 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1855 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1856 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1857 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1858 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_patch)
NOTE: Running task 1859 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1860 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1861 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1862 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1863 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: Running task 1864 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1865 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic)
NOTE: recipe iproute2-6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1866 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1867 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1868 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1869 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 1871 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_populate_lic unihash changed to 05eeb70053e16d045d46887651f21d75cc4db723b2603ba4e60cf4cf88bb16d6
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1873 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1875 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1876 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe bash-5.2.15-r0: task do_configure: Started
NOTE: Running task 1877 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1878 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe iproute2-6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1880 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1881 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1882 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: Running task 1883 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1884 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1885 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1886 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1887 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1888 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1889 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1890 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1891 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1893 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1894 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: Running task 1895 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1896 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1897 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1899 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1900 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe shadow-4.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1901 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1902 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1903 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: Running task 1904 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1905 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: Running task 1906 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1907 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1908 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1910 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.19.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_kernel_checkout: Started
NOTE: recipe iproute2-6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1911 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_install)
NOTE: recipe iproute2-6.0.0-r0: task do_install: Started
NOTE: recipe iproute2-6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1912 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_package)
NOTE: recipe iproute2-6.0.0-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1913 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1914 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1915 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1916 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 1917 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe iproute2-6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1918 of 1971 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata)
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.0.0-r0: task do_packagedata: Failed
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_dee954e390-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1918 tasks of which 1802 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: iproute2-6.0.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/iproute2/6.0.0-r0/temp/log.do_packagedata.2590644
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.0.0.bb:do_packagedata) failed with exit code '1'

--===============8546722386878101701==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-upgrade-5.2.9-5.2.15.patch"

RnJvbSA3NmFlNDYyNjcwMGM0MjA0NDdmMmY1ODU5MWE4ZjBlODI2OGUyMTIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTI6NDc6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXNoOiB1cGdyYWRlIDUuMi45IC0+IDUuMi4xNQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
YmFzaC97YmFzaF81LjIuOS5iYiA9PiBiYXNoXzUuMi4xNS5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvYmFzaC97YmFzaF81LjIuOS5iYiA9PiBiYXNoXzUuMi4xNS5iYn0gKDg5JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUuMi45LmJiIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaF81LjIuMTUuYmIKc2ltaWxhcml0eSBpbmRleCA4
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaF81LjIuOS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaF81LjIuMTUuYmIKaW5kZXgg
MzlhNWQzZGU4Ni4uZjc4Zjc5ZmNjNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2Jhc2gvYmFzaF81LjIuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNo
XzUuMi4xNS5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vYmFz
aC8ke0JQfS50YXIuZ3o7bmFtZT10YXJiYWxsIFwKICAgICAgICAgICAgZmlsZTovL3VzZV9hY2xv
Y2FsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9
ICI2OGQ5NzgyNjQyNTNiYzkzM2Q2OTJmMWRlMTk1ZTJlNWI0NjNhMzk4NGRmYjRlNTUwNGIwNzY4
NjVmMTZiNmRkIgorU1JDX1VSSVt0YXJiYWxsLnNoYTI1NnN1bV0gPSAiMTM3MjA5NjViNWY0ZmMz
YTBkNGI2MWRkMzdlNzU2NWM3NDFkYTlhNWJlMjRlZGMyYWUwMDE4MmZjMWIzNTg4YyIKIAogREVC
VUdfT1BUSU1JWkFUSU9OOmFwcGVuZDphcm12NCA9ICIgJHtAYmIudXRpbHMuY29udGFpbnMoJ1RV
TkVfQ0NBUkdTJywgJy1tdGh1bWInLCAnLWZvbWl0LWZyYW1lLXBvaW50ZXInLCAnJywgZCl9Igog
REVCVUdfT1BUSU1JWkFUSU9OOmFwcGVuZDphcm12NSA9ICIgJHtAYmIudXRpbHMuY29udGFpbnMo
J1RVTkVfQ0NBUkdTJywgJy1tdGh1bWInLCAnLWZvbWl0LWZyYW1lLXBvaW50ZXInLCAnJywgZCl9
IgotLSAKMi4zNy4zCgo=

--===============8546722386878101701==--

