Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058A2CA9ED8
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.107418.1682976349473379046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nLhFwr2N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010187d9352620-ebbc9cd2-5b02-41ae-971e-28b42ace4b1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qOXyMvJWXpMlw9Bydv39gDM9UKA7Tm9HaKfxRjHzEyo=;
	b=nLhFwr2NCurBPlkVRkvvp6LDY7lW4rzEno6kpJ8Wa58TvfwQQj1iGlHIQBzfCQw2
	UzDoqKsvi21PmqC2cMB3ukiUzockhpusuO9kYNR8nBWfg1D54d85SyvAqoqR6GUVW+r
	mcar+K7uRbUS4y/u4BpM5id7v0ROjA0wGAAhUh+I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qOXyMvJWXpMlw9Bydv39gDM9UKA7Tm9HaKfxRjHzEyo=;
	b=XU6rE60Ap0/iGTfPGGuquihgNdCewTmvtEkXR7kckytsLT3AqCVRf1ftxQbhA4RE
	eSV+3qpuLG9Tz5Zm6ENrwLqUSHBDfJttBjbb+PzkGTQC0M+4lN9QN4jKIW3sybrdsri
	373VQdpi+MDNKgPFlHJd7JZ51QzUCIHA7AB5H4O8=
Content-Type: multipart/mixed; boundary="===============6933265284521416062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] parted: upgrading to 3.6 SUCCEEDED
Message-ID: <01010187d9352620-ebbc9cd2-5b02-41ae-971e-28b42ace4b1a-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180648

--===============6933265284521416062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *parted* to *3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-parted-upgrade-3.5-3.6.patch
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
--===============6933265284521416062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9211fd7189ccee0b5261551456fb5850ef77840d"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 19 Mirrors 0 Missed 49 Current 504 (27% match, 91% complete)
Removing 2 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 506 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 521 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 522 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 523 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 524 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 974 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 570 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running task 1176 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
NOTE: Running task 1404 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 1405 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1406 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1590 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1623 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 1624 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1638 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: Running task 1704 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_fetch)
NOTE: Running task 1705 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1706 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1708 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_fetch: Succeeded
NOTE: Running task 1758 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 1759 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1770 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: Running task 1771 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1772 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1773 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1790 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: Running task 1791 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1829 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1830 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1831 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 1832 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1855 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: Running task 1857 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1858 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1859 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 1860 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1861 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3/3.11.2-r0/temp/log.do_packagedata_setscene.812027
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 571 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: Running task 1864 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1865 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_unpack)
NOTE: Running task 1866 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1867 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1868 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_unpack)
NOTE: Running task 1869 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1870 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: Running task 1872 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Started
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 1874 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: Running task 1875 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1876 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1877 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1878 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1879 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1880 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1881 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1882 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1883 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 1884 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1885 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 4704bf8fb1780217b866cbd9f5da599e8f1de3980b8063726df5c4ea58154cb2
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1886 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1887 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1888 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: Running task 1889 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: Running task 1890 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1891 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_patch)
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1892 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1893 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1896 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1897 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1899 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1900 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1901 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1940 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: Running task 1942 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1947 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1948 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1949 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1963 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1964 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1965 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1966 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1967 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1968 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1969 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1970 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1972 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1974 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1975 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1976 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1977 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 1978 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1979 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1980 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1981 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1982 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 1984 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: Running task 1985 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1986 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1987 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1988 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1989 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_unpack: Succeeded
NOTE: Running task 1990 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1991 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_checkout: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1992 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1993 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1994 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.2.0-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_package)
NOTE: recipe iproute2-6.2.0-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_install)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1997 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Succeeded
NOTE: Running task 1998 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_package)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Started
NOTE: recipe iproute2-6.2.0-r0: task do_package: Succeeded
NOTE: Running task 1999 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata)
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Failed
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_checkout: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1999 tasks of which 1886 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata
Summary: There were 94 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/iproute2/6.2.0-r0/temp/log.do_packagedata.840175
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata) failed with exit code '1'

