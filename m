Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFCCC47080
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.18948.1652634913532762014
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dTIvuDpQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180c8b78517-5dc30589-7f4d-44bc-bc29-d71d25d642a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QqoCPjf5BSzFg4eiT0IULrNMlqGe+nVp53F513zk0SM=;
	b=dTIvuDpQggI3u1PJyZ2+sAkXB0vy2/1zoVQVKKGkRYEYjwttqK3/wuQZppkEiHdX
	TwSUSkBy2Wd6x3gPS8sAnGY1byycvBR1kg+mHSLqTVx3oPry+vaaANW0jezZYfmZp+b
	acz4XD0XZYcRwHzQNvF2fLg74lY7nEIRq+HbekGY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QqoCPjf5BSzFg4eiT0IULrNMlqGe+nVp53F513zk0SM=;
	b=kcynUajMPDN1uEJdAjTl8BWIabptg7JIHSPNAg3DnHXE+OfiiWol44owCEZA1jWv
	TmiZObvGMmTC8GXAju7lwXW392Fakw3+cPDu9I6L8n8707YqgsG9cM/kpJx3d92jyki
	ESm9+qPCSHKNAAzEu0CXvtWoxU0YukjjoiK5HXFk=
Content-Type: multipart/mixed; boundary="===============3485534734031617630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.36.1 SUCCEEDED
Message-ID: 
 <01010180c8b78517-5dc30589-7f4d-44bc-bc29-d71d25d642a9-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165623

--===============3485534734031617630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.36.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.36.0-2.36.1.patch
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
--===============3485534734031617630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 67081784 to 67082304 (+0%)
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8660488 to 8660321 (-0%)
packages/core2-32-poky-linux/git/git-src: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/git: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/git: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.36.0" to "2.36.1"
packages/core2-32-poky-linux/git: PKGV changed from 2.36.0 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.36.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.36.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-32-poky-linux/git: PV changed from "2.36.0" to "2.36.1"

--===============3485534734031617630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
DISTRO_VERSION       = "4.1+snapshot-82084648272652d0404c94135f01ff5548905d81"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:82084648272652d0404c94135f01ff5548905d81"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 1 Mirrors 0 Missed 60 Current 179 (1% match, 75% complete)
Removing 8 stale sstate objects for arch qemuppc...done.
Removing 9 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 646 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 652 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 666 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_fetch)
NOTE: Running task 691 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 711 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 717 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 721 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 733 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_fetch)
NOTE: Running task 734 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe expat-2.4.8-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe curl-7.83.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_fetch: Succeeded
NOTE: Running task 737 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: Running task 739 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 740 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_unpack)
NOTE: Running task 741 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 742 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 743 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 744 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 745 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 746 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 753 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 757 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 758 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_unpack)
NOTE: Running task 762 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: Running task 785 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: Running task 792 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: Running task 798 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 816 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe curl-7.83.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Running task 818 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 819 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 821 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 823 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 824 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 825 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.83.0-r0: task do_unpack: Succeeded
NOTE: Running task 826 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 827 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 828 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_generate_toolchain_file)
NOTE: Running task 829 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: Running task 830 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 831 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.83.0-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 833 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_patch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 835 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 836 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 837 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 838 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 839 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure)
NOTE: Running task 840 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 841 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe expat-2.4.8-r0: task do_configure: Started
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 842 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 843 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 844 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 845 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic unihash changed to ec7873354d39fb79089a9e7c46e2570ec8e234cbe7d31cf75f439d86d4207a8f
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 846 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to 990782b444274ce44875e6ba5d3ef747c0f74e4eb1031aac2aa7e63bdba65524
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to ad9b1d796d83d9e093b59438b2d2c9c8912289937bae85cd434617ab8e1f2556
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 848 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package)
NOTE: Running task 849 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_configure: Succeeded
NOTE: Running task 851 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 2750df69dbc0dc82166da4c34076dddf43a174b5eb38fdfb8c46ec739d448c90
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 2f5fa11fa6bed47a3994bff4b14d27902e4a9f4720d0822fa2292c4dc37bdff6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running task 852 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 855 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package)
NOTE: recipe perl-5.34.1-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package unihash changed to 9bd71981c3012a3561197923963dbcd1f3d4ce3dc95d6b69e5b1f7d39508cd67
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 857 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 858 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe expat-2.4.8-r0: task do_compile: Succeeded
NOTE: Running task 859 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 860 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install)
NOTE: recipe expat-2.4.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_install: Succeeded
NOTE: Running task 861 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 862 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot)
NOTE: Running task 863 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 864 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 865 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 866 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 867 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 868 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 869 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.4.8-r0: task do_package: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 870 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata)
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 871 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 872 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: Running task 873 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package unihash changed to e6069613ff97f4cea6e662f5339656f1a5cd69975d7c6c83e9d38b2697ba685d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata became valid
NOTE: Running setscene task 236 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 874 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile)
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 876 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package)
NOTE: recipe bash-5.1.16-r0: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package unihash changed to eb6b02d23395199845423148f38611334c0ac871951d561297dff13eeaf6b776
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata became valid
NOTE: Running setscene task 238 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 878 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 879 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 880 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 881 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 882 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install)
NOTE: recipe openssl-3.0.2-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 883 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 884 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 885 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 886 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 887 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 890 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 891 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 892 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 893 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 895 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 896 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 897 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 898 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 899 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 900 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.34.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package unihash changed to a1d13aa0c1e4b5a905c2436da5fd27645e57634d7d35f96dc7f443f7f7905ae5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 901 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot)
NOTE: Running task 902 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_package)
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_package: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 903 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 905 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 906 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 907 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 908 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Running task 909 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: Running task 910 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 911 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 912 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 913 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_configure)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 914 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 915 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 916 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_compile)
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Failed
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 916 tasks of which 798 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/openssl/3.0.2-r0/temp/log.do_packagedata.2516627
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata) failed with exit code '1'

