Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F664CCA48A
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.980.1657900667235614328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HWUu+Ks7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 0101018202949800-963dc776-e48a-4222-95ab-898b3e97937a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rigJcw7XqI5SYhhVTls7AjJzxB38fc+JzYBb18DDPEs=;
	b=HWUu+Ks7DsM4VsC/XIYB0YToMiFtevFmPLERacuZQhAKaU5dDxKeJJjtPekqbOLs
	T83hGPKP1P02fw3ZwTy/F2sjyjIB4QmGCm4nORLmHioeG+E5oNgMEL2fo9feWoZ1YT6
	FduQ3HthGYXOoQLdTf/MOtoMvUXJ4P1o9HR1ygOQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rigJcw7XqI5SYhhVTls7AjJzxB38fc+JzYBb18DDPEs=;
	b=Xvr+0KWih6AUuUHKRmjFV1jz9yZNqSqapOshOtIV3uif8EnRvPAe/D78p+TIlJ6I
	HGdAhPcX2FhudaT1ZKNQFuBdViQg9FE0th4ZOj0kJZRPFyG8gdROPT16/imBWt7aj5v
	Tmj+K5U8LJzHODep0EObVn8N2EpfDImNl608A1Dk=
Content-Type: multipart/mixed; boundary="===============2220340757030226347=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.30.1 SUCCEEDED
Message-ID: 
 <0101018202949800-963dc776-e48a-4222-95ab-898b3e97937a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168111

--===============2220340757030226347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.30.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.30.0-1.30.1.patch
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
--===============2220340757030226347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.30.0.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.30.1.tar.bz2"
packages/core2-32-poky-linux/mpg123: PKGV changed from 1.30.0 [default] to 1.30.1 [default]
packages/core2-32-poky-linux/mpg123: PV changed from "1.30.0" to "1.30.1"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.30.0 [default] to 1.30.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 1970556 to 1972660 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PV changed from "1.30.0" to "1.30.1"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.30.0 [default] to 1.30.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dev: PV changed from "1.30.0" to "1.30.1"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.30.0 [default] to 1.30.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGSIZE changed from 41308 to 41175 (-0%)
packages/core2-32-poky-linux/mpg123/mpg123-doc: PV changed from "1.30.0" to "1.30.1"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.30.0 [default] to 1.30.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-locale: PV changed from "1.30.0" to "1.30.1"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGV changed from 1.30.0 [default] to 1.30.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 2034118 to 2035975 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-src: PV changed from "1.30.0" to "1.30.1"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.30.0 [default] to 1.30.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.30.0" to "1.30.1"
packages/core2-32-poky-linux/mpg123/mpg123: PKGV changed from 1.30.0 [default] to 1.30.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123: PV changed from "1.30.0" to "1.30.1"