--===============6933265284521416062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9211fd7189ccee0b5261551456fb5850ef77840d"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 19 Mirrors 0 Missed 49 Current 504 (27% match, 91% complete)
Removing 2 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 506 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 521 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 522 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 523 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 524 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 971 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1176 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 570 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_fetch: Started
NOTE: Running task 1404 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 1405 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1406 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1589 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 1590 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1592 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1608 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1638 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_fetch: Succeeded
NOTE: Running task 1702 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 1703 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1704 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_fetch)
NOTE: Running task 1705 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1706 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1708 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_fetch)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1731 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: Running task 1732 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1733 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1734 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1790 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: Running task 1791 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1800 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1801 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1852 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package_write_rpm)
NOTE: Running task 1853 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Started
NOTE: Running task 1854 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1858 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_unpack: Started
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: Running task 1859 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1860 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1861 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1862 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: Running task 1863 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_unpack)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1865 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1867 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_unpack)
NOTE: Running task 1868 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1870 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.964749
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 571 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Started
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: Running task 1871 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1872 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1873 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: Running task 1875 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: Running task 1876 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1877 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1880 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1881 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1882 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1883 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1884 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 4704bf8fb1780217b866cbd9f5da599e8f1de3980b8063726df5c4ea58154cb2
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1885 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1886 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1887 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 1888 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1889 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1890 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1891 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1892 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1893 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1896 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1897 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1899 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1900 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1901 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1940 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: Running task 1942 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1947 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1948 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1949 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1950 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1964 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1965 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1966 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1967 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1968 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1969 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1970 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1972 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1974 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1975 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1976 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1977 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 1978 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1979 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1980 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1981 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1983 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1984 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1985 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 1986 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1987 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1988 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1989 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_unpack: Succeeded
NOTE: Running task 1990 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1991 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1992 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_kernel_checkout: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1993 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1994 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_install)
NOTE: recipe iproute2-6.2.0-r0: task do_install: Started
NOTE: recipe iproute2-6.2.0-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_package)
NOTE: recipe iproute2-6.2.0-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_install)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1997 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Succeeded
NOTE: Running task 1998 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_package)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Started
NOTE: recipe iproute2-6.2.0-r0: task do_package: Succeeded
NOTE: Running task 1999 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata)
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Failed
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_kernel_checkout: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1999 tasks of which 1886 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata
Summary: There were 94 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/iproute2/6.2.0-r0/temp/log.do_packagedata.993645
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata) failed with exit code '1'

