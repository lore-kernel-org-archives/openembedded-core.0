Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB9EC88CB6
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.3710.1684186747558305946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T34w/iFQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188215a57df-386e74dd-9229-41d7-94ac-acfa53f02069-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bgERPOn62fyxZX3rot/psPHVUlrtE09DcU9+KrMX4Tc=;
	b=T34w/iFQX4AjM598fG5GuTP0Ylc7e9l+ch8aJpXzRpefXdJoH8DYgj8dPfWpf46U
	JL+9OY2+mSp+o6eZfGha+LviDZrkJCGdaq4Ie4vjyNu5jjzayDiXwgz2mCejv+LLKBz
	g0XQ3KgqtCtFymihhTXSRdyO74Lvc1Dp6xjIauH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bgERPOn62fyxZX3rot/psPHVUlrtE09DcU9+KrMX4Tc=;
	b=nskj8Gl0ZvUMeCg1X3rEs5Dp8fXp65fq6Hn0e85bmOKtWDy8D3kX3VmwSStCXEXO
	hKwmgKCV4oqTBZRTvWzaOnsHZZBlIu+cnzkJqWjXQf+Ort38/AOQL4BIATPQDb3/QXS
	eQIh4FyPv9GQTtILoWE2C+IS+prgRnYTsQNGBRfc=
Content-Type: multipart/mixed; boundary="===============3274792960030479851=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] parted: upgrading to 3.6 SUCCEEDED
Message-ID: <01010188215a57df-386e74dd-9229-41d7-94ac-acfa53f02069-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181345

