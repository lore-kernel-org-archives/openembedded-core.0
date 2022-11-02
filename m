Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5259DC6FD22
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.881.1667349635153610915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Osh+IywR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c862ec-7bc8839a-48dd-4626-81f5-cac6ca158153-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x8YIwlKXqcRxO9hedqdicXfZq0hzzbOI7okb5fzv+WU=;
	b=Osh+IywRC4R4pY7WTb+I2Z5pAfm00Zk4bu34iIAjI21Wnyx1s+tCFymcevvt43TE
	CRGPC6OqdMn1BZ5rUQmYt6JNBASaPHUyKy7NPBu5NW5mnJTC+8XEixdpbRxn+XGGkRf
	Hz0YWxozC6RusNFdSsyVr/VOMwbjjmuYfJzSQm4E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x8YIwlKXqcRxO9hedqdicXfZq0hzzbOI7okb5fzv+WU=;
	b=aEfgqqCc0450v6G9eSF2PAAA5bLeJOvWa+1fbmLha8eJSlan9D285KmwKOHndUju
	hjOd+fTDpfmN/v9SOu1i1pRYlJSW7c4yMLhP0JtnDjEfDAYQsKNbkCqN/Dp7ea2DMim
	zyLkHjoWHjeuK1V+nHE8PvOesx8yNw3xDhDMUNkI=
Content-Type: multipart/mixed; boundary="===============0761916048381116495=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.8 SUCCEEDED
Message-ID: <0101018435c862ec-7bc8839a-48dd-4626-81f5-cac6ca158153-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172511

--===============0761916048381116495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.7-1.2.8.patch
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
--===============0761916048381116495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/alsa-utils/alsa-utils-aconnect: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-aconnect: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsactl: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsactl: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsaloop: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsaloop: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsamixer: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsamixer: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsatplg: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsatplg: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsaucm: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-alsaucm: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-amixer: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-amixer: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-aplay: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-aplay: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-aseqdump: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-aseqdump: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-aseqnet: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-aseqnet: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-dbg: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-dbg: PKGSIZE changed from 1680272 to 1678752 (-0%)
packages/core2-32-poky-linux/alsa-utils/alsa-utils-dbg: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-dev: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-dev: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-doc: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-doc: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-iecset: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-iecset: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-de: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-de: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-eu: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-fr: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-ja: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-ja: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-ru: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-ru: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-locale-sk: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-midi: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-midi: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-scripts: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-scripts: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-speakertest: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-speakertest: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-src: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-src: PKGSIZE changed from 1253202 to 1252400 (-0%)
packages/core2-32-poky-linux/alsa-utils/alsa-utils-src: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils-staticdev: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils-staticdev: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils/alsa-utils: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils/alsa-utils: PV changed from "1.2.7" to "1.2.8"
packages/core2-32-poky-linux/alsa-utils: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-32-poky-linux/alsa-utils: SRC_URI changed from "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.7.tar.bz2" to "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.8.tar.bz2"
packages/core2-32-poky-linux/alsa-utils: PV changed from "1.2.7" to "1.2.8"

--===============0761916048381116495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ce82310dfaffab80c9ba87e0f76555e98f8a1b90"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 12 Mirrors 0 Missed 35 Current 402 (25% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1016 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1072 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 1104 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_fetch)
NOTE: Running task 1105 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1130 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1178 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_fetch)
NOTE: Running task 1288 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_fetch)
NOTE: Running task 1405 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe flac-1.4.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 1542 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe flac-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1543 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 1544 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1545 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1546 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1547 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: Running task 1549 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1550 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1551 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_unpack)
NOTE: Running task 1552 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Started
NOTE: Running task 1553 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1554 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1555 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe flac-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 1557 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 1558 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 1559 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1560 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_patch)
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 1561 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_patch)
NOTE: Running task 1563 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Started
NOTE: Running task 1564 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1565 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1566 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1567 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1568 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1569 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1570 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1572 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: Running task 1573 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic unihash changed to 8ce8246e482c7058ed7ba8c556c3859af0f0e256647fa6007b0a9cdb1acfd93f
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 1574 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 1575 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 1576 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1577 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_compile)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1579 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1581 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1582 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1584 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 1585 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.0-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1586 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot)
NOTE: Running task 1590 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_package)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 1592 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 1593 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Failed
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1594 tasks of which 1533 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/alsa-lib/1.2.7.2-r0/temp/log.do_packagedata.1607773
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata) failed with exit code '1'