--===============6933265284521416062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/parted: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted: SRC_URI changed from "https://ftp.gnu.org/gnu/parted/parted-3.5.tar.xz file://fix-doc-mandir.patch file://run-ptest" to "https://ftp.gnu.org/gnu/parted/parted-3.6.tar.xz file://fix-doc-mandir.patch file://run-ptest"
packages/core2-32-poky-linux/parted: PACKAGES: added "parted-locale-ka"
packages/core2-32-poky-linux/parted/parted-dbg: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-dbg: FILELIST: removed "/usr/lib/.debug/libparted.so.2.0.4 /usr/lib/.debug/libparted-fs-resize.so.0.0.4", added "/usr/lib/.debug/libparted.so.2.0.5 /usr/lib/.debug/libparted-fs-resize.so.0.0.5"
packages/core2-32-poky-linux/parted/parted-dbg: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-dbg: PKGSIZE changed from 1608840 to 1627512 (+1%)
packages/core2-32-poky-linux/parted/parted-dev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-dev: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-dev: PKGSIZE changed from 51119 to 52495 (+3%)
packages/core2-32-poky-linux/parted/parted-doc: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-doc: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-doc: PKGSIZE changed from 74823 to 75876 (+1%)
packages/core2-32-poky-linux/parted/parted-locale-ca: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ca: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-cs: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-cs: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-cs: PKGSIZE changed from 53937 to 53773 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-da: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-da: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-da: PKGSIZE changed from 46440 to 46294 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-de: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-de: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-de: PKGSIZE changed from 75120 to 74785 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-es: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-es: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-es: PKGSIZE changed from 73981 to 73647 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-fr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-fr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-fr: PKGSIZE changed from 71697 to 71324 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-fur: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGSIZE changed from 65752 to 73773 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-gl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-gl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-gl: PKGSIZE changed from 36492 to 36338 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-hu: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-hu: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-hu: PKGSIZE changed from 64534 to 64392 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-id: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-id: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-id: PKGSIZE changed from 71674 to 71369 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-it: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-it: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-it: PKGSIZE changed from 65306 to 65161 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ja: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ja: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ja: PKGSIZE changed from 82969 to 82612 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ko: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ko: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ko: PKGSIZE changed from 77412 to 77057 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-nl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-nl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-nl: PKGSIZE changed from 70310 to 69996 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-nn: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-nn: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pl: PKGSIZE changed from 73932 to 73608 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PKGSIZE changed from 72810 to 72480 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-pt: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pt: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ro: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGSIZE changed from 76252 to 75936 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ru: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ru: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ru: PKGSIZE changed from 90800 to 92400 (+2%)
packages/core2-32-poky-linux/parted/parted-locale-rw: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-rw: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sk: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sk: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sk: PKGSIZE changed from 62607 to 62461 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-sl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sl: PKGSIZE changed from 58539 to 58397 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-sr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sr: PKGSIZE changed from 90984 to 92670 (+2%)
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sv: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGSIZE changed from 72383 to 72054 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-tr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-tr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-tr: PKGSIZE changed from 64803 to 64669 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-uk: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-uk: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-uk: PKGSIZE changed from 93872 to 93455 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-vi: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGSIZE changed from 69671 to 78082 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGSIZE changed from 67719 to 67435 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGSIZE changed from 68482 to 68192 (-0%)
packages/core2-32-poky-linux/parted/parted-ptest: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t0911-type-dos-invalid.sh /usr/lib/parted/ptest/tests/t9025-gpt-1s-partition.sh /usr/lib/parted/ptest/tests/t0901-type-gpt-invalid.sh /usr/lib/parted/ptest/tests/t9024-msdos-1s-partition.sh /usr/lib/parted/ptest/tests/t0900-type-gpt.sh /usr/lib/parted/ptest/tests/t0910-type-dos.sh"
packages/core2-32-poky-linux/parted/parted-ptest: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-ptest: PKGSIZE changed from 581906 to 608885 (+5%)
packages/core2-32-poky-linux/parted/parted-src: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-src: FILELIST: directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ufs -> /usr/src/debug/parted/3.6-r0/libparted/fs/ufs, directory renamed /usr/src/debug/parted/3.5-r0/include/parted -> /usr/src/debug/parted/3.6-r0/include/parted, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/fat -> /usr/src/debug/parted/3.6-r0/libparted/fs/fat, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/hfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/hfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/udf -> /usr/src/debug/parted/3.6-r0/libparted/fs/udf, directory renamed /usr/src/debug/parted/3.5-r0/libparted/labels -> /usr/src/debug/parted/3.6-r0/libparted/labels, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r/hfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/r/hfs, directory renamed /usr/src/debug/parted/3.5-r0/lib/glthread -> /usr/src/debug/parted/3.6-r0/lib/glthread, directory renamed /usr/src/debug/par
 ted/3.5-r0/parted -> /usr/src/debug/parted/3.6-r0/parted, directory renamed /usr/src/debug/parted/3.5-r0/libparted/arch -> /usr/src/debug/parted/3.6-r0/libparted/arch, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/reiserfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/reiserfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/linux_swap -> /usr/src/debug/parted/3.6-r0/libparted/fs/linux_swap, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ntfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/ntfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r/fat -> /usr/src/debug/parted/3.6-r0/libparted/fs/r/fat, directory renamed /usr/src/debug/parted/3.5-r0/libparted -> /usr/src/debug/parted/3.6-r0/libparted, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/xfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/xfs, directory renamed /usr/src/debug/parted/3.5-r0/tests -> /usr/src/debug/parted/3.6-r0/tests, directory renamed /usr/src/debug/part
 ed/3.5-r0/libparted/fs/f2fs -> /usr/src/debug/parted/3.6-r0/libparted/fs/f2fs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/cs -> /usr/src/debug/parted/3.6-r0/libparted/cs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/amiga -> /usr/src/debug/parted/3.6-r0/libparted/fs/amiga, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r -> /usr/src/debug/parted/3.6-r0/libparted/fs/r, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/nilfs2 -> /usr/src/debug/parted/3.6-r0/libparted/fs/nilfs2, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/jfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/jfs, directory renamed /usr/src/debug/parted/3.5-r0/partprobe -> /usr/src/debug/parted/3.6-r0/partprobe, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ext2 -> /usr/src/debug/parted/3.6-r0/libparted/fs/ext2, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/btrfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/btrfs, removed "/usr/sr
 c/debug/parted/3.5-r0/lib/basename-lgpl.h /usr/src/debug/parted/3.5-r0/lib/basename-lgpl.c /usr/src/debug/parted/3.5-r0/lib/xalloc.h /usr/src/debug/parted/3.5-r0/lib/setlocale_null.c /usr/src/debug/parted/3.5-r0/lib/progname.h /usr/src/debug/parted/3.5-r0/lib/setlocale_null.h /usr/src/debug/parted/3.5-r0/lib/basename.c /usr/src/debug/parted/3.5-r0/lib/progname.c /usr/src/debug/parted/3.5-r0/lib/tempname.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray-skeleton.c /usr/src/debug/parted/3.5-r0/lib/regex.h /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_dupfree.c /usr/src/debug/parted/3.5-r0/lib/getopt-ext.h /usr/src/debug/parted/3.5-r0/lib/strerror.c /usr/src/debug/parted/3.5-r0/lib/idx.h /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_grow.c /usr/src/debug/parted/3.5-r0/lib/version-etc.h /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_at_failure.c /usr/src/debug/parted/3.5-r0/lib/version-etc.c /usr/src/debug/parted/3.5-r0/lib/closeout.h /usr/src/debug/parted/3.5-r0/li
 b/closeout.c /usr/src/debug/parted/3.5-r0/lib/dirname-lgpl.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_emplace_enlarge.c /usr/src/debug/parted/3.5-r0/lib/regex_internal.h /usr/src/debug/parted/3.5-r0/lib/getprogname.c /usr/src/debug/parted/3.5-r0/lib/regex_internal.c /usr/src/debug/parted/3.5-r0/lib/error.h /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_finalize.c /usr/src/debug/parted/3.5-r0/lib/cloexec.c /usr/src/debug/parted/3.5-r0/lib/getopt1.c /usr/src/debug/parted/3.5-r0/lib/malloca.c /usr/src/debug/parted/3.5-r0/lib/mbrtowc.c /usr/src/debug/parted/3.5-r0/lib/c-strcase.h /usr/src/debug/parted/3.5-r0/lib/c-ctype.h /usr/src/debug/parted/3.5-r0/lib/malloca.h /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer.gl.h /usr/src/debug/parted/3.5-r0/lib/stat-time.h /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_resize.c /usr/src/debug/parted/3.5-r0/lib/hard-locale.c /usr/src/debug/parted/3.5-r0/lib/ialloc.h /usr/src/debug/parted/3.5-r0/lib/stdlib.h /usr/src/debug/parted/3.
 5-r0/lib/string.h /usr/src/debug/parted/3.5-r0/lib/quote.h /usr/src/debug/parted/3.5-r0/lib/getopt.c /usr/src/debug/parted/3.5-r0/lib/hard-locale.h /usr/src/debug/parted/3.5-r0/lib/strtol.c /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_set_array_size.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_resize_clear.c /usr/src/debug/parted/3.5-r0/lib/long-options.c /usr/src/debug/parted/3.5-r0/lib/quotearg.h /usr/src/debug/parted/3.5-r0/lib/quotearg.c /usr/src/debug/parted/3.5-r0/lib/getopt-core.h /usr/src/debug/parted/3.5-r0/lib/safe-read.c /usr/src/debug/parted/3.5-r0/lib/c-strcaseeq.h /usr/src/debug/parted/3.5-r0/lib/wchar.h /usr/src/debug/parted/3.5-r0/lib/getopt_int.h /usr/src/debug/parted/3.5-r0/lib/c-strncasecmp.c /usr/src/debug/parted/3.5-r0/lib/sys-limits.h /usr/src/debug/parted/3.5-r0/lib/localcharset.c /usr/src/debug/parted/3.5-r0/lib/localcharset.h /usr/src/debug/parted/3.5-r0/lib/exitfail.c /usr/src/debug/parted/3.5-r0/lib/exitfail.h /usr/src/debug/parted/3.5-r0/l
 ib/argmatch.h /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray.h /usr/src/debug/parted/3.5-r0/lib/argmatch.c /usr/src/debug/parted/3.5-r0/lib/fcntl.h /usr/src/debug/parted/3.5-r0/lib/xalloc-die.c /usr/src/debug/parted/3.5-r0/lib/version-etc-fsf.c /usr/src/debug/parted/3.5-r0/lib/fcntl.c /usr/src/debug/parted/3.5-r0/lib/xmalloc.c /usr/src/debug/parted/3.5-r0/lib/xstrtol.c /usr/src/debug/parted/3.5-r0/lib/dirname.c /usr/src/debug/parted/3.5-r0/lib/regcomp.c /usr/src/debug/parted/3.5-r0/lib/regexec.c /usr/src/debug/parted/3.5-r0/lib/stripslash.c /usr/src/debug/parted/3.5-r0/lib/dirname.h /usr/src/debug/parted/3.5-r0/lib/xstrtol.h /usr/src/debug/parted/3.5-r0/lib/close-stream.c /usr/src/debug/parted/3.5-r0/lib/c-strcasecmp.c /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_grow_preserve.c /usr/src/debug/parted/3.5-r0/lib/close-stream.h", added "/usr/src/debug/parted/3.6-r0/lib/getprogname.c /usr/src/debug/parted/3.6-r0/lib/stripslash.c /usr/src/debug/parted/3.6-r0/lib/safe-read.c 
 /usr/src/debug/parted/3.6-r0/lib/regex.h /usr/src/debug/parted/3.6-r0/lib/progname.c /usr/src/debug/parted/3.6-r0/lib/tempname.c /usr/src/debug/parted/3.6-r0/lib/basename.c /usr/src/debug/parted/3.6-r0/lib/progname.h /usr/src/debug/parted/3.6-r0/lib/dirname-lgpl.c /usr/src/debug/parted/3.6-r0/lib/basename-lgpl.h /usr/src/debug/parted/3.6-r0/lib/hard-locale.h /usr/src/debug/parted/3.6-r0/lib/basename-lgpl.c /usr/src/debug/parted/3.6-r0/lib/hard-locale.c /usr/src/debug/parted/3.6-r0/lib/getopt_int.h /usr/src/debug/parted/3.6-r0/lib/wchar.h /usr/src/debug/parted/3.6-r0/lib/version-etc-fsf.c /usr/src/debug/parted/3.6-r0/lib/strerror.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_finalize.c /usr/src/debug/parted/3.6-r0/lib/stat-time.h /usr/src/debug/parted/3.6-r0/lib/cloexec.c /usr/src/debug/parted/3.6-r0/lib/getopt1.c /usr/src/debug/parted/3.6-r0/lib/malloca.c /usr/src/debug/parted/3.6-r0/lib/mbrtowc.c /usr/src/debug/parted/3.6-r0/lib/c-strcaseeq.h /usr/src/debug/parted/3.6-r0/lib/c
 -ctype.h /usr/src/debug/parted/3.6-r0/lib/malloca.h /usr/src/debug/parted/3.6-r0/lib/close-stream.h /usr/src/debug/parted/3.6-r0/lib/closeout.h /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer.gl.h /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_set_array_size.c /usr/src/debug/parted/3.6-r0/lib/closeout.c /usr/src/debug/parted/3.6-r0/lib/close-stream.c /usr/src/debug/parted/3.6-r0/lib/exitfail.c /usr/src/debug/parted/3.6-r0/lib/exitfail.h /usr/src/debug/parted/3.6-r0/lib/ialloc.h /usr/src/debug/parted/3.6-r0/lib/stdlib.h /usr/src/debug/parted/3.6-r0/lib/string.h /usr/src/debug/parted/3.6-r0/lib/getopt.c /usr/src/debug/parted/3.6-r0/lib/strtol.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_emplace_enlarge.c /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_grow_preserve.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_resize.c /usr/src/debug/parted/3.6-r0/lib/regex_internal.h /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray.h /usr/src/debug/parted/3.6-r0/lib/r
 egex_internal.c /usr/src/debug/parted/3.6-r0/lib/c-strcasecmp.c /usr/src/debug/parted/3.6-r0/lib/getopt-ext.h /usr/src/debug/parted/3.6-r0/lib/quotearg.c /usr/src/debug/parted/3.6-r0/lib/quotearg.h /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_at_failure.c /usr/src/debug/parted/3.6-r0/lib/c-strcase.h /usr/src/debug/parted/3.6-r0/lib/getopt-core.h /usr/src/debug/parted/3.6-r0/lib/setlocale_null.c /usr/src/debug/parted/3.6-r0/lib/setlocale_null.h /usr/src/debug/parted/3.6-r0/lib/idx.h /usr/src/debug/parted/3.6-r0/lib/xalloc-die.c /usr/src/debug/parted/3.6-r0/lib/sys-limits.h /usr/src/debug/parted/3.6-r0/lib/fcntl.h /usr/src/debug/parted/3.6-r0/lib/fcntl.c /usr/src/debug/parted/3.6-r0/lib/long-options.c /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_grow.c /usr/src/debug/parted/3.6-r0/lib/xstrtol.c /usr/src/debug/parted/3.6-r0/lib/xmalloc.c /usr/src/debug/parted/3.6-r0/lib/dirname.c /usr/src/debug/parted/3.6-r0/lib/regcomp.c /usr/src/debug/parted/3.6-r0/lib/regexec.c /usr/sr
 c/debug/parted/3.6-r0/lib/quote.h /usr/src/debug/parted/3.6-r0/lib/dirname.h /usr/src/debug/parted/3.6-r0/lib/xstrtol.h /usr/src/debug/parted/3.6-r0/lib/localcharset.c /usr/src/debug/parted/3.6-r0/lib/localcharset.h /usr/src/debug/parted/3.6-r0/lib/c-strncasecmp.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_resize_clear.c /usr/src/debug/parted/3.6-r0/lib/argmatch.c /usr/src/debug/parted/3.6-r0/lib/argmatch.h /usr/src/debug/parted/3.6-r0/lib/xalloc.h /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray-skeleton.c /usr/src/debug/parted/3.6-r0/lib/version-etc.c /usr/src/debug/parted/3.6-r0/lib/version-etc.h"