--===============3274792960030479851==
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
--===============3274792960030479851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 51 skipped, 0 masked, 0 errors.
Removing 30 recipes from the core2-32 sysroot...done.
Removing 90 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d7d663b75a392ab20e0b67e1723bcd498c5a2f7e"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 342 Local 290 Mirrors 0 Missed 52 Current 179 (84% match, 90% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 180 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 181 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 617 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 637 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
NOTE: Running task 676 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 677 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 678 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 704 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 718 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 719 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: Running task 738 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 754 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_fetch)
NOTE: Running task 755 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 756 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 757 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_fetch)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 256 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 261 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 265 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: Running setscene task 267 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running setscene task 268 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Started
NOTE: Running task 834 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 835 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Started
NOTE: Running task 836 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 837 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 838 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 272 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot_setscene)
NOTE: Running task 843 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 844 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 281 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running task 845 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 846 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 847 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: Running task 848 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 849 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 851 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 283 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 852 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/grep/3.10-r0/temp/log.do_packagedata_setscene.3456966
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 288 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_package_setscene)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe procps-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: Running setscene task 291 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3458211
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running setscene task 315 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 853 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: Running task 886 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: Running task 887 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 903 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: Running task 905 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 915 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: Running task 916 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: Running task 917 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_patch)
NOTE: Running task 918 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 933 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 342 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 343 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Started
NOTE: Running task 938 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running task 949 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 950 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 951 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_fetch: Succeeded
NOTE: Running task 965 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_patch)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 969 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 374 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 979 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 980 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 981 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: Running task 982 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: Running setscene task 379 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 380 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 995 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 996 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.10-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 442a5c75c6f964428d79355c1cd990eb00db2b48d71574ab4a4e3fdb7f10c444
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1018 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1031 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 411 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 416 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1056 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe grep-3.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 429 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1073 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 435 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 442 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 445 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1086 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1087 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 1092 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 1093 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 456 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 461 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1434 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1459 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1469 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1603 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1605 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1606 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1654 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1655 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: Running task 1661 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1663 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1711 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1746 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.10-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1752 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1753 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: Running task 1754 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1755 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: Running task 1756 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1757 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: Running task 1758 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: Running task 1760 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: Running task 1761 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe grep-3.10-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1764 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: Running task 1765 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1766 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1767 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 1768 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 1769 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1770 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1771 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 1772 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1773 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1774 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1777 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1778 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1779 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 1780 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1781 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_unpack: Succeeded
NOTE: Running task 1782 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1783 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 1784 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1785 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1786 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1787 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1788 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1789 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1790 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 1791 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1792 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1793 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1794 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Running task 1795 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1796 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_install: Succeeded
NOTE: Running task 1799 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot)
NOTE: Running task 1800 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_package)
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_package: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1801 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_configure)
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1803 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_compile)
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Started
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_compile)
NOTE: recipe socat-1.7.4.4-r0: task do_compile: Started
NOTE: recipe socat-1.7.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1805 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_install)
NOTE: recipe socat-1.7.4.4-r0: task do_install: Started
NOTE: recipe socat-1.7.4.4-r0: task do_install: Succeeded
NOTE: Running task 1806 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_package)
NOTE: recipe socat-1.7.4.4-r0: task do_package: Started
NOTE: recipe socat-1.7.4.4-r0: task do_package: Succeeded
NOTE: Running task 1807 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_packagedata)
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: Running task 1808 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile_ptest_base)
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.9-r0: task do_package: Succeeded
NOTE: Running task 1809 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1810 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Started
NOTE: recipe iptables-1.8.9-r0: task do_packagedata: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: Running task 1811 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure_ptest_base)
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1812 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile)
NOTE: recipe diffutils-3.9-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Succeeded
NOTE: Running task 1813 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Started
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1814 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_install)
NOTE: recipe iproute2-6.3.0-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1817 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe iproute2-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1818 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package)
NOTE: recipe iproute2-6.3.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1819 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1820 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_configure)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Started
NOTE: recipe diffutils-3.9-r0: task do_compile: Succeeded
NOTE: Running task 1821 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1822 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install)
NOTE: recipe diffutils-3.9-r0: task do_install: Started
NOTE: recipe diffutils-3.9-r0: task do_install: Succeeded
NOTE: Running task 1823 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1824 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_package)
NOTE: recipe diffutils-3.9-r0: task do_package: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package: Succeeded
NOTE: Running task 1825 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: Running task 1826 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure_ptest_base)
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1827 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile)
NOTE: recipe parted-3.6-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1828 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Started
NOTE: recipe diffutils-3.9-r0: task do_package: Succeeded
NOTE: Running task 1829 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_packagedata)
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1830 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1831 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_install)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Started
NOTE: recipe parted-3.6-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile_ptest_base)
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_package)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Started
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1834 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install)
NOTE: recipe parted-3.6-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 1835 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_validate_branches: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_validate_branches: Succeeded
NOTE: Running task 1836 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: recipe parted-3.6-r0: task do_install: Succeeded
NOTE: Running task 1837 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install_ptest_base)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_metadata: Started
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1838 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package)
NOTE: Running task 1839 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_sysroot)
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.1.3-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.1.3-r0: task do_packagedata: Started
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 1841 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 1842 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_patch: Succeeded
NOTE: Running task 1843 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1844 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configme)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe parted-3.6-r0: task do_package: Succeeded
NOTE: Running task 1845 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_packagedata)
NOTE: recipe parted-3.6-r0: task do_packagedata: Started
NOTE: recipe parted-3.6-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_configme: Succeeded
NOTE: Running task 1846 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_configure)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_configure: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_configure: Succeeded
NOTE: Running task 1847 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_configcheck: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 1848 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_compile: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_compile: Succeeded
NOTE: Running task 1849 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_shared_workdir)
NOTE: Running task 1850 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_link_images)
NOTE: Running task 1851 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_transform_kernel)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_shared_workdir: Succeeded
NOTE: Running task 1852 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile_kernelmodules)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_compile_kernelmodules: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 1853 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_strip)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_strip: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_strip: Succeeded
NOTE: Running task 1854 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_sizecheck)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_sizecheck: Succeeded
NOTE: Running task 1855 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_install)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_install: Succeeded
NOTE: Running task 1856 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_package)
NOTE: Running task 1857 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_bundle_initramfs)
NOTE: Running task 1858 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_package: Succeeded
NOTE: Running task 1859 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_packagedata)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_packagedata: Succeeded
NOTE: Running task 1860 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy)
NOTE: Running task 1861 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_package_write_rpm)
NOTE: Running task 1862 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: Running task 1863 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_write_rpm)
NOTE: Running task 1864 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_qa)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_deploy: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_deploy: Succeeded
NOTE: recipe parted-3.6-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1865 of 1865 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1865 tasks of which 1684 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 82 ERROR messages, returning a non-zero exit code.
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ka went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ta went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
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

--===============3274792960030479851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 73 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d7d663b75a392ab20e0b67e1723bcd498c5a2f7e"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 21 Mirrors 0 Missed 15 Current 542 (58% match, 97% complete)
Removing 4 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 543 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 548 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 550 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 551 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene)
NOTE: recipe grep-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 573 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/grep/3.10-r0/temp/log.do_packagedata_setscene.3421055
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 575 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3421253
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1216 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1587 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 1588 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1662 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 1683 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1983 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 1984 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2006 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2010 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe grep-3.10-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2011 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2012 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2013 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2014 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2015 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe grep-3.10-r0: task do_package_setscene: Succeeded
NOTE: Running task 2025 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 442a5c75c6f964428d79355c1cd990eb00db2b48d71574ab4a4e3fdb7f10c444
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2026 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2027 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: recipe grep-3.10-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2040 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe grep-3.10-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2041 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2042 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm unihash changed to f6f86ae9f0b8ef89a3861f53056d247929d109a054b6485de7daf23edade04c9
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2046 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2050 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2051 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm unihash changed to e4c428703fb80e82ab85e96ba2807ac684ce04259dd3e7e7db2400e061317b45
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure_ptest_base)
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2057 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile)
NOTE: recipe parted-3.6-r0: task do_compile: Started
NOTE: recipe parted-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile_ptest_base)
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2059 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install)
NOTE: recipe parted-3.6-r0: task do_install: Started
NOTE: recipe parted-3.6-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install_ptest_base)
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2061 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package)
NOTE: Running task 2062 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_sysroot)
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_package: Started
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe parted-3.6-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_packagedata)
NOTE: recipe parted-3.6-r0: task do_packagedata: Started
NOTE: recipe parted-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2064 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_write_rpm)
NOTE: Running task 2065 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_qa)
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2066 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2066 tasks of which 2024 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 82 ERROR messages, returning a non-zero exit code.
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ka went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ta went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
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

