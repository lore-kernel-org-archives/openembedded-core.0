Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08632C38A02
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.2324.1651434543048188996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=s6jDGYsH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180812b5807-7c2e93fc-1689-46b2-b407-ccf1e7a863cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=byG4xkWMpiq5AICz3DBhZQzg1dDkemwQfsuo/F70o3k=;
	b=s6jDGYsHzOKcRESP2VIVQdtj849W8iqE66b7RVbuXp2LP1+fGX0Pp2/BBL/fLBe1
	4a4hSf8lWBlt1/onjDT7J+E+FKHU4H0uVQ6ydqoymK/E5mKhpEP5kzqdK8N/SsE1UqS
	N4SEAlVbqiHrLLqy6LtsVBlUVSMWUKhblD7TeCvk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=byG4xkWMpiq5AICz3DBhZQzg1dDkemwQfsuo/F70o3k=;
	b=kEsq8US9+ipdt4O+n9BWz5ngqgnEi/hRh96rsVz4MJEekvZhL/6bdUwJCuhD0lEo
	TSu+pXjIdv5eGsjdDKoftZZHVIQNYemy6MTs/dnN5CqjpSj7oNpit+aK5i7c4QAjrEg
	H7PUZb7RPsakdHw0UhMwyhGiXWNQrSD3hPwNUNqo=
Content-Type: multipart/mixed; boundary="===============4176706840230444403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] parted: upgrading to 3.5 SUCCEEDED
Message-ID: 
 <01010180812b5807-7c2e93fc-1689-46b2-b407-ccf1e7a863cf-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165118

--===============4176706840230444403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *parted* to *3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-parted-upgrade-3.4-3.5.patch
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
--===============4176706840230444403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 32 recipes from the core2-32 sysroot...done.
Removing 92 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 337 Local 258 Mirrors 0 Missed 79 Current 172 (76% match, 84% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 189 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 202 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 209 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 593 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_fetch)
NOTE: Running task 668 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_fetch)
NOTE: Running task 677 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_fetch)
NOTE: Running task 680 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
NOTE: Running task 699 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 703 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_fetch)
NOTE: Running task 704 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 719 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 733 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_fetch)
NOTE: Running task 734 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_fetch)
NOTE: Running task 735 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 742 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: Running task 744 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 750 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 751 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_fetch)
NOTE: Running task 752 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 753 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 754 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_fetch)
NOTE: Running task 755 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.186-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe diffutils-3.8-r0: task do_fetch: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 801 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 802 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.5-r0: task do_fetch: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.8-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Started
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running task 803 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 804 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe iproute2-5.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 805 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 806 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_unpack)
NOTE: Running task 807 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_unpack)
NOTE: Running task 808 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 809 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 810 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 811 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 812 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_unpack)
NOTE: recipe parted-3.5-r0: task do_fetch: Succeeded
NOTE: Running task 813 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_unpack)
NOTE: Running task 814 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: Running task 815 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_fetch: Started
NOTE: Running task 816 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_unpack)
NOTE: Running task 817 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.3-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_unpack: Started
NOTE: Running task 818 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 819 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_unpack)
NOTE: Running task 820 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe eudev-3.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 271 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe diffutils-3.8-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 272 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 275 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 825 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: Running setscene task 279 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 826 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 827 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe parted-3.5-r0: task do_unpack: Started
NOTE: Running task 828 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: Running setscene task 286 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot_setscene)
NOTE: Running task 829 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 834 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 835 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_patch)
NOTE: Running setscene task 295 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.5-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running setscene task 314 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running task 841 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_patch)
NOTE: Running task 842 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: Running task 852 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_patch)
NOTE: Running task 853 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 858 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: Running task 874 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_patch)
NOTE: Running task 875 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 876 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 883 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: Running task 886 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 890 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe btrfs-tools-5.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 892 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_patch)
NOTE: Running task 893 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: Running task 894 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 895 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_patch)
NOTE: Running task 897 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 901 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 903 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 333 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_setscene)
NOTE: recipe diffutils-3.8-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Started
NOTE: recipe parted-3.5-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running setscene task 335 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_unpack: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running task 912 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 913 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_patch)
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Started
NOTE: Running setscene task 344 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 351 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe parted-3.5-r0: task do_patch: Succeeded
NOTE: Running task 932 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gnutls-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 364 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 933 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 938 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 374 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.8-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 943 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 947 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 949 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 950 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 951 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 378 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 952 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 953 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 954 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 382 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 963 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 968 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.5-r0: task do_populate_lic: Started
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 969 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 386 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 389 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 990 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_patch: Succeeded
NOTE: Running task 995 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1000 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 405 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic unihash changed to bd73c8534d8fd6ee973c4b21c5c465c7a1cce9b624e3aa637ff7ba69a085348d
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.7.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-5.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1013 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1014 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-4.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 412 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1023 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: Running setscene task 413 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_setscene)
NOTE: Running task 1024 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 414 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_package_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1033 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 415 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1054 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe util-linux-2.37.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 433 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 438 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 701b84400be6a894e12bc5efd8b8edbe811b8cdb6d9a3630f443403b418837a4
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 462 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1087 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.34.1-r0: task do_fetch: Started
NOTE: recipe perl-5.34.1-r0: task do_fetch: Succeeded
NOTE: Running task 1100 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.1-r0: task do_unpack: Succeeded
NOTE: Running task 1107 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 489 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.34.1-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.3.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.34.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_unpack: Succeeded
NOTE: Running task 1131 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1132 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_checkout: Started
NOTE: recipe gcc-cross-i686-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1319 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1389 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1396 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1397 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1504 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1506 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.34.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1585 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1592 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1593 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1607 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1640 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1641 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1642 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1664 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe diffutils-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.34.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1665 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.34.1-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1666 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1667 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1668 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure)
NOTE: Running task 1669 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.8.bb:do_configure)
NOTE: Running task 1670 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1671 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_configure)
NOTE: Running task 1672 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: Running task 1673 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1674 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 1675 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1676 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe diffutils-3.8-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Started
NOTE: recipe parted-3.5-r0: task do_configure: Started
NOTE: Running task 1677 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: Running task 1678 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: Running task 1679 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_configure: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1680 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1683 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1684 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1685 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 1686 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_validate_branches)
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_validate_branches: Started
NOTE: recipe socat-1.7.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1687 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.3.bb:do_configure)
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_validate_branches: Succeeded
NOTE: Running task 1688 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_metadata: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1689 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1690 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: Running task 1691 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 1692 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_patch)
NOTE: Running task 1693 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_patch: Succeeded
NOTE: Running task 1694 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1695 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configme)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1696 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configme: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: Running task 1697 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1699 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1700 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1702 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1703 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1704 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1705 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1706 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe libmnl-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1707 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1708 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 1709 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1710 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_install)
NOTE: recipe libmnl-1.0.4-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1711 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe iptables-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1712 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_compile)
NOTE: recipe libmnl-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1713 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot)
NOTE: Running task 1714 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package)
NOTE: recipe iptables-1.8.7-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1715 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure: Succeeded
NOTE: Running task 1716 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1717 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_compile)
NOTE: recipe libmnl-1.0.4-r0: task do_package: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Started
NOTE: Running task 1718 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 1719 of 1818 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Failed
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_compile: Succeeded
NOTE: recipe socat-1.7.4.3-r0: task do_configure: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_configure: Succeeded
NOTE: recipe e2fsprogs-1.46.5-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.15.32+gitAUTOINC+63e25b5717_c9f3902d80-r0: task do_kernel_configme: Succeeded
NOTE: recipe diffutils-3.8-r0: task do_configure: Succeeded
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: recipe parted-3.5-r0: task do_configure: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1719 tasks of which 1554 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libmnl-1.0.4-r0 do_packagedata: QA Issue: Package version for package libmnl-src went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata: QA Issue: Package version for package libmnl-dbg went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata: QA Issue: Package version for package libmnl-staticdev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata: QA Issue: Package version for package libmnl-dev went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata: QA Issue: Package version for package libmnl-doc went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata: QA Issue: Package version for package libmnl-locale went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata: QA Issue: Package version for package libmnl went backwards which would break package feeds (from 0:1.0.5-r0 to 0:1.0.4-r0) [version-going-backwards]
ERROR: libmnl-1.0.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libmnl/1.0.4-r0/temp/log.do_packagedata.554070
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata) failed with exit code '1'