packages/core2-32-poky-linux/parted/parted-src: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-src: PKGSIZE changed from 2461512 to 2480391 (+1%)
packages/core2-32-poky-linux/parted/parted-staticdev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-staticdev: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted: FILELIST: removed "/usr/lib/libparted-fs-resize.so.0.0.4 /usr/lib/libparted.so.2.0.4", added "/usr/lib/libparted-fs-resize.so.0.0.5 /usr/lib/libparted.so.2.0.5"
packages/core2-32-poky-linux/parted/parted: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted: PKGSIZE changed from 695234 to 699330 (+1%)
Changes to packages/core2-32-poky-linux/parted (sysroot):
  /usr/lib/libparted-fs-resize.so.0 changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted-fs-resize.so changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2 changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted.so changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted-fs-resize.so.0.0.4 moved to /usr/lib/libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2.0.4 moved to /usr/lib/libparted.so.2.0.5

--===============6933265284521416062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 102 recipes from the core2-32 sysroot...done.
Removing 112 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9211fd7189ccee0b5261551456fb5850ef77840d"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 334 Local 278 Mirrors 0 Missed 56 Current 175 (83% match, 88% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 176 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 177 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 192 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 194 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 215 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 252 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 571 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 591 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
NOTE: Running task 627 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 631 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 632 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 633 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 634 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 660 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 674 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 693 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 714 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_fetch)
NOTE: Running task 715 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 716 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 717 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 258 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running setscene task 260 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: Running task 808 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 809 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: Running task 810 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 811 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 812 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 813 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: Running task 814 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 815 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_unpack)
NOTE: Running task 816 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 817 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Started
NOTE: Running setscene task 261 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: Running task 818 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running setscene task 265 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 819 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: Running task 820 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_unpack)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: Running task 821 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 822 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 837 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 838 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 839 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe elfutils-0.188-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Started
NOTE: Running setscene task 277 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot_setscene)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 844 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: Running task 845 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 288 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 290 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_setscene)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 858 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: Running task 887 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: Running task 891 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: Running task 892 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 898 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 905 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 907 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 921 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 926 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 928 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 929 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: Running task 931 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_patch)
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3/3.11.2-r0/temp/log.do_packagedata_setscene.1271698
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 344 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Started
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 942 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 943 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: Running task 944 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 945 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot_setscene)
NOTE: Running task 966 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: Running task 975 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 980 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 368 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 4704bf8fb1780217b866cbd9f5da599e8f1de3980b8063726df5c4ea58154cb2
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: Running task 985 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: Running task 986 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 991 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1012 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1021 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 397 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 400 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1022 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1023 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 1028 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_setscene)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 405 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 418 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 444 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 449 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1400 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1418 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1428 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1520 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1553 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1555 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1593 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: Running task 1599 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1608 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1657 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1659 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1700 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1701 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1702 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: Running task 1703 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1705 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: Running task 1706 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1707 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1708 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: Running task 1709 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1712 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1714 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1715 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1716 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1717 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1718 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Succeeded
NOTE: Running task 1719 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1720 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: Running task 1722 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1723 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1724 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1725 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1726 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1727 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 1728 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1730 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1731 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 1732 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1733 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1734 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1735 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1736 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1738 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1739 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe iproute2-6.2.0-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1740 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe iproute2-6.2.0-r0: task do_install: Succeeded
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: Running task 1741 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_package)
NOTE: recipe iproute2-6.2.0-r0: task do_package: Started
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1743 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: Running task 1744 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1745 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1746 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe iproute2-6.2.0-r0: task do_package: Succeeded
NOTE: Running task 1747 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata)
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Running task 1748 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1749 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_compile)
NOTE: recipe socat-1.7.4.4-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Failed
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_compile: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 1749 tasks of which 1627 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata
Summary: There were 94 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.2.0-r0/temp/log.do_packagedata.1317743
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata) failed with exit code '1'