--===============3485534734031617630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 19 recipes from the core2-32 sysroot...done.
Removing 24 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-82084648272652d0404c94135f01ff5548905d81"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:82084648272652d0404c94135f01ff5548905d81"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 50 Mirrors 0 Missed 60 Current 129 (45% match, 74% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 144 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 154 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 160 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 161 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 164 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 179 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 182 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 544 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 545 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 552 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_fetch)
NOTE: Running task 562 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 581 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 582 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 583 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 584 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_fetch)
NOTE: Running task 585 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: Running task 589 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: recipe expat-2.4.8-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: recipe curl-7.83.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_fetch: Succeeded
NOTE: Running task 596 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 597 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_unpack)
NOTE: Running task 598 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: Running task 599 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 600 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 601 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 602 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: Running task 603 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_unpack)
NOTE: Running task 604 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 605 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 606 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 607 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_fetch)
NOTE: Running task 608 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 609 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: Running setscene task 201 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 202 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 203 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 204 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: Running setscene task 205 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.83.0-r0: task do_unpack: Started
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: recipe perl-5.34.1-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: Running task 614 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_unpack)
NOTE: recipe perl-5.34.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 615 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_unpack)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 616 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: Running task 617 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 618 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_patch)
NOTE: Running task 619 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_unpack: Started
NOTE: Running task 620 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe ncurses-6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 621 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 622 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 623 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 208 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 209 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 628 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: Running setscene task 212 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 629 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 630 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 631 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 632 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_generate_toolchain_file)
NOTE: Running task 633 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 634 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe curl-7.83.0-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe sed-4.8-r0: task do_unpack: Succeeded
NOTE: Running task 635 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_unpack)
NOTE: Running task 636 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 637 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 638 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_patch)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: Running task 639 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 640 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: Running task 641 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 642 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 643 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: Running task 644 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 214 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 645 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: Running task 646 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe curl-7.83.0-r0: task do_patch: Succeeded
NOTE: Running task 647 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: Running task 648 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: Running task 649 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 650 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 651 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_patch: Succeeded
NOTE: Running task 653 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 216 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 656 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 657 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 658 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: Running task 659 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: Running setscene task 218 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 663 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 665 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 221 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic unihash changed to ec7873354d39fb79089a9e7c46e2570ec8e234cbe7d31cf75f439d86d4207a8f
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_unpack: Succeeded
NOTE: Running task 668 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_patch)
NOTE: recipe perl-5.34.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.3-r0: task do_patch: Started
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_patch: Succeeded
NOTE: Running setscene task 226 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 227 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 233 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 236 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 237 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 761 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 768 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 775 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 778 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 781 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 782 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 783 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 784 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 785 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: Running task 786 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: Running task 787 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: Running task 788 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: Running task 789 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe opkg-utils-0.5.0-r0: task do_configure: Succeeded
NOTE: Running task 790 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_compile)
NOTE: recipe expat-2.4.8-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_compile: Succeeded
NOTE: Running task 791 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 792 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_install: Succeeded
NOTE: Running task 793 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: Running task 795 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 796 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 797 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: Running task 798 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 799 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 800 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_configure: Succeeded
NOTE: Running task 801 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 802 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: Running task 803 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 804 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: Running task 805 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_configure)
NOTE: Running task 806 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_configure)
NOTE: Running task 807 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile)
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe ncurses-6.3-r0: task do_configure: Started
NOTE: recipe sed-4.8-r0: task do_configure: Started
NOTE: recipe expat-2.4.8-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to d98d2da47f5e6ead8001acc255d259ceb3843a165b9a5af39b938eab3270c880
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 239 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to e3b1a19595cf66f1ff84323c1a4ddfe55bfca0b0225854e52bf8cccde7607a84
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 239 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: Running task 809 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 811 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_compile: Succeeded
NOTE: Running task 812 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 813 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install)
NOTE: recipe expat-2.4.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_install: Succeeded
NOTE: Running task 814 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 815 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot)
NOTE: Running task 816 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_package)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 817 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 818 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: Running task 819 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Succeeded
NOTE: Running task 821 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata)
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: Running task 822 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 823 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 824 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 825 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 826 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 827 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 828 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 912a68d0ccddbf5758b458f2e42b0e23c580a84339d967ce82234831ad836d48
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 239 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 830 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 831 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: Running task 832 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 833 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: Running task 834 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 835 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile)
NOTE: recipe openssl-3.0.2-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 836 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: Running task 837 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 839 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 840 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe perl-5.34.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe perl-5.34.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 841 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_configure)
NOTE: recipe perl-5.34.1-r0: task do_configure: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to a86d19d868e69c89038d0e66bd53d444f74bcdb850226ae3bca801d39cc87b81
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 239 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.8-r0: task do_configure: Succeeded
NOTE: Running task 843 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_configure_ptest_base)
NOTE: recipe sed-4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 844 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 845 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe sed-4.8-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 846 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 847 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 848 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install)
NOTE: recipe openssl-3.0.2-r0: task do_install: Started
NOTE: recipe ncurses-6.3-r0: task do_configure: Succeeded
NOTE: Running task 849 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_compile)
NOTE: recipe ncurses-6.3-r0: task do_compile: Started
NOTE: recipe sed-4.8-r0: task do_compile: Succeeded
NOTE: Running task 850 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_compile_ptest_base)
NOTE: recipe sed-4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 851 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_install)
NOTE: recipe sed-4.8-r0: task do_install: Started
NOTE: recipe sed-4.8-r0: task do_install: Succeeded
NOTE: Running task 852 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_install_ptest_base)
NOTE: recipe sed-4.8-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 853 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 854 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 855 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 856 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 857 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 858 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 859 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package unihash changed to 4b05867bdade1199c016c897e780a6beff86b738a34caa10e1561f75e8662243
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata became valid
NOTE: Running setscene task 239 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 860 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 861 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe ncurses-6.3-r0: task do_compile: Succeeded
NOTE: Running task 863 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_install)
NOTE: recipe ncurses-6.3-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 864 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 865 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 866 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 867 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 868 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 869 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 870 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe ncurses-6.3-r0: task do_install: Succeeded
NOTE: Running task 872 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 873 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package)
NOTE: recipe ncurses-6.3-r0: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 874 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_configure)
NOTE: recipe bash-5.1.16-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 875 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 876 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package unihash changed to 88ed7c28f08f97e94a799b0f0b8dd9c8ac40dc279791c5565a7745f12ada1968
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata became valid
NOTE: Running setscene task 236 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 878 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 879 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe openssl-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 880 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.1.16-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 881 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_configure_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.1.16-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 882 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_compile)
NOTE: recipe bash-5.1.16-r0: task do_compile: Started
NOTE: recipe perl-5.34.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 883 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_configure_ptest_base)
NOTE: recipe perl-5.34.1-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.34.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 884 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_compile)
NOTE: recipe perl-5.34.1-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 885 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot)
NOTE: Running task 886 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_package)
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 887 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_compile: Succeeded
NOTE: Running task 888 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_compile_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.1.16-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 889 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_install)
NOTE: recipe bash-5.1.16-r0: task do_install: Started
NOTE: recipe bash-5.1.16-r0: task do_install: Succeeded
NOTE: Running task 890 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_install_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_install_ptest_base: Started
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Running task 891 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: Running task 892 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 893 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 894 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 895 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_configure)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 896 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package)
NOTE: recipe bash-5.1.16-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 897 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package unihash changed to f67bf3dae329f7fafdc8d663ae478262a09fb21ef6a8447ea8409800efa87f26
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata became valid
NOTE: Running setscene task 239 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 899 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: Running task 900 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 901 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_compile)
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 902 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_install)
NOTE: recipe libidn2-2.3.2-r0: task do_install: Started
NOTE: recipe libidn2-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 903 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot)
NOTE: Running task 904 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_package)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_package: Started
NOTE: recipe openssl-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 905 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata)
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 906 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.83.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Failed
NOTE: recipe curl-7.83.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_package: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 906 tasks of which 721 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/openssl/3.0.2-r0/temp/log.do_packagedata.2733898
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata) failed with exit code '1'