--===============4176706840230444403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/parted/parted-locale-es: PKGSIZE changed from 24704 to 73981 (+199%)
packages/core2-32-poky-linux/parted/parted-locale-id: PKGSIZE changed from 58581 to 71674 (+22%)
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGSIZE changed from 9928 to 76252 (+668%)
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGSIZE changed from 64761 to 72383 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGSIZE changed from 60782 to 67719 (+11%)
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGSIZE changed from 61643 to 68482 (+11%)
packages/core2-32-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t3210-gpt-type-change.sh /usr/lib/parted/ptest/tests/t0801-json-msdos.sh /usr/lib/parted/ptest/tests/t0215-gpt-attrs.sh /usr/lib/parted/ptest/tests/t0800-json-gpt.sh /usr/lib/parted/ptest/tests/t9060-gpt-grow-script-fix.sh /usr/lib/parted/ptest/tests/t0290-gpt-name.sh /usr/lib/parted/ptest/tests/gpt-attrs"
packages/core2-32-poky-linux/parted/parted: FILELIST: removed "/usr/lib/libparted.so.2.0.3 /usr/lib/libparted-fs-resize.so.0.0.3", added "/usr/lib/libparted.so.2.0.4 /usr/lib/libparted-fs-resize.so.0.0.4"
Changes to packages/core2-32-poky-linux/parted (sysroot):
  /usr/lib/libparted-fs-resize.so.0 changed symlink target from libparted-fs-resize.so.0.0.3 to libparted-fs-resize.so.0.0.4
  /usr/lib/libparted-fs-resize.so changed symlink target from libparted-fs-resize.so.0.0.3 to libparted-fs-resize.so.0.0.4
  /usr/lib/libparted.so.2 changed symlink target from libparted.so.2.0.3 to libparted.so.2.0.4
  /usr/lib/libparted.so changed symlink target from libparted.so.2.0.3 to libparted.so.2.0.4
  /usr/lib/libparted-fs-resize.so.0.0.3 moved to /usr/lib/libparted-fs-resize.so.0.0.4
  /usr/lib/libparted.so.2.0.3 moved to /usr/lib/libparted.so.2.0.4

