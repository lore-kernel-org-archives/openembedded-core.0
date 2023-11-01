Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFB3C04A95
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.8505.1698848706881351830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eZdju4Tu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NIpgtLw7;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b460e4f-b3f67637-b4d1-411c-bb2b-0f399855056a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qXwtusYPVrRycibOpP4FuvM0lr8t3DQB3mLtboXdPLQ=;
	b=eZdju4TuRvEF/G+4BlStv1es4x8FfzEkvAV1I1sPb4rMzfkUkdgu7e4eXJz0bBAG
	HQfjREs422veK1UKlWt+Gxta3jlsgwixaDumNnf+bMP4VFUuOtvzaMcAIluxr8Bsf2/
	BrTppraz2WNOmFADNjnWkTpAfMNjMyBecMezKIs8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qXwtusYPVrRycibOpP4FuvM0lr8t3DQB3mLtboXdPLQ=;
	b=NIpgtLw7XcPXHhyNlkbhgGcGtWj9c6jY+5PmOsdued1X+vDUyBwpYvxrHbwk4C42
	uFN97DDvXB13fLoEbfld0OaSIhM1C2/eqOt/7TBw8GjbwvF4MlXztktHd7ugvQ+8ySz
	AacsvB8JNKhm0HQEYJmKAkXLTQTFvd8WcKhZl3mo=
Content-Type: multipart/mixed; boundary="===============7168963258621447745=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 35f796542ee5d7e775643f526973aa75f483bf20
 SUCCEEDED
Message-ID: <0101018b8b460e4f-b3f67637-b4d1-411c-bb2b-0f399855056a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190033

--===============7168963258621447745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *35f796542ee5d7e775643f526973aa75f483bf20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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

-- >8 --
From d234bcb3963ef31723c68c4c2e832daad67fba5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:55:30 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index d7089ef95d..a6ecd7a0e1 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "2d9e414ee316b37143954150016e8f4f18358497"
+SRCREV = "35f796542ee5d7e775643f526973aa75f483bf20"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.39.2


--===============7168963258621447745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19532880 to 19532952 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3837742 to 3837761 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e