--===============3274792960030479851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d7d663b75a392ab20e0b67e1723bcd498c5a2f7e"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 21 Mirrors 0 Missed 15 Current 542 (58% match, 97% complete)
Removing 1 stale sstate objects for arch qemuarm...done.
Removing 4 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 543 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 548 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 550 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 551 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene)
NOTE: recipe grep-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 573 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1216 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/grep/3.10-r0/temp/log.do_packagedata_setscene.3349345
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 575 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_package_setscene)
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3349544
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1440 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 1441 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1662 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 1684 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1998 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1999 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: Running task 2000 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 2001 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe grep-3.10-r0: task do_package_setscene: Started
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2011 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2012 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2013 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2014 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2015 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 442a5c75c6f964428d79355c1cd990eb00db2b48d71574ab4a4e3fdb7f10c444
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2016 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: recipe grep-3.10-r0: task do_package_setscene: Succeeded
NOTE: Running task 2026 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata)
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2027 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe grep-3.10-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2041 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2042 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe grep-3.10-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm unihash changed to 32b6106d05db132889a24ec167d04070a940bd81490700eb477d793c799d5e04
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2046 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2047 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2048 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: Running task 2050 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2051 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm unihash changed to 727a123e3cdd55cf840894733b162fe2b0d4521a165b8a0e9a2a426ff0635b28
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure_ptest_base)
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2057 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile)
NOTE: recipe parted-3.6-r0: task do_compile: Started
NOTE: recipe parted-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile_ptest_base)
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2059 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install)
NOTE: recipe parted-3.6-r0: task do_install: Started
NOTE: recipe parted-3.6-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install_ptest_base)
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2061 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package)
NOTE: Running task 2062 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_sysroot)
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_package: Started
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe parted-3.6-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_packagedata)
NOTE: recipe parted-3.6-r0: task do_packagedata: Started
NOTE: recipe parted-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2064 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_write_rpm)
NOTE: Running task 2065 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_qa)
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2066 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2066 tasks of which 2024 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 82 ERROR messages, returning a non-zero exit code.
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ka went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ta went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
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