--===============6933265284521416062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9211fd7189ccee0b5261551456fb5850ef77840d"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 19 Mirrors 0 Missed 49 Current 504 (27% match, 91% complete)
Removing 2 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 506 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 521 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 522 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 523 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 524 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 974 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1176 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
NOTE: Running setscene task 570 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Started
NOTE: Running task 1404 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 1405 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1406 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1489 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 1490 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1592 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Succeeded
NOTE: Running task 1609 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1619 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: Running task 1620 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: Running task 1639 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: Running task 1689 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: Running task 1690 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1691 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: Running task 1692 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1703 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1711 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_fetch)
NOTE: Running task 1713 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1714 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_fetch)
NOTE: Running task 1715 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1791 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1833 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1834 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1852 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 1853 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1854 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 1855 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1856 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1857 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.1117462
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 571 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: Running task 1859 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1860 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 1861 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1862 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_unpack)
NOTE: Running task 1863 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1864 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_unpack)
NOTE: Running task 1865 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1866 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1867 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1871 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: Running task 1872 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 1873 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1875 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: Running task 1876 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1877 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1878 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1879 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1880 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1881 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 1882 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 4704bf8fb1780217b866cbd9f5da599e8f1de3980b8063726df5c4ea58154cb2
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1883 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1884 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1886 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1887 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1888 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1889 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1890 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: Running task 1891 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1892 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1893 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1895 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1896 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1897 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1899 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1900 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1901 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1940 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: Running task 1942 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1947 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1948 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1949 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1963 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: Running task 1964 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1965 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1966 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1967 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1968 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1969 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1970 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1971 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1972 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1974 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1975 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1976 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1977 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 1978 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1979 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1980 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1981 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1982 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1984 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1985 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 1986 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1987 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1988 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1989 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1990 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Succeeded
NOTE: Running task 1991 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1992 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Started
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1993 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_install)
NOTE: recipe iproute2-6.2.0-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1994 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_package)
NOTE: recipe iproute2-6.2.0-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_install)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1997 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Succeeded
NOTE: Running task 1998 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_package)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Started
NOTE: recipe iproute2-6.2.0-r0: task do_package: Succeeded
NOTE: Running task 1999 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata)
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Failed
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1999 tasks of which 1886 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata
Summary: There were 94 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/iproute2/6.2.0-r0/temp/log.do_packagedata.1145462
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata) failed with exit code '1'