--===============7168963258621447745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b3862316b2c765c98d314f76489b6734da7f9dc8"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b3862316b2c765c98d314f76489b6734da7f9dc8"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 136 Local 62 Mirrors 0 Missed 74 Current 791 (45% match, 92% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 817 of 927 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 820 of 927 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 824 of 927 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 846 of 927 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 924 of 927 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjpeg-turbo/3.0.0/temp/log.do_packagedata_setscene.3580615
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 925 of 927 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_package_setscene)
NOTE: Running task 1817 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa)
NOTE: Running task 1818 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa)
NOTE: Running task 1819 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa)
NOTE: Running task 1830 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa)
NOTE: Running task 1946 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa)
NOTE: Running task 1974 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa: Started
NOTE: Running task 2016 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_write_config)
NOTE: Running task 2017 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_write_config)
NOTE: Running task 2030 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_write_config)
NOTE: Running task 2056 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa)
NOTE: Running task 2082 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa)
NOTE: Running task 2083 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa)
NOTE: Running task 2085 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2122 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa)
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2138 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 2147 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_fetch)
NOTE: Running task 2155 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_fetch)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2167 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_recipe_qa)
NOTE: Running task 2176 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_fetch)
NOTE: Running task 2178 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_write_config)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2235 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_write_config)
NOTE: Running task 2249 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_package_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa: Started
NOTE: recipe pango-1.51.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Started
NOTE: recipe pango-1.51.0-r0: task do_fetch: Started
NOTE: Running task 2338 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: Running task 2339 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.13-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_write_config: Succeeded
NOTE: Running task 2340 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_unpack)
NOTE: Running task 2341 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_unpack)
NOTE: Running task 2342 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.51.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Started
NOTE: Running task 2343 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2344 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_unpack)
NOTE: Running task 2345 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_unpack)
NOTE: Running task 2346 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2347 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 2348 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Succeeded
NOTE: Running task 2349 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2350 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_fetch)
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: Running task 2351 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 2352 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.13-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2353 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Started
NOTE: Running task 2354 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 2355 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: Running task 2356 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: Running task 2357 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Succeeded
NOTE: Running task 2358 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_unpack)
NOTE: Running task 2359 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2360 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: Running setscene task 927 of 927 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2361 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 2362 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2363 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_patch)
NOTE: Running task 2364 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2365 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_patch)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 2366 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: Running task 2367 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2368 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.51.0-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2369 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_patch)
NOTE: Running task 2370 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe fribidi-1.0.13-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2384 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 2387 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: Running task 2388 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: Running task 2393 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2394 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata)
NOTE: Running task 2397 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2398 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2399 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_patch)
NOTE: recipe pango-1.51.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2400 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2401 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.51.0-r0: task do_patch: Succeeded
NOTE: Running task 2403 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2404 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2405 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2406 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2407 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2408 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 458c0c6ac781fde126e5353fe378356c35d45f3d649603399a6021a03dfb4916
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: Running task 2422 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_configure)
NOTE: Running task 2423 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 2424 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2425 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2426 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2427 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_patch)
NOTE: Running task 2429 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Succeeded
NOTE: Running task 2430 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-8.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2431 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_patch)
NOTE: Running task 2432 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 81d74494b266d3f40617daff04a9c972ef12aa7b6c281f95139d5211515d4540 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'fe496478448e55f676751b5b577f7ce08498b83179e168cab8cc82bed1ad6a5d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '81d74494b266d3f40617daff04a9c972ef12aa7b6c281f95139d5211515d4540'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed fe496478448e55f676751b5b577f7ce08498b83179e168cab8cc82bed1ad6a5d -> 81d74494b266d3f40617daff04a9c972ef12aa7b6c281f95139d5211515d4540 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2438 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2439 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_configure)
NOTE: recipe harfbuzz-8.2.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.13-r0: task do_configure: Succeeded
NOTE: Running task 2440 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_compile)
NOTE: recipe fribidi-1.0.13-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.13-r0: task do_compile: Succeeded
NOTE: Running task 2441 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_install)
NOTE: recipe fribidi-1.0.13-r0: task do_install: Started
NOTE: recipe fribidi-1.0.13-r0: task do_install: Succeeded
NOTE: Running task 2442 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot)
NOTE: Running task 2443 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_package)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.13-r0: task do_package: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2444 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_compile)
NOTE: recipe fribidi-1.0.13-r0: task do_package: Succeeded
NOTE: Running task 2445 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata)
NOTE: recipe harfbuzz-8.2.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2446 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2448 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2449 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxi-1_1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2450 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_compile: Started
NOTE: Running task 2451 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2454 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2455 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2457 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxi-1_1.8.1-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: Running task 2458 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_package)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 2462 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2464 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2465 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2467 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: Running task 2471 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2472 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2473 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2474 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2477 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2478 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2481 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2482 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Succeeded
NOTE: Running task 2483 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_install)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Succeeded
NOTE: Running task 2485 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot)
NOTE: Running task 2486 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_package)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2489 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_install)
NOTE: recipe harfbuzz-8.2.1-r0: task do_install: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot)
NOTE: Running task 2491 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_package)
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_package: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2492 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2493 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure)
NOTE: recipe pango-1.51.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_package: Succeeded
NOTE: Running task 2494 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata: Failed
NOTE: recipe pango-1.51.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2494 tasks of which 2354 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-src went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dbg went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package jpeg-tools went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libturbojpeg went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-staticdev went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-dev went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-doc went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo-locale went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libjpeg-turbo went backwards which would break package feeds (from 1:3.0.1-r0 to 1:3.0.0-r0) [version-going-backwards]
ERROR: libjpeg-turbo-1_3.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:8.2.2-r0 to 0:8.2.1-r0) [version-going-backwards]
ERROR: harfbuzz-8.2.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/harfbuzz/8.2.1/temp/log.do_packagedata.3631793
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata) failed with exit code '1'

--===============7168963258621447745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+35f796542e

--===============7168963258621447745==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBkMjM0YmNiMzk2M2VmMzE3MjNjNjhjNGMyZTgzMmRhYWQ2N2ZiYTVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzo1NTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCBkNzA4OWVmOTVkLi5hNmVjZDdhMGUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gIjJkOWU0MTRlZTMxNmIzNzE0Mzk1NDE1MDAxNmU4ZjRm
MTgzNTg0OTciCitTUkNSRVYgPSAiMzVmNzk2NTQyZWU1ZDdlNzc1NjQzZjUyNjk3M2FhNzVmNDgz
YmYyMCIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============7168963258621447745==--