--===============3274792960030479851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/parted: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted: SRC_URI changed from "https://ftp.gnu.org/gnu/parted/parted-3.5.tar.xz file://fix-doc-mandir.patch file://run-ptest" to "https://ftp.gnu.org/gnu/parted/parted-3.6.tar.xz file://fix-doc-mandir.patch file://run-ptest"
packages/core2-32-poky-linux/parted: PACKAGES: added "parted-locale-ka"
packages/core2-32-poky-linux/parted/parted-dbg: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-dbg: FILELIST: removed "/usr/lib/.debug/libparted-fs-resize.so.0.0.4 /usr/lib/.debug/libparted.so.2.0.4", added "/usr/lib/.debug/libparted-fs-resize.so.0.0.5 /usr/lib/.debug/libparted.so.2.0.5"
packages/core2-32-poky-linux/parted/parted-dbg: PKGSIZE changed from 1608840 to 1627512 (+1%)
packages/core2-32-poky-linux/parted/parted-dbg: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-dev: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-dev: PKGSIZE changed from 51119 to 52495 (+3%)
packages/core2-32-poky-linux/parted/parted-dev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-doc: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-doc: PKGSIZE changed from 74823 to 75876 (+1%)
packages/core2-32-poky-linux/parted/parted-doc: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ca: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ca: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-cs: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-cs: PKGSIZE changed from 53937 to 53773 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-cs: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-da: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-da: PKGSIZE changed from 46440 to 46294 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-da: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-de: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-de: PKGSIZE changed from 75120 to 74785 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-de: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-es: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-es: PKGSIZE changed from 73981 to 73647 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-es: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-fr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-fr: PKGSIZE changed from 71697 to 71324 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-fr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-fur: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGSIZE changed from 65752 to 73773 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-gl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-gl: PKGSIZE changed from 36492 to 36338 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-gl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-hu: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-hu: PKGSIZE changed from 64534 to 64392 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-hu: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-id: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-id: PKGSIZE changed from 71674 to 71369 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-id: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-it: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-it: PKGSIZE changed from 65306 to 65161 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-it: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ja: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ja: PKGSIZE changed from 82969 to 82612 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ja: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ko: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ko: PKGSIZE changed from 77412 to 77057 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ko: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-nl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-nl: PKGSIZE changed from 70310 to 69996 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-nl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-nn: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-nn: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pl: PKGSIZE changed from 73932 to 73608 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-pl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PKGSIZE changed from 72810 to 72480 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pt: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pt: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ro: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGSIZE changed from 76252 to 75936 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ru: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ru: PKGSIZE changed from 90800 to 92400 (+2%)
packages/core2-32-poky-linux/parted/parted-locale-ru: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-rw: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-rw: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sk: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sk: PKGSIZE changed from 62607 to 62461 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-sk: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sl: PKGSIZE changed from 58539 to 58397 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-sl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sr: PKGSIZE changed from 90984 to 92670 (+2%)
packages/core2-32-poky-linux/parted/parted-locale-sr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sv: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGSIZE changed from 72383 to 72054 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-tr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-tr: PKGSIZE changed from 64803 to 64669 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-tr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-uk: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-uk: PKGSIZE changed from 93872 to 93455 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-uk: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-vi: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGSIZE changed from 69671 to 78082 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGSIZE changed from 67719 to 67435 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGSIZE changed from 68482 to 68192 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-ptest: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t9025-gpt-1s-partition.sh /usr/lib/parted/ptest/tests/t0900-type-gpt.sh /usr/lib/parted/ptest/tests/t0901-type-gpt-invalid.sh /usr/lib/parted/ptest/tests/t9024-msdos-1s-partition.sh /usr/lib/parted/ptest/tests/t0911-type-dos-invalid.sh /usr/lib/parted/ptest/tests/t0910-type-dos.sh"
packages/core2-32-poky-linux/parted/parted-ptest: PKGSIZE changed from 581906 to 608885 (+5%)
packages/core2-32-poky-linux/parted/parted-ptest: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-src: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-src: FILELIST: directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r/fat -> /usr/src/debug/parted/3.6-r0/libparted/fs/r/fat, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ntfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/ntfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/xfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/xfs, directory renamed /usr/src/debug/parted/3.5-r0/lib/glthread -> /usr/src/debug/parted/3.6-r0/lib/glthread, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ext2 -> /usr/src/debug/parted/3.6-r0/libparted/fs/ext2, directory renamed /usr/src/debug/parted/3.5-r0/libparted/arch -> /usr/src/debug/parted/3.6-r0/libparted/arch, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/nilfs2 -> /usr/src/debug/parted/3.6-r0/libparted/fs/nilfs2, directory renamed /usr/src/debug/parted/3.5-r0/libparted/cs -> /usr/src/debug/parted/3.6-r0/libparted/cs, directory renamed /usr/src/debug/p
 arted/3.5-r0/tests -> /usr/src/debug/parted/3.6-r0/tests, directory renamed /usr/src/debug/parted/3.5-r0/include/parted -> /usr/src/debug/parted/3.6-r0/include/parted, directory renamed /usr/src/debug/parted/3.5-r0/parted -> /usr/src/debug/parted/3.6-r0/parted, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/udf -> /usr/src/debug/parted/3.6-r0/libparted/fs/udf, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r -> /usr/src/debug/parted/3.6-r0/libparted/fs/r, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r/hfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/r/hfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/f2fs -> /usr/src/debug/parted/3.6-r0/libparted/fs/f2fs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ufs -> /usr/src/debug/parted/3.6-r0/libparted/fs/ufs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/hfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/hfs, directory renamed /usr/src/debug/parted/3.5-r0/li
 bparted/fs/amiga -> /usr/src/debug/parted/3.6-r0/libparted/fs/amiga, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/jfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/jfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/reiserfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/reiserfs, directory renamed /usr/src/debug/parted/3.5-r0/partprobe -> /usr/src/debug/parted/3.6-r0/partprobe, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/linux_swap -> /usr/src/debug/parted/3.6-r0/libparted/fs/linux_swap, directory renamed /usr/src/debug/parted/3.5-r0/libparted/labels -> /usr/src/debug/parted/3.6-r0/libparted/labels, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/fat -> /usr/src/debug/parted/3.6-r0/libparted/fs/fat, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/btrfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/btrfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted -> /usr/src/debug/parted/3.6-r0/libparted, removed "/usr/sr
 c/debug/parted/3.5-r0/lib/stat-time.h /usr/src/debug/parted/3.5-r0/lib/exitfail.h /usr/src/debug/parted/3.5-r0/lib/xalloc-die.c /usr/src/debug/parted/3.5-r0/lib/exitfail.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray-skeleton.c /usr/src/debug/parted/3.5-r0/lib/wchar.h /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_set_array_size.c /usr/src/debug/parted/3.5-r0/lib/error.h /usr/src/debug/parted/3.5-r0/lib/version-etc-fsf.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_resize.c /usr/src/debug/parted/3.5-r0/lib/stripslash.c /usr/src/debug/parted/3.5-r0/lib/basename-lgpl.c /usr/src/debug/parted/3.5-r0/lib/quotearg.c /usr/src/debug/parted/3.5-r0/lib/quotearg.h /usr/src/debug/parted/3.5-r0/lib/basename-lgpl.h /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_grow.c /usr/src/debug/parted/3.5-r0/lib/fcntl.c /usr/src/debug/parted/3.5-r0/lib/c-strcase.h /usr/src/debug/parted/3.5-r0/lib/getopt.c /usr/src/debug/parted/3.5-r0/lib/strtol.c /usr/src/debug/parted/3.5-r0/lib/iallo
 c.h /usr/src/debug/parted/3.5-r0/lib/stdlib.h /usr/src/debug/parted/3.5-r0/lib/fcntl.h /usr/src/debug/parted/3.5-r0/lib/string.h /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_emplace_enlarge.c /usr/src/debug/parted/3.5-r0/lib/dirname.h /usr/src/debug/parted/3.5-r0/lib/xstrtol.h /usr/src/debug/parted/3.5-r0/lib/dirname.c /usr/src/debug/parted/3.5-r0/lib/regcomp.c /usr/src/debug/parted/3.5-r0/lib/regexec.c /usr/src/debug/parted/3.5-r0/lib/quote.h /usr/src/debug/parted/3.5-r0/lib/xmalloc.c /usr/src/debug/parted/3.5-r0/lib/xstrtol.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_resize_clear.c /usr/src/debug/parted/3.5-r0/lib/setlocale_null.h /usr/src/debug/parted/3.5-r0/lib/c-strcaseeq.h /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_dupfree.c /usr/src/debug/parted/3.5-r0/lib/safe-read.c /usr/src/debug/parted/3.5-r0/lib/sys-limits.h /usr/src/debug/parted/3.5-r0/lib/setlocale_null.c /usr/src/debug/parted/3.5-r0/lib/idx.h /usr/src/debug/parted/3.5-r0/lib/c-strncasecmp.c /usr
 /src/debug/parted/3.5-r0/lib/closeout.c /usr/src/debug/parted/3.5-r0/lib/closeout.h /usr/src/debug/parted/3.5-r0/lib/getopt-ext.h /usr/src/debug/parted/3.5-r0/lib/getopt_int.h /usr/src/debug/parted/3.5-r0/lib/strerror.c /usr/src/debug/parted/3.5-r0/lib/regex.h /usr/src/debug/parted/3.5-r0/lib/c-strcasecmp.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_at_failure.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray.h /usr/src/debug/parted/3.5-r0/lib/version-etc.c /usr/src/debug/parted/3.5-r0/lib/version-etc.h /usr/src/debug/parted/3.5-r0/lib/getprogname.c /usr/src/debug/parted/3.5-r0/lib/regex_internal.c /usr/src/debug/parted/3.5-r0/lib/localcharset.h /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_finalize.c /usr/src/debug/parted/3.5-r0/lib/localcharset.c /usr/src/debug/parted/3.5-r0/lib/regex_internal.h /usr/src/debug/parted/3.5-r0/lib/getopt-core.h /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer.gl.h /usr/src/debug/parted/3.5-r0/lib/xalloc.h /usr/src/debug/parted/3.5-r0/
 lib/long-options.c /usr/src/debug/parted/3.5-r0/lib/c-ctype.h /usr/src/debug/parted/3.5-r0/lib/hard-locale.h /usr/src/debug/parted/3.5-r0/lib/malloca.h /usr/src/debug/parted/3.5-r0/lib/hard-locale.c /usr/src/debug/parted/3.5-r0/lib/malloca.c /usr/src/debug/parted/3.5-r0/lib/cloexec.c /usr/src/debug/parted/3.5-r0/lib/getopt1.c /usr/src/debug/parted/3.5-r0/lib/mbrtowc.c /usr/src/debug/parted/3.5-r0/lib/close-stream.h /usr/src/debug/parted/3.5-r0/lib/close-stream.c /usr/src/debug/parted/3.5-r0/lib/argmatch.c /usr/src/debug/parted/3.5-r0/lib/basename.c /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_grow_preserve.c /usr/src/debug/parted/3.5-r0/lib/progname.c /usr/src/debug/parted/3.5-r0/lib/tempname.c /usr/src/debug/parted/3.5-r0/lib/progname.h /usr/src/debug/parted/3.5-r0/lib/argmatch.h /usr/src/debug/parted/3.5-r0/lib/dirname-lgpl.c", added "/usr/src/debug/parted/3.6-r0/lib/regex_internal.c /usr/src/debug/parted/3.6-r0/lib/version-etc-fsf.c /usr/src/debug/parted/3.6-r0/lib/rege
 x_internal.h /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_resize.c /usr/src/debug/parted/3.6-r0/lib/getopt.c /usr/src/debug/parted/3.6-r0/lib/strtol.c /usr/src/debug/parted/3.6-r0/lib/ialloc.h /usr/src/debug/parted/3.6-r0/lib/stdlib.h /usr/src/debug/parted/3.6-r0/lib/string.h /usr/src/debug/parted/3.6-r0/lib/quotearg.h /usr/src/debug/parted/3.6-r0/lib/argmatch.h /usr/src/debug/parted/3.6-r0/lib/hard-locale.c /usr/src/debug/parted/3.6-r0/lib/c-strcasecmp.c /usr/src/debug/parted/3.6-r0/lib/hard-locale.h /usr/src/debug/parted/3.6-r0/lib/argmatch.c /usr/src/debug/parted/3.6-r0/lib/quotearg.c /usr/src/debug/parted/3.6-r0/lib/c-ctype.h /usr/src/debug/parted/3.6-r0/lib/malloca.h /usr/src/debug/parted/3.6-r0/lib/getopt_int.h /usr/src/debug/parted/3.6-r0/lib/cloexec.c /usr/src/debug/parted/3.6-r0/lib/getopt1.c /usr/src/debug/parted/3.6-r0/lib/malloca.c /usr/src/debug/parted/3.6-r0/lib/mbrtowc.c /usr/src/debug/parted/3.6-r0/lib/exitfail.h /usr/src/debug/parted/3.6-r0/lib/exitfail.c /usr/s
 rc/debug/parted/3.6-r0/lib/close-stream.c /usr/src/debug/parted/3.6-r0/lib/quote.h /usr/src/debug/parted/3.6-r0/lib/sys-limits.h /usr/src/debug/parted/3.6-r0/lib/strerror.c /usr/src/debug/parted/3.6-r0/lib/close-stream.h /usr/src/debug/parted/3.6-r0/lib/closeout.c /usr/src/debug/parted/3.6-r0/lib/closeout.h /usr/src/debug/parted/3.6-r0/lib/idx.h /usr/src/debug/parted/3.6-r0/lib/c-strcase.h /usr/src/debug/parted/3.6-r0/lib/long-options.c /usr/src/debug/parted/3.6-r0/lib/setlocale_null.h /usr/src/debug/parted/3.6-r0/lib/setlocale_null.c /usr/src/debug/parted/3.6-r0/lib/getopt-ext.h /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_grow_preserve.c /usr/src/debug/parted/3.6-r0/lib/stat-time.h /usr/src/debug/parted/3.6-r0/lib/stripslash.c /usr/src/debug/parted/3.6-r0/lib/basename-lgpl.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_at_failure.c /usr/src/debug/parted/3.6-r0/lib/basename-lgpl.h /usr/src/debug/parted/3.6-r0/lib/xalloc-die.c /usr/src/debug/parted/3.6-r0/lib/dirname-l
 gpl.c /usr/src/debug/parted/3.6-r0/lib/safe-read.c /usr/src/debug/parted/3.6-r0/lib/xalloc.h /usr/src/debug/parted/3.6-r0/lib/version-etc.h /usr/src/debug/parted/3.6-r0/lib/progname.h /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer.gl.h /usr/src/debug/parted/3.6-r0/lib/basename.c /usr/src/debug/parted/3.6-r0/lib/progname.c /usr/src/debug/parted/3.6-r0/lib/tempname.c /usr/src/debug/parted/3.6-r0/lib/version-etc.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_finalize.c /usr/src/debug/parted/3.6-r0/lib/c-strncasecmp.c /usr/src/debug/parted/3.6-r0/lib/regex.h /usr/src/debug/parted/3.6-r0/lib/dirname.h /usr/src/debug/parted/3.6-r0/lib/xstrtol.h /usr/src/debug/parted/3.6-r0/lib/c-strcaseeq.h /usr/src/debug/parted/3.6-r0/lib/dirname.c /usr/src/debug/parted/3.6-r0/lib/regcomp.c /usr/src/debug/parted/3.6-r0/lib/regexec.c /usr/src/debug/parted/3.6-r0/lib/xmalloc.c /usr/src/debug/parted/3.6-r0/lib/xstrtol.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray-skeleton.c /usr/src/debug/p
 arted/3.6-r0/lib/getprogname.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_resize_clear.c /usr/src/debug/parted/3.6-r0/lib/getopt-core.h /usr/src/debug/parted/3.6-r0/lib/fcntl.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray.h /usr/src/debug/parted/3.6-r0/lib/fcntl.h /usr/src/debug/parted/3.6-r0/lib/wchar.h /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_set_array_size.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_emplace_enlarge.c /usr/src/debug/parted/3.6-r0/lib/localcharset.h /usr/src/debug/parted/3.6-r0/lib/localcharset.c /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_grow.c"