--===============4176706840230444403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 17 Mirrors 0 Missed 32 Current 528 (34% match, 94% complete)
Removing 4 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 5 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 547 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1155 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_fetch)
NOTE: Running task 1171 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.4072802
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: recipe parted-3.5-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1325 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_unpack)
NOTE: Running task 1326 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: Running task 1339 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1348 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1373 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1532 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1628 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_populate_sysroot)
NOTE: Running task 1631 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: recipe parted-3.5-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 1868 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1954 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: Running task 1955 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: recipe parted-3.5-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1956 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_patch)
NOTE: Running task 1957 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 1958 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 1959 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1960 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm)
NOTE: Running task 1962 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe parted-3.5-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1967 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: Running task 1968 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: recipe parted-3.5-r0: task do_patch: Succeeded
NOTE: Running task 1969 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1970 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1971 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic)
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1985 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1987 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.5-r0: task do_populate_lic: Started
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1988 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1989 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe parted-3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic unihash changed to bd73c8534d8fd6ee973c4b21c5c465c7a1cce9b624e3aa637ff7ba69a085348d
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1990 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure)
NOTE: Running task 1991 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1992 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_configure: Started
NOTE: recipe parted-3.5-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 22db8996b954ad500e98bde8eb5d8f3f9ee45325e3d6ebc87a67531882ff9085
NOTE: Running task 2000 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2001 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2002 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2003 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2004 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 221777e03b432750d81a3353ee12bea75da31230352399fa97384f965b4130c2
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2008 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2010 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2011 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2013 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2015 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2017 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 2018 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2019 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2022 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2024 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2025 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2026 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2027 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2028 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2029 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2030 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2034 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile)
NOTE: recipe gawk-5.1.1-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2035 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2036 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: Running task 2037 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2038 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2039 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install)
NOTE: recipe gawk-5.1.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm unihash changed to 9d91d4972c91b92d9c83391de8deedf3bc6957a1226f89c9d9ae7f0b40cb0ca6
NOTE: recipe gawk-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2041 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe parted-3.5-r0: task do_configure: Succeeded
NOTE: Running task 2042 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure_ptest_base)
NOTE: recipe parted-3.5-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2043 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_compile)
NOTE: recipe parted-3.5-r0: task do_compile: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm unihash changed to 010150eb0c33fa24324317959b2b41f3df241aa5c44ad928325bcdabc30c0a40
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2045 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: Running task 2046 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.5-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.5-r0: task do_compile_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_install)
NOTE: recipe parted-3.5-r0: task do_install: Started
NOTE: recipe parted-3.5-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_install_ptest_base)
NOTE: recipe parted-3.5-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2050 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package)
NOTE: Running task 2051 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_sysroot)
NOTE: recipe parted-3.5-r0: task do_package: Started
NOTE: recipe parted-3.5-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe parted-3.5-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_packagedata)
NOTE: recipe parted-3.5-r0: task do_packagedata: Started
NOTE: recipe parted-3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package_write_rpm)
NOTE: Running task 2054 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package_qa)
NOTE: recipe parted-3.5-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.5-r0: task do_package_qa: Started
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.5-r0: task do_package_qa: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2055 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2055 tasks of which 1971 didn't need to be rerun and all succeeded.
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

--===============4176706840230444403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-parted-upgrade-3.4-3.5.patch"

From c8eebc7d40d2911f24e967cc28e97dcbcdd16982 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 11:18:19 +0000
Subject: [PATCH] parted: upgrade 3.4 -> 3.5

---
 .../parted/files/check-vfat.patch             | 51 -------------------
 .../parted/{parted_3.4.bb => parted_3.5.bb}   |  4 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta/recipes-extended/parted/files/check-vfat.patch
 rename meta/recipes-extended/parted/{parted_3.4.bb => parted_3.5.bb} (92%)