--===============6933265284521416062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9211fd7189ccee0b5261551456fb5850ef77840d"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 17 Mirrors 0 Missed 49 Current 506 (25% match, 91% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 522 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 523 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 524 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 525 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 974 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1176 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 570 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1404 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 1405 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1406 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1506 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 1507 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1592 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 1608 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1637 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: Running task 1704 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1706 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_fetch)
NOTE: Running task 1707 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1708 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1726 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: Running task 1727 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1728 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1729 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1736 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1789 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: Running task 1790 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1791 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1828 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 1829 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: Running task 1852 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.2.0-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1854 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1855 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1856 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1857 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1859 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.659466
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 571 of 572 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: Running task 1860 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 1861 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1862 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 1863 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1864 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: Running task 1865 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_unpack)
NOTE: Running task 1866 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1867 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_unpack)
NOTE: Running task 1868 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1869 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Started
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1872 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1873 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 1874 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1875 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: Running task 1876 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1877 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1879 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1880 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1881 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1882 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 1883 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 4704bf8fb1780217b866cbd9f5da599e8f1de3980b8063726df5c4ea58154cb2
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1884 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1885 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1886 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1887 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1888 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1889 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1890 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1892 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1893 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1894 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1895 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe iproute2-6.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1896 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1897 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_compile)
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1899 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1900 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1939 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: Running task 1941 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1946 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1947 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1948 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1949 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1963 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: Running task 1964 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1965 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1966 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1967 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1968 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1969 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1970 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1972 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1974 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1975 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1976 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1977 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 1978 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1979 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1980 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1981 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1983 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1984 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1985 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 1986 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1987 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1988 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1989 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1990 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1991 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_install)
NOTE: Running task 1992 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe iproute2-6.2.0-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.2.0-r0: task do_install: Succeeded
NOTE: Running task 1993 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_package)
NOTE: recipe iproute2-6.2.0-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1994 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_install)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Succeeded
NOTE: Running task 1995 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1996 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1997 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Succeeded
NOTE: Running task 1998 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_package)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Started
NOTE: recipe iproute2-6.2.0-r0: task do_package: Succeeded
NOTE: Running task 1999 of 2046 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata)
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.2.0-r0: task do_packagedata: Failed
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1999 tasks of which 1886 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata
Summary: There were 94 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: iproute2-6.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/iproute2/6.2.0-r0/temp/log.do_packagedata.686803
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb:do_packagedata) failed with exit code '1'