packages/core2-32-poky-linux/parted/parted-src: PKGSIZE changed from 2461512 to 2480391 (+1%)
packages/core2-32-poky-linux/parted/parted-src: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-staticdev: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-staticdev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted: FILELIST: removed "/usr/lib/libparted-fs-resize.so.0.0.4 /usr/lib/libparted.so.2.0.4", added "/usr/lib/libparted-fs-resize.so.0.0.5 /usr/lib/libparted.so.2.0.5"
packages/core2-32-poky-linux/parted/parted: PKGSIZE changed from 695234 to 699330 (+1%)
packages/core2-32-poky-linux/parted/parted: PKGV changed from 3.5 [default] to 3.6 [default]
Changes to packages/core2-32-poky-linux/parted (sysroot):
  /usr/lib/libparted-fs-resize.so.0 changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted-fs-resize.so changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2 changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted.so changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted-fs-resize.so.0.0.4 moved to /usr/lib/libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2.0.4 moved to /usr/lib/libparted.so.2.0.5

--===============3274792960030479851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d7d663b75a392ab20e0b67e1723bcd498c5a2f7e"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 21 Mirrors 0 Missed 15 Current 542 (58% match, 97% complete)
Removing 1 stale sstate objects for arch qemumips...done.
Removing 4 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 543 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 548 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 550 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 551 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene)
NOTE: recipe grep-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 573 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1216 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/grep/3.10-r0/temp/log.do_packagedata_setscene.3385174
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 575 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_package_setscene)
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3385372
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1409 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 1410 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1662 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 1681 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1985 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 1986 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2007 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2008 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: Running task 2009 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe grep-3.10-r0: task do_package_setscene: Started
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2012 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2013 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2014 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2015 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 442a5c75c6f964428d79355c1cd990eb00db2b48d71574ab4a4e3fdb7f10c444
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2016 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2017 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: recipe grep-3.10-r0: task do_package_setscene: Succeeded
NOTE: Running task 2027 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe grep-3.10-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2041 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: Running task 2042 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe grep-3.10-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm unihash changed to 468cba311d6bb83c48fc02d8a064d77c89addef30c1d9c81cf978a095bc6194f
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2046 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2047 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2048 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: Running task 2049 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2050 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2051 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm unihash changed to a0f29419c0cdf45297313a3503178b3822eab42dd89f7c1458e5aed430516b5a
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure_ptest_base)
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2057 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile)
NOTE: recipe parted-3.6-r0: task do_compile: Started
NOTE: recipe parted-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile_ptest_base)
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2059 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install)
NOTE: recipe parted-3.6-r0: task do_install: Started
NOTE: recipe parted-3.6-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install_ptest_base)
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2061 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package)
NOTE: Running task 2062 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_sysroot)
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_package: Started
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe parted-3.6-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_packagedata)
NOTE: recipe parted-3.6-r0: task do_packagedata: Started
NOTE: recipe parted-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2064 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_write_rpm)
NOTE: Running task 2065 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_qa)
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2066 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2066 tasks of which 2024 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 82 ERROR messages, returning a non-zero exit code.
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ka went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ta went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
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