--===============2220340757030226347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-71b509d311070e713290cb592c754a20a08e8ca7"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:71b509d311070e713290cb592c754a20a08e8ca7"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 75 Local 9 Mirrors 0 Missed 66 Current 454 (12% match, 87% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 498 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1287 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1425 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1453 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/alsa-lib/1.2.7.1-r0/temp/log.do_packagedata_setscene.4118471
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 528 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_package_setscene)
NOTE: Running task 1527 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1545 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1577 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1578 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1580 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1608 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1609 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1610 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 1611 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1612 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1613 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1630 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 1644 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_fetch)
NOTE: Running task 1660 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: Running task 1669 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1670 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1671 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 1672 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 1673 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1674 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Succeeded
NOTE: Running task 1675 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: Running task 1676 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1677 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: Running task 1678 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 1679 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1680 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: Running task 1681 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 1682 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 1683 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1684 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1685 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1686 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 1687 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 1688 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_unpack)
NOTE: Running task 1689 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1690 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: Running task 1691 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1692 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 1693 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: Running task 1694 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: Running task 1695 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 1696 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 1697 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: Running task 1698 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Succeeded
NOTE: Running task 1699 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 1700 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 1701 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: Running task 1702 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1703 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: Running task 1704 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Started
NOTE: Running task 1705 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: Running task 1706 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: Running task 1707 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 1708 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: Running task 1709 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1710 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1711 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 1712 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: Running task 1713 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1714 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: Running task 1715 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: Running task 1716 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1717 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: Running task 1718 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 1719 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1720 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1721 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1722 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1723 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1724 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: Running task 1725 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic unihash changed to e0536faa7e05bc743f78c392a10e12b1d71b8d17642d12c66129a0a086c15305
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1736 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1737 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1738 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1739 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Started
NOTE: Running task 1740 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d8f557ae6b90ae4b7cb968e7a42cc30e5077fbb83cf42ce3fa1363e1834895c2
NOTE: Running task 1754 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1755 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1756 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1757 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 462b0e92b3b755a9d71db7cc2bf43dcef3a94b969e5256558d0a743d52c7a4c1
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 1763 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 1765 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1766 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 1767 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1768 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: Running task 1769 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Succeeded
NOTE: Running task 1770 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Succeeded
NOTE: Running task 1771 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot)
NOTE: Running task 1772 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Succeeded
NOTE: Running task 1775 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1776 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: Running task 1777 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1780 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1781 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1782 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 1784 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1786 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1788 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1789 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: Running task 1790 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1791 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1792 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1793 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 1794 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1795 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: Running task 1796 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 1797 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1798 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1799 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1800 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1801 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 1802 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1803 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1804 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1805 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1806 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1807 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1808 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1809 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1810 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1811 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 1812 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1814 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1815 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 1816 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1817 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: Running task 1819 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 1821 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 1822 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 1823 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 1824 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 1825 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 1826 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 1828 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1829 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1830 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1831 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1832 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1833 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1834 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1835 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 1836 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 1838 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1840 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_compile)
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_install)
NOTE: recipe pulseaudio-16.1-r0: task do_install: Started
NOTE: recipe pulseaudio-16.1-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_populate_sysroot)
NOTE: Running task 1846 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_package)
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_package: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1847 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1848 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_configure)
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_package: Succeeded
NOTE: Running task 1849 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_packagedata)
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_compile)
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Started
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Succeeded
NOTE: Running task 1851 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_install)
NOTE: recipe mpg123-1.30.1-r0: task do_install: Started
NOTE: recipe mpg123-1.30.1-r0: task do_install: Succeeded
NOTE: Running task 1852 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package)
NOTE: Running task 1853 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_package: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package: Succeeded
NOTE: Running task 1854 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_packagedata)
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1855 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_write_rpm)
NOTE: Running task 1856 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_qa)
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1857 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1857 tasks of which 1678 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2220340757030226347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1661 targets, 49 skipped, 0 masked, 0 errors.
Removing 81 recipes from the core2-32 sysroot...done.
Removing 80 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-71b509d311070e713290cb592c754a20a08e8ca7"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:71b509d311070e713290cb592c754a20a08e8ca7"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 318 Local 256 Mirrors 0 Missed 62 Current 176 (80% match, 87% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 177 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 178 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 790 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Succeeded
NOTE: Running task 804 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 203 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 220 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 223 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 229 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 809 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 810 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 811 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 812 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 813 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 814 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 815 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 816 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 817 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 818 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 819 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 820 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 821 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 822 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: Running task 823 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_patch)
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 824 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 825 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: Running task 826 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 268 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running task 827 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 828 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.7.1-r0/temp/log.do_packagedata_setscene.312368
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 273 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_package_setscene)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 279 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: Running task 829 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Started
NOTE: Running setscene task 283 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 285 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 836 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 844 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 847 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 848 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 850 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 297 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 860 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 863 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 305 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 874 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 875 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running task 877 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: Running task 881 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: Running setscene task 317 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: Running setscene task 320 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 886 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 887 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 888 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 889 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 890 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 891 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 898 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 915 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 916 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 330 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: Running task 926 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 927 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 333 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 335 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 932 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 933 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic unihash changed to e0536faa7e05bc743f78c392a10e12b1d71b8d17642d12c66129a0a086c15305
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 934 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: Running task 935 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 936 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 937 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 938 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: Running task 939 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: Running task 944 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 945 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: Running task 946 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 341 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 347 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 968 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 969 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Started
NOTE: Running task 970 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 971 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.39.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 972 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 372 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 978 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 385 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running task 995 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1016 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1025 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running setscene task 443 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1075 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1080 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1105 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c3bcfa47d76639b76dea44fa0ba3ad71c3101761d3cf1e720065b1612dc111d0
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 494 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1426 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1475 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1530 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1576 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1577 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1589 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1599 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1622 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1623 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1624 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: Running task 1625 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 44e3a44b4b291e3ed7c68d2d95c7854f34a4799070ba8e67bf6289cc0d2f54c8
NOTE: Running task 1636 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1637 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1638 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1639 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 1640 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 1641 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1643 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 1644 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1645 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1646 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1647 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1648 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1649 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1650 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1651 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1652 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1653 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1654 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1655 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1656 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 1657 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1658 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: Running task 1659 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: Running task 1660 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1663 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1664 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1665 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 1666 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1667 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1668 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1669 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: Running task 1670 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 1671 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1672 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1673 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 1674 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1677 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1678 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1679 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1680 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1681 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1683 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 1684 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1685 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1686 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1687 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 1688 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1689 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 1691 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 1693 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 1694 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 1695 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 1696 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 1697 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 1698 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 1699 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 1700 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1701 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1702 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1703 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1704 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1705 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1706 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1707 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 1708 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 1709 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 1711 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1712 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1713 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 1714 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_compile)
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Succeeded
NOTE: Running task 1716 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_install)
NOTE: recipe pulseaudio-16.1-r0: task do_install: Started
NOTE: recipe pulseaudio-16.1-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_populate_sysroot)
NOTE: Running task 1718 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_package)
NOTE: recipe pulseaudio-16.1-r0: task do_package: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1719 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1720 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_configure)
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_package: Succeeded
NOTE: Running task 1721 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_packagedata)
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_compile)
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Started
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_install)
NOTE: recipe mpg123-1.30.1-r0: task do_install: Started
NOTE: recipe mpg123-1.30.1-r0: task do_install: Succeeded
NOTE: Running task 1724 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package)
NOTE: Running task 1725 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_package: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package: Succeeded
NOTE: Running task 1726 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_packagedata)
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1727 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_write_rpm)
NOTE: Running task 1728 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_qa)
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1729 of 1729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1729 tasks of which 1555 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2220340757030226347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (888 cached, 1 parsed). 1660 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-71b509d311070e713290cb592c754a20a08e8ca7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:71b509d311070e713290cb592c754a20a08e8ca7"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 75 Local 9 Mirrors 0 Missed 66 Current 454 (12% match, 87% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 498 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1287 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/alsa-lib/1.2.7.1-r0/temp/log.do_packagedata_setscene.3988948
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_package_setscene)
NOTE: Running task 1425 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1453 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1527 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1545 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1577 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1579 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1580 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1608 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1609 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1610 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 1612 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1613 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1614 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1630 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 1644 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_fetch)
NOTE: Running task 1660 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: Running task 1669 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1670 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1671 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: Running task 1672 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 1673 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1674 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: Running task 1675 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: Running task 1676 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1677 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1678 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 1679 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 1680 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: Running task 1681 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 1682 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Succeeded
NOTE: Running task 1683 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1684 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1685 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1686 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1687 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1688 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1689 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 1690 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1691 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Started
NOTE: Running task 1692 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: Running task 1693 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 1694 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 1695 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: Running task 1696 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 1697 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1698 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1699 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Succeeded
NOTE: Running task 1700 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1701 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1702 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1703 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1704 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 1705 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 1706 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1707 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1708 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: Running task 1709 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1710 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1711 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1712 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Succeeded
NOTE: Running task 1713 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1714 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: Running task 1715 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: Running task 1716 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Started
NOTE: Running task 1717 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 1718 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: Running task 1719 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1720 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1721 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1722 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1723 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 1724 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1725 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic unihash changed to e0536faa7e05bc743f78c392a10e12b1d71b8d17642d12c66129a0a086c15305
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1726 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1727 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1738 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1739 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1740 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1741 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to af9e4317f92f9aec7daa8db2de888a422ab15babc9e9f6ee7280ddf3a723c909
NOTE: Running task 1755 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1756 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1757 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 250b52555fa08fd77497226f2c08fc3fe6a0eba0cf634835d5c948be08b9c8ab
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 1763 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 1765 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1766 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 1767 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1768 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: Running task 1769 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Succeeded
NOTE: Running task 1770 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Succeeded
NOTE: Running task 1771 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot)
NOTE: Running task 1772 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: Running task 1776 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1780 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1781 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1782 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1784 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: Running task 1786 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1787 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1788 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 1789 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1790 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1791 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1792 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: Running task 1794 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 1795 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: Running task 1796 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 1797 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1798 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1799 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1800 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1801 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 1802 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1803 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1804 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1805 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1806 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1807 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1808 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1809 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: Running task 1810 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1811 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 1812 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1814 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 1817 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1818 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1819 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1820 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1821 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 1822 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1823 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 1824 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: Running task 1825 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: Running task 1826 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1827 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1828 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 1829 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 1830 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1831 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 1834 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 1835 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 1836 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 1838 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1840 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_compile)
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_install)
NOTE: recipe pulseaudio-16.1-r0: task do_install: Started
NOTE: recipe pulseaudio-16.1-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_populate_sysroot)
NOTE: Running task 1846 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_package)
NOTE: recipe pulseaudio-16.1-r0: task do_package: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1847 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1848 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_configure)
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_package: Succeeded
NOTE: Running task 1849 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_packagedata)
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_compile)
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Started
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Succeeded
NOTE: Running task 1851 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_install)
NOTE: recipe mpg123-1.30.1-r0: task do_install: Started
NOTE: recipe mpg123-1.30.1-r0: task do_install: Succeeded
NOTE: Running task 1852 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package)
NOTE: Running task 1853 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_package: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package: Succeeded
NOTE: Running task 1854 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_packagedata)
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1855 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_write_rpm)
NOTE: Running task 1856 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_qa)
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1857 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1857 tasks of which 1678 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2220340757030226347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-71b509d311070e713290cb592c754a20a08e8ca7"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:71b509d311070e713290cb592c754a20a08e8ca7"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 75 Local 9 Mirrors 0 Missed 66 Current 454 (12% match, 87% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 498 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1286 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/alsa-lib/1.2.7.1-r0/temp/log.do_packagedata_setscene.183334
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 528 of 529 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_package_setscene)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1425 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1453 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1527 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1545 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1577 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1578 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1580 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1608 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1609 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1610 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1612 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 1613 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1614 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1630 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 1644 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_fetch)
NOTE: Running task 1660 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: Running task 1669 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1670 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1671 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: Running task 1672 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: Running task 1673 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1674 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Started
NOTE: Running task 1675 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1676 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: Running task 1677 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: Running task 1678 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Succeeded
NOTE: Running task 1679 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1680 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 1681 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1682 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 1683 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: Running task 1684 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1685 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1686 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1687 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1688 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 1689 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1690 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_unpack)
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 1691 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1692 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Started
NOTE: Running task 1693 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 1694 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: Running task 1695 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: Running task 1696 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1697 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1698 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: Running task 1699 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: Running task 1700 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Succeeded
NOTE: Running task 1701 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1702 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1703 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 1704 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1705 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1706 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 1707 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: Running task 1708 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Started
NOTE: Running task 1709 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1710 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 1711 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: Running task 1712 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: Running task 1713 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1714 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1715 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Started
NOTE: Running task 1716 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1717 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1718 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1719 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 1720 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1721 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1722 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 1723 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1724 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: Running task 1725 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic unihash changed to e0536faa7e05bc743f78c392a10e12b1d71b8d17642d12c66129a0a086c15305
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1726 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1737 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: Running task 1738 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1739 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1740 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1741 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 30d681a7898866610529e06c1c10616880c5e9a72925dc44cdcc1d2742be64ac
NOTE: Running task 1755 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1756 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1757 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9fda95dd6f12a3b51c5681e9d1b5973db1d6c33406397ccc74c1acb3ca3d9e73
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 1763 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 1765 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1766 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 1767 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1768 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: Running task 1769 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Succeeded
NOTE: Running task 1770 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Succeeded
NOTE: Running task 1771 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot)
NOTE: Running task 1772 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1775 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1776 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: Running task 1777 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1780 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1781 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1782 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 1784 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1786 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1788 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: Running task 1789 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1790 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 1791 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1792 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1793 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 1794 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1795 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: Running task 1796 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 1797 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1798 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1799 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1800 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1801 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 1802 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1803 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1804 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1805 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1806 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1807 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1808 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1809 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1810 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1811 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 1812 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1814 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1817 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1818 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1819 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 1820 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 1821 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1822 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1823 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1824 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1825 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1826 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 1827 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 1828 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1829 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 1830 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 1831 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 1834 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 1835 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 1836 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 1838 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1840 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_compile)
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_install)
NOTE: recipe pulseaudio-16.1-r0: task do_install: Started
NOTE: recipe pulseaudio-16.1-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_populate_sysroot)
NOTE: Running task 1846 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_package)
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_package: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1847 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1848 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_configure)
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_package: Succeeded
NOTE: Running task 1849 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_packagedata)
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_compile)
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Started
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Succeeded
NOTE: Running task 1851 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_install)
NOTE: recipe mpg123-1.30.1-r0: task do_install: Started
NOTE: recipe mpg123-1.30.1-r0: task do_install: Succeeded
NOTE: Running task 1852 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package)
NOTE: Running task 1853 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_package: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package: Succeeded
NOTE: Running task 1854 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_packagedata)
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1855 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_write_rpm)
NOTE: Running task 1856 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_qa)
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1857 of 1857 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1857 tasks of which 1678 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2220340757030226347==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.30.0-1.30.1.patch"