--===============6933265284521416062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/parted: PACKAGES: added "parted-locale-ka"
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGSIZE changed from 65752 to 73773 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGSIZE changed from 69671 to 78082 (+12%)
packages/core2-32-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t0900-type-gpt.sh /usr/lib/parted/ptest/tests/t0910-type-dos.sh /usr/lib/parted/ptest/tests/t9024-msdos-1s-partition.sh /usr/lib/parted/ptest/tests/t9025-gpt-1s-partition.sh /usr/lib/parted/ptest/tests/t0901-type-gpt-invalid.sh /usr/lib/parted/ptest/tests/t0911-type-dos-invalid.sh"
packages/core2-32-poky-linux/parted/parted: FILELIST: removed "/usr/lib/libparted.so.2.0.4 /usr/lib/libparted-fs-resize.so.0.0.4", added "/usr/lib/libparted.so.2.0.5 /usr/lib/libparted-fs-resize.so.0.0.5"
Changes to packages/core2-32-poky-linux/parted (sysroot):
  /usr/lib/libparted-fs-resize.so.0 changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted-fs-resize.so changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2 changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted.so changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted-fs-resize.so.0.0.4 moved to /usr/lib/libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2.0.4 moved to /usr/lib/libparted.so.2.0.5