diff --git a/meta/recipes-extended/parted/files/check-vfat.patch b/meta/recipes-extended/parted/files/check-vfat.patch
deleted file mode 100644
index fad50292d9..0000000000
--- a/meta/recipes-extended/parted/files/check-vfat.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Add checks for both mkfs.vfat and the vfat file system in the kernel before
-running tests.
-
-Upstream-Status: Submitted [https://alioth-lists.debian.net/pipermail/parted-devel/2021-August/005653.html]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/tests/t-lib-helpers.sh b/tests/t-lib-helpers.sh
-index 4c6c75f..2cc7577 100644
---- a/tests/t-lib-helpers.sh
-+++ b/tests/t-lib-helpers.sh
-@@ -418,3 +418,13 @@ require_64bit_()
-           ;;
-   esac
- }
-+
-+# Check if the specified filesystem is either built into the kernel, or can be loaded
-+# as a module
-+# Usage: has_filesystem vfat
-+# Ruturns 0 if the filesystem is available, otherwise skips the test
-+require_filesystem_()
-+{
-+  grep -q $1 /proc/filesystems && return 0
-+  modprobe --quiet --dry-run $1 || skip_ "this test requires kernel support for $1"
-+}
-diff --git a/tests/t1100-busy-label.sh b/tests/t1100-busy-label.sh
-index f1a13df..0f47b08 100755
---- a/tests/t1100-busy-label.sh
-+++ b/tests/t1100-busy-label.sh
-@@ -19,6 +19,9 @@
- . "${srcdir=.}/init.sh"; path_prepend_ ../parted
- require_root_
- require_scsi_debug_module_
-+require_fat_
-+require_filesystem_ vfat
-+
- ss=$sector_size_
- 
- scsi_debug_setup_ sector_size=$ss dev_size_mb=90 > dev-name ||
-diff --git a/tests/t1101-busy-partition.sh b/tests/t1101-busy-partition.sh
-index e35e6f0..c813848 100755
---- a/tests/t1101-busy-partition.sh
-+++ b/tests/t1101-busy-partition.sh
-@@ -22,6 +22,8 @@ test "$VERBOSE" = yes && parted --version
- 
- require_root_
- require_scsi_debug_module_
-+require_fat_
-+require_filesystem_ vfat
- 
- # create memory-backed device
- scsi_debug_setup_ dev_size_mb=80 > dev-name ||
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.5.bb
similarity index 92%
rename from meta/recipes-extended/parted/parted_3.4.bb
rename to meta/recipes-extended/parted/parted_3.5.bb
index d83b002f82..ea2b68bbd8 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.5.bb
@@ -9,11 +9,9 @@ DEPENDS = "ncurses util-linux virtual/libiconv"
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://run-ptest \
-           file://check-vfat.patch \
            "
 
-SRC_URI[md5sum] = "357d19387c6e7bc4a8a90fe2d015fe80"
-SRC_URI[sha256sum] = "e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342"
+SRC_URI[sha256sum] = "4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-- 
2.27.0