--===============3274792960030479851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/parted: PACKAGES: added "parted-locale-ka"
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGSIZE changed from 65752 to 73773 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGSIZE changed from 69671 to 78082 (+12%)
packages/core2-32-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t0900-type-gpt.sh /usr/lib/parted/ptest/tests/t9025-gpt-1s-partition.sh /usr/lib/parted/ptest/tests/t0910-type-dos.sh /usr/lib/parted/ptest/tests/t0901-type-gpt-invalid.sh /usr/lib/parted/ptest/tests/t0911-type-dos-invalid.sh /usr/lib/parted/ptest/tests/t9024-msdos-1s-partition.sh"
packages/core2-32-poky-linux/parted/parted: FILELIST: removed "/usr/lib/libparted.so.2.0.4 /usr/lib/libparted-fs-resize.so.0.0.4", added "/usr/lib/libparted.so.2.0.5 /usr/lib/libparted-fs-resize.so.0.0.5"
Changes to packages/core2-32-poky-linux/parted (sysroot):
  /usr/lib/libparted-fs-resize.so.0 changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted-fs-resize.so changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2 changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted.so changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted-fs-resize.so.0.0.4 moved to /usr/lib/libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2.0.4 moved to /usr/lib/libparted.so.2.0.5