--===============3485534734031617630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
DISTRO_VERSION       = "4.1+snapshot-82084648272652d0404c94135f01ff5548905d81"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:82084648272652d0404c94135f01ff5548905d81"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 1 Mirrors 0 Missed 60 Current 179 (1% match, 75% complete)
Removing 8 stale sstate objects for arch qemumips...done.
Removing 9 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 646 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 652 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 666 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_fetch)
NOTE: Running task 691 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 711 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 717 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 721 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 733 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_fetch)
NOTE: Running task 734 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe expat-2.4.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe curl-7.83.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: Running task 739 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 740 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_unpack)
NOTE: Running task 741 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 742 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 743 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 744 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 745 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 746 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 747 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 753 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 757 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 758 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_unpack)
NOTE: Running task 762 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: Running task 785 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: Running task 791 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: Running task 798 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 816 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe expat-2.4.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.0-r0: task do_unpack: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: Running task 818 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 819 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe expat-2.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_patch)
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: Running task 821 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: Running task 823 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 824 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_patch: Succeeded
NOTE: Running task 825 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 826 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_generate_toolchain_file)
NOTE: Running task 827 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 828 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: Running task 829 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 830 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: Running task 831 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 833 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.83.0-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 835 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 836 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 837 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 838 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 839 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 840 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: Running task 841 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.8-r0: task do_configure: Started
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 842 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 843 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 844 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic)
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 845 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic unihash changed to ec7873354d39fb79089a9e7c46e2570ec8e234cbe7d31cf75f439d86d4207a8f
NOTE: Running task 846 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 6f09f561172f5e0b0de101697c3b152c373dc57271bb551fb9c1dcccc44dacb6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to b2b709a98958a43dd672ee58cc9f0fe74d7b7f80d845ec4d8bf3beb389116fcc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 849 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package)
NOTE: Running task 850 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 1a238fa660e134e7f6b560a0d28e2968a1d1f9fac386169abbb977b593909d5d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_configure: Succeeded
NOTE: Running task 851 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure_ptest_base)
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 76332ecd92a10d77fc4ddc6b538f0f2e8217988eaf72b99d13b6eaf1bdd6e80f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 852 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 854 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.34.1-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package unihash changed to 70bd26aa9f9acee10619d3a5f8fb20b2342b6e5641b86e67d0fcf83a6b1a3ff9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 857 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 858 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 859 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_compile: Succeeded
NOTE: Running task 860 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: Running task 861 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 862 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install)
NOTE: recipe expat-2.4.8-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 863 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_install: Succeeded
NOTE: Running task 864 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 865 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot)
NOTE: Running task 866 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 867 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 868 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 869 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 870 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Succeeded
NOTE: Running task 871 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata)
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 872 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package unihash changed to 106f4339a6c44e6adea5cbbe318f4a5c0d626c5f3d9e4ffb8640e99b4aaf5b9f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata became valid
NOTE: Running setscene task 236 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: Running task 873 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 874 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile)
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 876 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package)
NOTE: recipe openssl-3.0.2-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package unihash changed to b2228c792b19841a216b5bc94fbdf8eab635ea7ccb3c1f9d1cdded63eb6228f1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata became valid
NOTE: Running setscene task 238 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 878 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 879 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 880 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 881 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 882 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install)
NOTE: recipe openssl-3.0.2-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 883 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 884 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 885 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 886 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 887 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 888 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 889 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 890 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 891 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 892 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 893 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 895 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 896 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 897 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 898 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package unihash changed to 4deffc779806867d0a3a45039ed10e3fbd9c7b45ff363daa99a8b708eba2a2ff
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 899 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 900 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 901 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot)
NOTE: Running task 902 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_package)
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_package: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 904 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 905 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 906 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 907 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 908 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Running task 909 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: Running task 910 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 911 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 912 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 913 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_configure)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 914 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 915 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_compile)
NOTE: Running task 916 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata)
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Failed
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 916 tasks of which 798 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/openssl/3.0.2-r0/temp/log.do_packagedata.2261506
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata) failed with exit code '1'