--===============4176706840230444403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/parted: SRC_URI changed from "https://ftp.gnu.org/gnu/parted/parted-3.4.tar.xz file://fix-doc-mandir.patch file://run-ptest file://check-vfat.patch" to "https://ftp.gnu.org/gnu/parted/parted-3.5.tar.xz file://fix-doc-mandir.patch file://run-ptest"
packages/core2-32-poky-linux/parted: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-dbg: FILELIST: removed "/usr/lib/.debug/libparted.so.2.0.3 /usr/lib/.debug/libparted-fs-resize.so.0.0.3", added "/usr/lib/.debug/libparted-fs-resize.so.0.0.4 /usr/lib/.debug/libparted.so.2.0.4"
packages/core2-32-poky-linux/parted/parted-dbg: PKGSIZE changed from 1575720 to 1642236 (+4%)
packages/core2-32-poky-linux/parted/parted-dbg: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-dbg: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-dev: PKGSIZE changed from 50896 to 51119 (+0%)
packages/core2-32-poky-linux/parted/parted-dev: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-dev: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-doc: PKGSIZE changed from 71000 to 74823 (+5%)
packages/core2-32-poky-linux/parted/parted-doc: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-doc: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-ca: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-ca: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-cs: PKGSIZE changed from 54439 to 53937 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-cs: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-cs: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-da: PKGSIZE changed from 47131 to 46440 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-da: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-da: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-de: PKGSIZE changed from 74227 to 75120 (+1%)
packages/core2-32-poky-linux/parted/parted-locale-de: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-de: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-es: PKGSIZE changed from 24704 to 73981 (+199%)
packages/core2-32-poky-linux/parted/parted-locale-es: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-es: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-fr: PKGSIZE changed from 69405 to 71697 (+3%)
packages/core2-32-poky-linux/parted/parted-locale-fr: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-fr: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGSIZE changed from 66432 to 65752 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-fur: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-gl: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-gl: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-hu: PKGSIZE changed from 65215 to 64534 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-hu: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-hu: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-id: PKGSIZE changed from 58581 to 71674 (+22%)
packages/core2-32-poky-linux/parted/parted-locale-id: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-id: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-it: PKGSIZE changed from 65990 to 65306 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-it: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-it: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-ja: PKGSIZE changed from 82246 to 82969 (+1%)
packages/core2-32-poky-linux/parted/parted-locale-ja: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-ja: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-ko: PKGSIZE changed from 76463 to 77412 (+1%)
packages/core2-32-poky-linux/parted/parted-locale-ko: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-ko: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-nl: PKGSIZE changed from 69102 to 70310 (+2%)
packages/core2-32-poky-linux/parted/parted-locale-nl: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-nl: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-nn: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-nn: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-pl: PKGSIZE changed from 73098 to 73932 (+1%)
packages/core2-32-poky-linux/parted/parted-locale-pl: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-pl: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PKGSIZE changed from 66787 to 72810 (+9%)
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-pt: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-pt: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGSIZE changed from 9928 to 76252 (+668%)
packages/core2-32-poky-linux/parted/parted-locale-ro: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-ru: PKGSIZE changed from 91671 to 90800 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-ru: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-ru: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-rw: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-rw: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-sk: PKGSIZE changed from 62962 to 62607 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-sk: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-sk: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-sl: PKGSIZE changed from 59180 to 58539 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-sl: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-sl: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-sr: PKGSIZE changed from 83363 to 90984 (+9%)
packages/core2-32-poky-linux/parted/parted-locale-sr: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-sr: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGSIZE changed from 64761 to 72383 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-sv: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-tr: PKGSIZE changed from 65118 to 64803 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-tr: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-tr: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-uk: PKGSIZE changed from 92577 to 93872 (+1%)
packages/core2-32-poky-linux/parted/parted-locale-uk: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-uk: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGSIZE changed from 70085 to 69671 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-vi: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGSIZE changed from 60782 to 67719 (+11%)
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGSIZE changed from 61643 to 68482 (+11%)
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t9060-gpt-grow-script-fix.sh /usr/lib/parted/ptest/tests/gpt-attrs /usr/lib/parted/ptest/tests/t0801-json-msdos.sh /usr/lib/parted/ptest/tests/t0215-gpt-attrs.sh /usr/lib/parted/ptest/tests/t3210-gpt-type-change.sh /usr/lib/parted/ptest/tests/t0800-json-gpt.sh /usr/lib/parted/ptest/tests/t0290-gpt-name.sh"
packages/core2-32-poky-linux/parted/parted-ptest: PKGSIZE changed from 544288 to 581695 (+7%)
packages/core2-32-poky-linux/parted/parted-ptest: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-ptest: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-src: FILELIST: directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/ntfs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/ntfs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/r -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/r, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/include/parted -> /usr/src/debug/parted/3.5-r0/parted-3.5/include/parted, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/arch -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/arch, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/reiserfs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/reiserfs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/r/fat -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/r/fat, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/amiga -> /usr/src/debug/parted/3.5-r0/parted-3.5/
 libparted/fs/amiga, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/jfs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/jfs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/cs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/cs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/f2fs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/f2fs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/partprobe -> /usr/src/debug/parted/3.5-r0/parted-3.5/partprobe, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/linux_swap -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/linux_swap, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/nilfs2 -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/nilfs2, directory renamed /usr/src/debug/parted
 /3.4-r0/parted-3.4/libparted/fs/fat -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/fat, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/ufs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/ufs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/labels -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/labels, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/ext2 -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/ext2, directory renamed /usr/src/debug/parted/3.4-r0/build/parted -> /usr/src/debug/parted/3.5-r0/build/parted, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/btrfs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/btrfs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/tests -> /usr/src/debug/parted/3.5-r0/parted-3.5/tests, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/r/hfs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/
 fs/r/hfs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/udf -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/udf, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/xfs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/xfs, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/lib/glthread -> /usr/src/debug/parted/3.5-r0/parted-3.5/lib/glthread, directory renamed /usr/src/debug/parted/3.4-r0/parted-3.4/libparted/fs/hfs -> /usr/src/debug/parted/3.5-r0/parted-3.5/libparted/fs/hfs, removed "/usr/src/debug/parted/3.4-r0/parted-3.4/lib/mbrtowc.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/fcntl.c /usr/src/debug/parted/3.4-r0/parted-3.4/parted/table.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/localcharset.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/getopt-core.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/regex.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/quotearg.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/strerror.c /u
 sr/src/debug/parted/3.4-r0/parted-3.4/lib/c-strcaseeq.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/hard-locale.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/long-options.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/basename.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/c-strcase.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/quote.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/xalloc-oversized.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/stat-time.h /usr/src/debug/parted/3.4-r0/parted-3.4/parted/parted.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/xstrndup.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/getopt_int.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/exitfail.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/progname.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/error.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/xstrndup.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/dirname.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/c-strncasecmp.c /usr/src/debug/parted/3.4-r0/parted-3.4/par
 ted/ui.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/xstrtol.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/c-strcasecmp.c /usr/src/debug/parted/3.4-r0/parted-3.4/parted/ui.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/xstrtol.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/quotearg.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/basename-lgpl.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/close-stream.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/exitfail.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/regexec.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/stripslash.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/sys-limits.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/version-etc.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/version-etc.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/localcharset.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/argmatch.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/getopt1.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/c-ctype.h /usr/src/debug/parted/3.4-r0/parte
 d-3.4/lib/safe-read.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/setlocale_null.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/close-stream.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/tempname.c /usr/src/debug/parted/3.4-r0/parted-3.4/parted/command.h /usr/src/debug/parted/3.4-r0/build/lib/fcntl.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/cloexec.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/regcomp.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/hard-locale.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/getopt.c /usr/src/debug/parted/3.4-r0/parted-3.4/parted/table.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/setlocale_null.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/getopt-ext.h /usr/src/debug/parted/3.4-r0/build/lib/wchar.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/regex_internal.h /usr/src/debug/parted/3.4-r0/parted-3.4/parted/command.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/version-etc-fsf.c /usr/src/debug/parted/3.4-r0/build/lib/string.h /usr/src/debug/parted/3.4-r0/
 parted-3.4/lib/malloca.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/xalloc.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/dirname-lgpl.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/malloca.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/closeout.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/argmatch.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/xalloc-die.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/xmalloc.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/basename-lgpl.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/closeout.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/progname.c /usr/src/debug/parted/3.4-r0/parted-3.4/parted/strlist.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/getprogname.c /usr/src/debug/parted/3.4-r0/parted-3.4/parted/strlist.h /usr/src/debug/parted/3.4-r0/parted-3.4/lib/regex_internal.c /usr/src/debug/parted/3.4-r0/parted-3.4/lib/dirname.h", added "/usr/src/debug/parted/3.5-r0/parted-3.5/lib/ialloc.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/regex_internal.c /usr/
 src/debug/parted/3.5-r0/parted-3.5/lib/malloc/dynarray_emplace_enlarge.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/mbrtowc.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/regex_internal.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/xalloc-die.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/version-etc.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloca.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/idx.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/fcntl.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/getopt.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/argmatch.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/c-strncasecmp.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/getopt1.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/c-strcase.h /usr/src/debug/parted/3.5-r0/parted-3.5/parted/table.c /usr/src/debug/parted/3.5-r0/build/lib/string.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/xstrtol.h /usr/src/debug/parted/3.5-r0/build/lib/wchar.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/basename-lgp
 l.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/scratch_buffer_grow_preserve.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/cloexec.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/dynarray_at_failure.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/quotearg.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/localcharset.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/quote.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/getprogname.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/safe-read.c /usr/src/debug/parted/3.5-r0/build/lib/fcntl.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/xstrtol.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/scratch_buffer_set_array_size.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/basename-lgpl.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/scratch_buffer_grow.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/basename.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/stripslash.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/long-options.c /usr/src/debug/p
 arted/3.5-r0/parted-3.5/parted/jsonwrt.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/getopt-core.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/error.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/strtol.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/exitfail.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/dynarray.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/dynarray-skeleton.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/progname.c /usr/src/debug/parted/3.5-r0/parted-3.5/parted/ui.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/closeout.c /usr/src/debug/parted/3.5-r0/build/lib/stdlib.h /usr/src/debug/parted/3.5-r0/parted-3.5/parted/jsonwrt.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/hard-locale.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/version-etc-fsf.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/dynarray_resize_clear.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/stat-time.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/argmatch.c /usr/src/debug/parted/3.5-r0/par
 ted-3.5/parted/table.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/dirname.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/quotearg.c /usr/src/debug/parted/3.5-r0/parted-3.5/parted/command.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/tempname.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/regcomp.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloca.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/c-strcasecmp.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/version-etc.h /usr/src/debug/parted/3.5-r0/parted-3.5/parted/command.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/close-stream.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/dynarray_resize.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/progname.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/dynarray_finalize.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/close-stream.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/malloc/scratch_buffer_dupfree.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/setlocale_null.c /usr/src/debug/parted
 /3.5-r0/parted-3.5/lib/sys-limits.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/exitfail.h /usr/src/debug/parted/3.5-r0/parted-3.5/parted/ui.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/dirname.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/setlocale_null.h /usr/src/debug/parted/3.5-r0/parted-3.5/parted/strlist.h /usr/src/debug/parted/3.5-r0/parted-3.5/parted/strlist.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/xmalloc.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/hard-locale.c /usr/src/debug/parted/3.5-r0/parted-3.5/parted/parted.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/strerror.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/regex.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/closeout.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/localcharset.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/regexec.c /usr/src/debug/parted/3.5-r0/parted-3.5/lib/c-ctype.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/c-strcaseeq.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/xalloc.h /usr/src/debug/pa
 rted/3.5-r0/parted-3.5/lib/getopt_int.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/getopt-ext.h /usr/src/debug/parted/3.5-r0/build/lib/malloc/scratch_buffer.gl.h /usr/src/debug/parted/3.5-r0/parted-3.5/lib/dirname-lgpl.c"