From d395491d8fbb1105b8009233279a30838462f176 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 14:05:19 +0000
Subject: [PATCH] mpg123: upgrade 1.30.0 -> 1.30.1

---
 .../mpg123/{mpg123_1.30.0.bb => mpg123_1.30.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.30.0.bb => mpg123_1.30.1.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb
index f80bfa6550..502d9d114c 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "397ead52f0299475f2cefd38c3835977193fd9b1db6593680346c4e9109ed61c"
+SRC_URI[sha256sum] = "1b20c9c751bea9be556749bd7f97cf580f52ed11f2540756e9af26ae036e4c59"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.31.1


--===============2220340757030226347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-71b509d311070e713290cb592c754a20a08e8ca7"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:71b509d311070e713290cb592c754a20a08e8ca7"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 75 Local 9 Mirrors 0 Missed 66 Current 450 (12% match, 87% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 494 of 525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1276 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1413 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1441 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1515 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1533 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/alsa-lib/1.2.7.1-r0/temp/log.do_packagedata_setscene.53721
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 524 of 525 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_package_setscene)
NOTE: Running task 1565 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1566 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1568 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1594 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 1595 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1596 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1597 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1598 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1600 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1616 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 1630 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_fetch)
NOTE: Running task 1646 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: Running task 1655 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1656 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: Running task 1657 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: Running task 1658 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 1659 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1660 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 1661 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: Running task 1662 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1663 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 1664 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1665 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: Running task 1666 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 1667 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: Running task 1668 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1669 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1670 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1671 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1672 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1673 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1674 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1675 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1676 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: Running task 1677 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1678 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1679 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 1680 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1681 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: Running task 1682 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: Running task 1683 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: Running task 1684 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe mpg123-1.30.1-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1685 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_patch)
NOTE: Running task 1686 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: Running task 1687 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1688 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1689 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Started
NOTE: Running task 1690 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 1691 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1692 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: Running task 1693 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1694 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: Running task 1695 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1696 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1697 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: Running task 1698 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1699 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1700 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: Running task 1701 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 1702 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1703 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1704 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1705 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: Running task 1706 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1707 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1708 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1709 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 1710 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_lic unihash changed to e0536faa7e05bc743f78c392a10e12b1d71b8d17642d12c66129a0a086c15305
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: Running task 1711 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.30.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1712 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1713 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1724 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata)
NOTE: Running task 1725 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1726 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1727 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d0296acc6b732820a032bda061838f1d6ab1682042cef2156b1285de62717773
NOTE: Running task 1741 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1742 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1743 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2e428de46361edb92c601b3851f60a39cb2d85a3d3601d44e46ca5d0c0acdb58
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1748 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 1749 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1752 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 1753 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: Running task 1755 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Succeeded
NOTE: Running task 1756 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Succeeded
NOTE: Running task 1757 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot)
NOTE: Running task 1758 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1759 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1761 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: Running task 1762 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: Running task 1763 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1764 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1765 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1766 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1767 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 1768 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1769 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1770 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1771 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: Running task 1773 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1775 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1776 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1777 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1778 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1779 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 1780 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1781 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: Running task 1782 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: Running task 1784 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1785 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1787 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 1788 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1790 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1791 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1792 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1794 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1795 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1796 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1797 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 1798 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1799 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 1800 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1801 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1802 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 1803 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1804 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 1805 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: Running task 1806 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1807 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1808 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1809 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1810 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1811 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1812 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1813 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 1814 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1815 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 1816 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 1817 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 1818 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 1819 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 1821 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 1822 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 1824 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 1825 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1826 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1827 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 1828 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_compile)
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.1-r0: task do_compile: Succeeded
NOTE: Running task 1830 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_install)
NOTE: recipe pulseaudio-16.1-r0: task do_install: Started
NOTE: recipe pulseaudio-16.1-r0: task do_install: Succeeded
NOTE: Running task 1831 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_populate_sysroot)
NOTE: Running task 1832 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_package)
NOTE: recipe pulseaudio-16.1-r0: task do_package: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1833 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1834 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_configure)
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_package: Succeeded
NOTE: Running task 1835 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_packagedata)
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.1-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_configure: Succeeded
NOTE: Running task 1836 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_compile)
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Started
NOTE: recipe mpg123-1.30.1-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_install)
NOTE: recipe mpg123-1.30.1-r0: task do_install: Started
NOTE: recipe mpg123-1.30.1-r0: task do_install: Succeeded
NOTE: Running task 1838 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package)
NOTE: Running task 1839 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.30.1-r0: task do_package: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.30.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_packagedata)
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.30.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1841 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_write_rpm)
NOTE: Running task 1842 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_package_qa)
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.30.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.30.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1843 of 1843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1843 tasks of which 1664 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.7.2-r0 to 0:1.2.7.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2220340757030226347==--