--===============3485534734031617630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.36.0-2.36.1.patch"

From ac3627d01e64ed20dab59d99202ce96baa5aabdf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 07:10:17 +0000
Subject: [PATCH] git: upgrade 2.36.0 -> 2.36.1

---
 meta/recipes-devtools/git/{git_2.36.0.bb => git_2.36.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.36.0.bb => git_2.36.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.36.0.bb b/meta/recipes-devtools/git/git_2.36.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.36.0.bb
rename to meta/recipes-devtools/git/git_2.36.1.bb
index 0d7d56303c..2c53616642 100644
--- a/meta/recipes-devtools/git/git_2.36.0.bb
+++ b/meta/recipes-devtools/git/git_2.36.1.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "9785f8c99daea037b8443d2f7397ac6aafbf8d5ff21fbfe2e5c0d443d126e211"
+SRC_URI[tarball.sha256sum] = "37d936fd17c81aa9ddd3dba4e56e88a45fa534ad0ba946454e8ce818760c6a2c"
-- 
2.31.1


--===============3485534734031617630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
DISTRO_VERSION       = "4.1+snapshot-82084648272652d0404c94135f01ff5548905d81"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:82084648272652d0404c94135f01ff5548905d81"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 1 Mirrors 0 Missed 60 Current 179 (1% match, 75% complete)
Removing 9 stale sstate objects for arch core2-64...done.
Removing 8 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 646 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 652 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 666 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_fetch)
NOTE: Running task 690 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 711 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 717 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 721 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 733 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_fetch)
NOTE: Running task 734 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe expat-2.4.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe curl-7.83.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_fetch: Succeeded
NOTE: Running task 737 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 739 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_unpack)
NOTE: Running task 740 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 741 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 742 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 743 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 744 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 745 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 746 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 752 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 757 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 758 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_unpack)
NOTE: Running task 762 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: Running task 785 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: Running task 791 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: Running task 798 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 816 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.0-r0: task do_unpack: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: Running task 818 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: Running task 819 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 820 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: Running task 821 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 823 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 824 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_unpack: Succeeded
NOTE: Running task 825 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_patch: Succeeded
NOTE: Running task 826 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 827 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_patch)
NOTE: Running task 828 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_generate_toolchain_file)
NOTE: Running task 829 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 830 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: Running task 831 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 832 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: recipe curl-7.83.0-r0: task do_patch: Started
NOTE: Running task 833 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 834 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe curl-7.83.0-r0: task do_patch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: Running task 836 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 837 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 838 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: Running task 839 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure)
NOTE: Running task 840 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe expat-2.4.8-r0: task do_configure: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 841 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 842 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 843 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 844 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: Running task 845 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 846 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic unihash changed to ec7873354d39fb79089a9e7c46e2570ec8e234cbe7d31cf75f439d86d4207a8f
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to 4969d3f932091bb7a2fb33a616d035cc72d8202f1d8213b883acf0bb22af1b59
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to a3e1f6a79c19b448efe9cb0479da84b37068a5029dd94c2aa6e8c727739300f5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 848 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package)
NOTE: Running task 849 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_configure: Succeeded
NOTE: Running task 851 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to d0c0a944bb0088e5e7b076187d9de0e2cba14c961da915a7d5674582a20bbdd4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 852 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 70ec575251f571a70b6274bcaa791e9860f042ea029d341bc3cd53f0fff80e86
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 854 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.34.1-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package unihash changed to 190ca427f17db7a1c2b47859b37e92dbdff292802c99ca18401faee28445de81
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 857 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 858 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe expat-2.4.8-r0: task do_compile: Succeeded
NOTE: Running task 859 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 860 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install)
NOTE: recipe expat-2.4.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_install: Succeeded
NOTE: Running task 861 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 862 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot)
NOTE: Running task 863 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_package)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 864 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 865 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Succeeded
NOTE: Running task 866 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 867 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 868 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 869 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 870 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 871 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package unihash changed to 8046e062b209f0014619d21f8d50fb5fe218a015a129252d44edea8f33215567
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata became valid
NOTE: Running setscene task 237 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 872 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: Running task 873 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 875 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package)
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package: Started
NOTE: Running task 876 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package unihash changed to 620a9a04668c1745bc701a2f05fa58dda5d36d1a5923296c277fd0fe08193e25
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 878 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 879 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: Running task 880 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 881 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: Running task 882 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 883 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 884 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 885 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 886 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 887 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 890 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 891 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 892 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 893 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 895 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 896 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 897 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 898 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 899 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 900 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.34.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package unihash changed to adca152924001f5d2b040f6106495b989ef9291d37b1669301a7c09582c837d5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 901 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot)
NOTE: Running task 902 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_package)
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_package: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 904 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 905 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 906 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 907 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 908 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Running task 909 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: Running task 910 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 911 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 912 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 913 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_configure)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 914 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 915 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_compile)
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 916 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata)
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Failed
NOTE: recipe libidn2-2.3.2-r0: task do_compile: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 916 tasks of which 798 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/openssl/3.0.2-r0/temp/log.do_packagedata.1754749
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata) failed with exit code '1'