packages/core2-32-poky-linux/parted/parted-src: PKGSIZE changed from 2310786 to 2460709 (+6%)
packages/core2-32-poky-linux/parted/parted-src: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-src: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted-staticdev: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted-staticdev: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/parted/parted: FILELIST: removed "/usr/lib/libparted-fs-resize.so.0.0.3 /usr/lib/libparted.so.2.0.3", added "/usr/lib/libparted-fs-resize.so.0.0.4 /usr/lib/libparted.so.2.0.4"
packages/core2-32-poky-linux/parted/parted: PKGSIZE changed from 699310 to 707522 (+1%)
packages/core2-32-poky-linux/parted/parted: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/parted/parted: PKGV changed from 3.4 [default] to 3.5 [default]
Changes to packages/core2-32-poky-linux/parted (sysroot):
  /usr/lib/libparted-fs-resize.so.0 changed symlink target from libparted-fs-resize.so.0.0.3 to libparted-fs-resize.so.0.0.4
  /usr/lib/libparted-fs-resize.so changed symlink target from libparted-fs-resize.so.0.0.3 to libparted-fs-resize.so.0.0.4
  /usr/lib/libparted.so.2 changed symlink target from libparted.so.2.0.3 to libparted.so.2.0.4
  /usr/lib/libparted.so changed symlink target from libparted.so.2.0.3 to libparted.so.2.0.4
  /usr/lib/libparted-fs-resize.so.0.0.3 moved to /usr/lib/libparted-fs-resize.so.0.0.4
  /usr/lib/libparted.so.2.0.3 moved to /usr/lib/libparted.so.2.0.4