--===============0761916048381116495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 58 recipes from the core2-32 sysroot...done.
Removing 64 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ce82310dfaffab80c9ba87e0f76555e98f8a1b90"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 175 Local 140 Mirrors 0 Missed 35 Current 128 (80% match, 88% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 130 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 138 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 141 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running task 568 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 569 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 572 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 573 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_fetch)
NOTE: Running task 574 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 579 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_fetch)
NOTE: Running task 591 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_fetch)
NOTE: Running task 593 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe flac-1.4.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 605 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: recipe flac-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Started
NOTE: Running task 606 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: Running task 607 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 608 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_unpack)
NOTE: Running task 609 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 610 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_unpack)
NOTE: Running task 611 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: Running setscene task 173 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 177 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: Running task 612 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_unpack)
NOTE: recipe flac-1.4.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running setscene task 182 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 185 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 187 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 188 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Started
NOTE: Running task 617 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running task 618 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 629 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 630 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: Running task 631 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 632 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: Running task 641 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 642 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 197 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 653 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_patch)
NOTE: Running task 654 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Running task 655 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 205 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 209 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Started
NOTE: Running task 676 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 677 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: Running task 678 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 679 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 680 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 681 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Started
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 223 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 226 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic unihash changed to 8ce8246e482c7058ed7ba8c556c3859af0f0e256647fa6007b0a9cdb1acfd93f
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 248 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 258 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 273 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 280 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 917 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 932 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1011 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1059 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 1060 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: Running task 1061 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 1062 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 1063 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 1064 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 1065 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1066 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1067 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 1068 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1069 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1070 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1071 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1072 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1073 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1074 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.0-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1075 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1076 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1077 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1078 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Succeeded
NOTE: Running task 1079 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot)
NOTE: Running task 1080 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 1081 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 1082 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1083 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: Running task 1084 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_compile)
NOTE: recipe flac-1.4.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Succeeded
NOTE: Running task 1085 of 1114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1085 tasks of which 1022 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.7.2-r0/temp/log.do_packagedata.2256549
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata) failed with exit code '1'

--===============0761916048381116495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ce82310dfaffab80c9ba87e0f76555e98f8a1b90"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 12 Mirrors 0 Missed 35 Current 398 (25% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1013 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1066 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 1095 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_fetch)
NOTE: Running task 1096 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1120 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1168 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_fetch)
NOTE: Running task 1278 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_fetch)
NOTE: Running task 1393 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Started
NOTE: recipe flac-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: Running task 1528 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: Running task 1529 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1530 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1531 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Started
NOTE: Running task 1532 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_unpack)
NOTE: Running task 1533 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1534 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1535 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_unpack)
NOTE: Running task 1536 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 1537 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: Running task 1538 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe flac-1.4.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1539 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1540 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1541 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: Running task 1542 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1543 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 1544 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: Running task 1545 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_patch)
NOTE: recipe flac-1.4.0-r0: task do_patch: Started
NOTE: Running task 1546 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1547 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_patch)
NOTE: Running task 1548 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Running task 1549 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1550 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1551 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1552 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1553 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1554 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1555 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1556 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Started
NOTE: Running task 1557 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: Running task 1558 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 1559 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic unihash changed to 8ce8246e482c7058ed7ba8c556c3859af0f0e256647fa6007b0a9cdb1acfd93f
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 1560 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 1561 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 1562 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1563 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_compile)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1564 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1565 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1567 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1568 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1569 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1570 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_configure)
NOTE: Running task 1571 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1572 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1573 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1574 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Succeeded
NOTE: Running task 1575 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot)
NOTE: Running task 1576 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_package)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1577 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 1579 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Succeeded
NOTE: Running task 1580 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1581 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.0-r0: task do_compile: Started
NOTE: recipe flac-1.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1581 tasks of which 1519 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/alsa-lib/1.2.7.2-r0/temp/log.do_packagedata.1798881
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata) failed with exit code '1'

--===============0761916048381116495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ce82310dfaffab80c9ba87e0f76555e98f8a1b90"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 12 Mirrors 0 Missed 35 Current 402 (25% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1016 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1072 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 1101 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1102 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_fetch)
NOTE: Running task 1128 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1177 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_fetch)
NOTE: Running task 1288 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_fetch)
NOTE: Running task 1405 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe flac-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1542 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1543 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Started
NOTE: recipe flac-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 1544 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: Running task 1545 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Started
NOTE: Running task 1546 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 1547 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_unpack)
NOTE: Running task 1548 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1549 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_unpack)
NOTE: Running task 1550 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_unpack)
NOTE: Running task 1551 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 1552 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe flac-1.4.0-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 1554 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1555 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1556 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: Running task 1557 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: Running task 1558 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1560 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.0-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 1561 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_patch)
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Started
NOTE: Running task 1562 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Started
NOTE: Running task 1563 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Running task 1564 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1565 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1566 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1568 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1569 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1570 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1571 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1572 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic unihash changed to 8ce8246e482c7058ed7ba8c556c3859af0f0e256647fa6007b0a9cdb1acfd93f
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1573 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 1574 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 1575 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 1576 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1577 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_compile)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1579 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1581 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1582 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1584 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 1585 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.0-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1586 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot)
NOTE: Running task 1590 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 1592 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 1593 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: Running task 1595 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.0-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1596 tasks of which 1533 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/alsa-lib/1.2.7.2-r0/temp/log.do_packagedata.2113034
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata) failed with exit code '1'