--===============3485534734031617630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
DISTRO_VERSION       = "4.1+snapshot-82084648272652d0404c94135f01ff5548905d81"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:82084648272652d0404c94135f01ff5548905d81"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 1 Mirrors 0 Missed 60 Current 179 (1% match, 75% complete)
Removing 8 stale sstate objects for arch qemuarm...done.
Removing 9 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 646 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 652 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 666 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_fetch)
NOTE: Running task 691 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 711 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 717 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 721 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 733 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_fetch)
NOTE: Running task 734 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe expat-2.4.8-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe curl-7.83.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: Running task 739 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 740 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_unpack)
NOTE: Running task 741 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 742 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 743 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 744 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 745 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 746 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 747 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 753 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 757 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 758 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_unpack)
NOTE: Running task 762 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: Running task 785 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: Running task 792 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: Running task 798 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 816 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe curl-7.83.0-r0: task do_unpack: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Running task 818 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: Running task 819 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe expat-2.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 821 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: Running task 822 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 823 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: Running task 824 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_patch: Succeeded
NOTE: Running task 825 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_generate_toolchain_file)
NOTE: Running task 826 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.83.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 827 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 828 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 829 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 830 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: Running task 831 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 832 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.83.0-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 833 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_patch: Succeeded
NOTE: Running task 834 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 835 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: Running task 836 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 837 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 838 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure)
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 839 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 840 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.8-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 841 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 842 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 843 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 844 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic)
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: Running task 845 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 846 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_populate_lic unihash changed to ec7873354d39fb79089a9e7c46e2570ec8e234cbe7d31cf75f439d86d4207a8f
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to ff48a89f91887e5a8d383c91af40fe2e84f87bfdc181f68aaac876735be100e0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to c77ebf9ab49b5cdc32e43c4a30d2e6a20dc9adfee9ca99a00346390f2ba5ddcc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 848 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package)
NOTE: Running task 849 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_configure: Succeeded
NOTE: Running task 851 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_configure_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to ece898c431fa1fc07438571095705b552f76a78d43d88f45847d6aeb809ed04d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 0728402f80e3ec6088543c8e4f89b1de604a3c7cbf9244caf0785d0e4b48aff1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 852 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 854 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.34.1-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package unihash changed to b7c7a7dfd8c72ddb1e41eb7801af825a1d92b70b40c39a3f38c80f879a867913
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 857 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 858 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe expat-2.4.8-r0: task do_compile: Succeeded
NOTE: Running task 859 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 860 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install)
NOTE: recipe expat-2.4.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_install: Succeeded
NOTE: Running task 861 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 862 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 863 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot)
NOTE: Running task 864 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 865 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 866 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 867 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 868 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 869 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.4.8-r0: task do_package: Succeeded
NOTE: Running task 870 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 871 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 872 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_package unihash changed to 6b133794799e1c71f6fb708e12112d65e378cbb0d9309024dd97cb80af91ce9f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata became valid
NOTE: Running setscene task 236 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 873 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 875 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile)
NOTE: Running task 876 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package)
NOTE: recipe openssl-3.0.2-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package unihash changed to f18014b05ef8893a3440067b86e3df0317b8870abfafcf26e212ac4dfc82d23d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 878 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 879 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 880 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile: Succeeded
NOTE: Running task 881 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 882 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install)
NOTE: recipe openssl-3.0.2-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 883 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 884 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 885 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 886 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 887 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 890 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 891 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 892 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 893 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 895 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: Running task 896 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 897 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Running task 898 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_install: Succeeded
NOTE: Running task 899 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_install_ptest_base)
NOTE: recipe perl-5.34.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package unihash changed to 8803565da2fff7270982315284addd26df7aea848493222b224cae2aba7ff462
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata became valid
NOTE: Running setscene task 240 of 240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 900 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot)
NOTE: Running task 901 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 902 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 904 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_package_write_rpm)
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 905 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 906 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 907 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 908 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Running task 909 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: Running task 910 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 911 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 912 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 913 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_configure)
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 914 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 915 of 937 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata)
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata: Failed
NOTE: recipe libidn2-2.3.2-r0: task do_configure: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 915 tasks of which 798 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: openssl-3.0.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssl/3.0.2-r0/temp/log.do_packagedata.2005971
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata) failed with exit code '1'

--===============3485534734031617630==--