--===============4176706840230444403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 17 Mirrors 0 Missed 32 Current 528 (34% match, 94% complete)
Removing 4 stale sstate objects for arch mips32r2...done.
Removing 5 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 547 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1153 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_fetch)
NOTE: Running task 1169 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.84373
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: recipe parted-3.5-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: recipe parted-3.5-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1215 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_unpack)
NOTE: Running task 1241 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: Running task 1338 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1347 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1371 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.5-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: Running task 1532 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1628 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_populate_sysroot)
NOTE: Running task 1631 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 1846 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1954 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1955 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe parted-3.5-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1956 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_patch)
NOTE: Running task 1957 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 1958 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 1959 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1960 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: Running task 1964 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe parted-3.5-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1967 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: Running task 1968 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1969 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.5-r0: task do_patch: Succeeded
NOTE: Running task 1970 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1971 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic)
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1985 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe parted-3.5-r0: task do_populate_lic: Started
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1987 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1988 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1989 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic unihash changed to bd73c8534d8fd6ee973c4b21c5c465c7a1cce9b624e3aa637ff7ba69a085348d
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1990 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1991 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_configure: Started
NOTE: Running task 1994 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe parted-3.5-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to adc99ef3803769c431eb1fe143d0d4d2272069a430faf47bb88e42d021c57eca
NOTE: Running task 2000 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2001 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2002 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2003 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2004 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4f672850dad29842ce5ccb8318ecf7cb5c099e33eefd97dfd516e6119a48cb96
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2008 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2010 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: Running task 2011 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2013 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2015 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2017 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 2018 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2019 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2022 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2024 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2025 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2026 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2027 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: Running task 2028 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2029 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2030 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2034 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile)
NOTE: recipe gawk-5.1.1-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2035 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2036 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: Running task 2037 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2038 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm unihash changed to 2b4a913970d6050d97ec667b6012e400f76b3951265b75ccbf791576b069ef8a
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2039 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install)
NOTE: recipe gawk-5.1.1-r0: task do_install: Started
NOTE: recipe gawk-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_configure: Succeeded
NOTE: Running task 2041 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure_ptest_base)
NOTE: recipe parted-3.5-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2042 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_compile)
NOTE: recipe parted-3.5-r0: task do_compile: Started
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2043 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm unihash changed to 2c5b1d52206ddb7183a62e483e16ef9d8a0b62ad02916828be4593741e17d234
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2045 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: Running task 2046 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.5-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_compile_ptest_base)
NOTE: recipe parted-3.5-r0: task do_compile_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_install)
NOTE: recipe parted-3.5-r0: task do_install: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.5-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_install_ptest_base)
NOTE: recipe parted-3.5-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2050 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package)
NOTE: Running task 2051 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_sysroot)
NOTE: recipe parted-3.5-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.5-r0: task do_package: Started
NOTE: recipe parted-3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe parted-3.5-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_packagedata)
NOTE: recipe parted-3.5-r0: task do_packagedata: Started
NOTE: recipe parted-3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package_write_rpm)
NOTE: Running task 2054 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package_qa)
NOTE: recipe parted-3.5-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.5-r0: task do_package_qa: Started
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.5-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2055 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2055 tasks of which 1971 didn't need to be rerun and all succeeded.
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

--===============4176706840230444403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 17 Mirrors 0 Missed 32 Current 528 (34% match, 94% complete)
Removing 5 stale sstate objects for arch qemuppc...done.
Removing 4 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 547 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.289872
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: Running task 1155 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_fetch)
NOTE: Running task 1171 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
NOTE: Running task 1345 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe parted-3.5-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: Running task 1528 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe parted-3.5-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1624 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_populate_sysroot)
NOTE: Running task 1627 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 1645 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_unpack)
NOTE: Running task 1646 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: Running task 1647 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1648 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 1756 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: Running task 1954 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.5-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: Running task 1955 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1956 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_patch)
NOTE: Running task 1957 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1958 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 1959 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1960 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm)
NOTE: Running task 1963 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe parted-3.5-r0: task do_patch: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1967 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: Running task 1968 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.5-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1969 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1970 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic)
NOTE: Running task 1971 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1985 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe parted-3.5-r0: task do_populate_lic: Started
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1987 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1988 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1989 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe parted-3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic unihash changed to bd73c8534d8fd6ee973c4b21c5c465c7a1cce9b624e3aa637ff7ba69a085348d
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1990 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure)
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1991 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe parted-3.5-r0: task do_configure: Started
NOTE: Running task 1994 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe gawk-5.1.1-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cb21232c5a28826a835c7b82a0929a680de568bfa22b4e8f2902c7990c647f3e
NOTE: Running task 2000 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2001 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2002 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2003 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2004 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 383898a484d5745ad8dfc12903788320e353f730bca51d01c97a5e5c0c4bdc03
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2008 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2010 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2013 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2015 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2017 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 2018 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2019 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2022 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2024 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2025 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2026 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2027 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: Running task 2028 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2029 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2030 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2034 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile)
NOTE: recipe gawk-5.1.1-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2035 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2036 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: Running task 2037 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2038 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2039 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install)
NOTE: recipe gawk-5.1.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm unihash changed to 564e1844acd9dc4c2b2c8bec0d53ffb5fead4c383d99ff50d2b9f0be0a4b7e1e
NOTE: recipe gawk-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2041 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe parted-3.5-r0: task do_configure: Succeeded
NOTE: Running task 2042 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure_ptest_base)
NOTE: recipe parted-3.5-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2043 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_compile)
NOTE: recipe parted-3.5-r0: task do_compile: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm unihash changed to 1a0246eb76f5399a7bb6dae655123fbf7180c83db82c4e1f7cb88380cf5d19e7
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2045 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: Running task 2046 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.5-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_compile_ptest_base)
NOTE: recipe parted-3.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_install)
NOTE: recipe parted-3.5-r0: task do_install: Started
NOTE: recipe parted-3.5-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_install_ptest_base)
NOTE: recipe parted-3.5-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2050 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package)
NOTE: Running task 2051 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_sysroot)
NOTE: recipe parted-3.5-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.5-r0: task do_package: Started
NOTE: recipe parted-3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe parted-3.5-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_packagedata)
NOTE: recipe parted-3.5-r0: task do_packagedata: Started
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package_write_rpm)
NOTE: Running task 2054 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package_qa)
NOTE: recipe parted-3.5-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.5-r0: task do_package_qa: Started
NOTE: recipe parted-3.5-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2055 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2055 tasks of which 1971 didn't need to be rerun and all succeeded.
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