--===============0761916048381116495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ce82310dfaffab80c9ba87e0f76555e98f8a1b90"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 11 Mirrors 0 Missed 35 Current 403 (23% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1016 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1072 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 1104 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_fetch)
NOTE: Running task 1105 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1130 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1178 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_fetch)
NOTE: Running task 1288 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_fetch)
NOTE: Running task 1405 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1542 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1543 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 1544 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: Running task 1545 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1546 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_unpack)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Started
NOTE: Running task 1547 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1548 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1549 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_unpack)
NOTE: Running task 1550 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 1551 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: Running task 1552 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 1553 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1554 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 1555 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: Running task 1557 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_patch)
NOTE: Running task 1558 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: Running task 1559 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.0-r0: task do_patch: Started
NOTE: Running task 1560 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 1561 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_patch)
NOTE: Running task 1562 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Started
NOTE: recipe flac-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1563 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Started
NOTE: Running task 1564 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1565 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1566 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1567 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1568 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1569 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1570 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: Running task 1571 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1572 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 1573 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.8-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb:do_populate_lic unihash changed to 8ce8246e482c7058ed7ba8c556c3859af0f0e256647fa6007b0a9cdb1acfd93f
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 1574 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 1575 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 1576 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1577 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1579 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1581 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1582 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1584 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_configure)
NOTE: Running task 1585 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1586 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_install)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: Running task 1589 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot)
NOTE: Running task 1590 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_package)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 1592 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 1593 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1625 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata: Failed
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1594 tasks of which 1533 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 11 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.8-r0 to 0:1.2.7.2-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.7.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/alsa-lib/1.2.7.2-r0/temp/log.do_packagedata.1439289
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata) failed with exit code '1'

--===============0761916048381116495==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.7-1.2.8.patch"

RnJvbSBmYzk3OWY2Y2I3MWY1MTZmMzhkOGJiOWRjOGZlNjIzYzc1YjFkN2Q0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxODo0NDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtdXRpbHM6IHVwZ3JhZGUgMS4yLjcgLT4gMS4yLjgKCi0tLQogLi4uL2Fsc2Eve2Fsc2EtdXRp
bHNfMS4yLjcuYmIgPT4gYWxzYS11dGlsc18xLjIuOC5iYn0gICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11dGlsc18xLjIuNy5iYiA9PiBhbHNhLXV0aWxz
XzEuMi44LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fs
c2EvYWxzYS11dGlsc18xLjIuNy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxz
YS11dGlsc18xLjIuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjcuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuOC5iYgppbmRleCBhNzhkZjJl
MTEyLi5iMzU1ZGVhY2M4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNh
L2Fsc2EtdXRpbHNfMS4yLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9h
bHNhLXV0aWxzXzEuMi44LmJiCkBAIC0yNSw3ICsyNSw3IEBAIFBBQ0tBR0VDT05GSUdbbWFucGFn
ZXNdID0gIi0tZW5hYmxlLXhtbHRvLCAtLWRpc2FibGUteG1sdG8sIHhtbHRvLW5hdGl2ZSBkb2Ni
b29rCiAKICMgYWxzYS11dGlscyBzcGVjaWZpZWQgaW4gU1JDX1VSSSBkdWUgdG8gYWxzYS11dGls
cy1zY3JpcHRzIHJlY2lwZQogU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3Jn
L2ZpbGVzL3B1Yi91dGlscy9hbHNhLXV0aWxzLSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZTkwNmJmMjQwNGZmMDRjNDQ4ZWFhM2QyMjZkMjgzYTYyYjlhMjgzZjEyZTRmZDg0
NTdmYjI0YmFjMjc0ZTY3OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMTQwZmE2MDRjMzUxZjM2
YmQ3MjE2N2M4ODYwYzY5ZDgxYjk2NGFlNmFiNTM5OTJkNjQzNGRkZTM4ZTkzMzNjIgogCiAjIE9u
IGJ1aWxkIG1hY2hpbmVzIHdpdGggcHl0aG9uLWRvY3V0aWxzIChub3QgcHl0aG9uMy1kb2N1dGls
cyAhISkgaW5zdGFsbGVkCiAjIHJzdDJtYW4gKG5vdCByc3QybWFuLnB5KSBpcyBkZXRlY3RlZCBh
bmQgY29tcGlsZSBmYWlscyB3aXRoCi0tIAoyLjMxLjEKCg==

--===============0761916048381116495==--