--===============3274792960030479851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1804 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d7d663b75a392ab20e0b67e1723bcd498c5a2f7e"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 19 Mirrors 0 Missed 15 Current 544 (55% match, 97% complete)
Removing 3 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 549 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 551 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 552 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene)
NOTE: recipe grep-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 574 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/grep/3.10-r0/temp/log.do_packagedata_setscene.3313558
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 575 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3313695
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 576 of 578 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1216 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_fetch)
NOTE: recipe parted-3.6-r0: task do_fetch: Started
NOTE: recipe parted-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1616 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_unpack)
NOTE: Running task 1617 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1662 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: Running task 1681 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe parted-3.6-r0: task do_unpack: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1964 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: Running task 1965 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2003 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2010 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe parted-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 2011 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_patch)
NOTE: recipe grep-3.10-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe parted-3.6-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2012 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2013 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2014 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2015 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe parted-3.6-r0: task do_populate_lic: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2016 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: recipe parted-3.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_lic unihash changed to 442a5c75c6f964428d79355c1cd990eb00db2b48d71574ab4a4e3fdb7f10c444
NOTE: recipe grep-3.10-r0: task do_package_setscene: Succeeded
NOTE: recipe parted-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2026 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.10.bb:do_packagedata)
NOTE: Running task 2027 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure)
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe grep-3.10-r0: task do_packagedata: Started
NOTE: recipe parted-3.6-r0: task do_configure: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2040 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2041 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe grep-3.10-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2042 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2046 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm unihash changed to 2ce9646fc685b09fcfc919fbbb0138b3645d2bd438c2ef20c88504b6d08e004f
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2047 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2048 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2050 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2051 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2054 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm)
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_write_rpm unihash changed to 01436ea1637524a974c82d306897f70786b555d95c582d8c89e4d155d7777286
NOTE: recipe parted-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2056 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_configure_ptest_base)
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2057 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile)
NOTE: recipe parted-3.6-r0: task do_compile: Started
NOTE: recipe parted-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2058 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_compile_ptest_base)
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2059 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install)
NOTE: recipe parted-3.6-r0: task do_install: Started
NOTE: recipe parted-3.6-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_install_ptest_base)
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2061 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package)
NOTE: Running task 2062 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_populate_sysroot)
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.6-r0: task do_package: Started
NOTE: recipe parted-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe parted-3.6-r0: task do_package: Succeeded
NOTE: Running task 2063 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_packagedata)
NOTE: recipe parted-3.6-r0: task do_packagedata: Started
NOTE: recipe parted-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2064 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_write_rpm)
NOTE: Running task 2065 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_package_qa)
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Started
NOTE: recipe parted-3.6-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2066 of 2066 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/parted/parted_3.6.bb:do_build)
NOTE: Tasks Summary: Attempted 2066 tasks of which 2024 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 82 ERROR messages, returning a non-zero exit code.
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ka went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ta went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.11-r0 to 0:3.10-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: grep-3.10-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
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