--===============4176706840230444403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1644 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 17 Mirrors 0 Missed 32 Current 528 (34% match, 94% complete)
Removing 5 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 547 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libmnl/1.0.4-r0/temp/log.do_packagedata_setscene.3867606
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 577 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_setscene)
NOTE: Running task 1155 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_fetch)
NOTE: Running task 1171 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
NOTE: Running task 1345 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe parted-3.5-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: Running task 1528 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1624 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_populate_sysroot)
NOTE: recipe parted-3.5-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1627 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 1657 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_unpack)
NOTE: Running task 1658 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: Running task 1659 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1660 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: Running task 1805 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: Running task 1954 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: recipe parted-3.5-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: Running task 1955 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1956 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_patch)
NOTE: recipe parted-3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1957 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: Running task 1958 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 1959 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1961 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm)
NOTE: Running task 1962 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe parted-3.5-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1967 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: Running task 1968 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.5-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1969 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1970 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1971 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic)
NOTE: recipe libmnl-1.0.4-r0: task do_package_setscene: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: Running task 1985 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe parted-3.5-r0: task do_populate_lic: Started
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1987 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 1988 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1989 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_lic unihash changed to bd73c8534d8fd6ee973c4b21c5c465c7a1cce9b624e3aa637ff7ba69a085348d
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe parted-3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1990 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1991 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1994 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe parted-3.5-r0: task do_configure: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ea93135e6bc8e63cc54852e198d3eabbf225aea3faf287903bdd2c4fb2e8da5b
NOTE: Running task 2000 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2001 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2002 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2003 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: Running task 2004 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e12ef1466cb841b8170ebe21bf855a1d72ab36d5c6b2197eb65f7498b9c23a64
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2008 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2010 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2013 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2015 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2017 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 2018 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2019 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2022 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 2023 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2024 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2025 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2026 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2027 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2028 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2029 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2030 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2034 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile)
NOTE: recipe gawk-5.1.1-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2035 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2036 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm)
NOTE: Running task 2037 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2038 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2039 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install)
NOTE: recipe gawk-5.1.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_package_write_rpm unihash changed to 0cb9e2588618576931856f7bd5974fcb61e2b6467bac7bbaff6cb2c289b09efe
NOTE: recipe gawk-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2041 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe parted-3.5-r0: task do_configure: Succeeded
NOTE: Running task 2042 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_configure_ptest_base)
NOTE: recipe parted-3.5-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2043 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_compile)
NOTE: recipe parted-3.5-r0: task do_compile: Started
NOTE: recipe util-linux-2.37.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_package_write_rpm unihash changed to 9fdf31f6d6ed7938f0fc3676d2ec80dc8ee4c455f817cc5abf146b05de9f31b3
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2045 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: Running task 2046 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.5-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_compile_ptest_base)
NOTE: recipe parted-3.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_install)
NOTE: recipe parted-3.5-r0: task do_install: Started
NOTE: recipe parted-3.5-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_install_ptest_base)
NOTE: recipe parted-3.5-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2050 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package)
NOTE: Running task 2051 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_populate_sysroot)
NOTE: recipe parted-3.5-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.5-r0: task do_package: Started
NOTE: recipe parted-3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe parted-3.5-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_packagedata)
NOTE: recipe parted-3.5-r0: task do_packagedata: Started
NOTE: recipe parted-3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package_write_rpm)
NOTE: Running task 2054 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_package_qa)
NOTE: recipe parted-3.5-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.5-r0: task do_package_qa: Started
NOTE: recipe parted-3.5-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2055 of 2055 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2055 tasks of which 1971 didn't need to be rerun and all succeeded.
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

--===============4176706840230444403==--