--===============6933265284521416062==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-parted-upgrade-3.5-3.6.patch"

RnJvbSAwN2EzZTI5YTllMGNmYjQ1YzE1ZGQ2MjcyN2Y1MzBiMTA5ZDlmNWI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxNDo0NDozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
cnRlZDogdXBncmFkZSAzLjUgLT4gMy42CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0
ZWQve3BhcnRlZF8zLjUuYmIgPT4gcGFydGVkXzMuNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvcGFydGVkL3twYXJ0ZWRfMy41LmJiID0+IHBhcnRlZF8zLjYuYmJ9ICg5NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhcnRlZC9wYXJ0ZWRfMy41LmJiIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3BhcnRlZC9wYXJ0ZWRfMy42LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhcnRlZC9wYXJ0ZWRfMy42LmJiCmlu
ZGV4IGVhMmI2OGJiZDguLjA1ZDU3NTA3ZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9wYXJ0ZWQvcGFydGVkXzMuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFy
dGVkL3BhcnRlZF8zLjYuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke0dOVV9NSVJS
T1J9L3BhcnRlZC9wYXJ0ZWQtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1w
dGVzdCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ5MzhkZDVjMWMx
MjVmNmM3OGIxZjRiM2UyOTc1MjZmMThlZTc0YWE0M2Q0NWMyNDg1NzhiMWQyNDcwYzA1YTIiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiM2I0M2RiZTMzY2NhMGY5YTE4NjAxZWJhYjU2Yjc4NTJiMTI4
ZWMxYTNkZjNhOWIzMGNjZGU1ZTczMzU5ZTYxMiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29u
ZmlnIGdldHRleHQgdGV4aW5mbyBwdGVzdAogCi0tIAoyLjM5LjIKCg==

--===============6933265284521416062==--