--===============3274792960030479851==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-parted-upgrade-3.5-3.6.patch"

RnJvbSBiODljZTAxMDgzYmU5N2JlZDQ3NTNiMzMwZjFiNmY2M2RiOGY5MjE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTQ6NDU6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YXJ0ZWQ6IHVwZ3JhZGUgMy41IC0+IDMuNgoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFy
dGVkL3twYXJ0ZWRfMy41LmJiID0+IHBhcnRlZF8zLjYuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3BhcnRlZC97cGFydGVkXzMuNS5iYiA9PiBwYXJ0ZWRfMy42LmJifSAoOTYlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuNS5iYiBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuNi5iYgpzaW1pbGFyaXR5IGluZGV4
IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFydGVkL3BhcnRlZF8zLjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuNi5iYgpp
bmRleCBlYTJiNjhiYmQ4Li4wNWQ1NzUwN2ZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvcGFydGVkL3BhcnRlZF8zLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Bh
cnRlZC9wYXJ0ZWRfMy42LmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlS
Uk9SfS9wYXJ0ZWQvcGFydGVkLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4t
cHRlc3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OTM4ZGQ1YzFj
MTI1ZjZjNzhiMWY0YjNlMjk3NTI2ZjE4ZWU3NGFhNDNkNDVjMjQ4NTc4YjFkMjQ3MGMwNWEyIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjNiNDNkYmUzM2NjYTBmOWExODYwMWViYWI1NmI3ODUyYjEy
OGVjMWEzZGYzYTliMzBjY2RlNWU3MzM1OWU2MTIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZyBnZXR0ZXh0IHRleGluZm8gcHRlc3QKIAotLSAKMi4zOS4yCgo=

--===============3274792960030479851==--

