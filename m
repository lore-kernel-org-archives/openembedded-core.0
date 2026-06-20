Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143B2CDB472
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 05:56:48 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1579.1781935007055364577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 22:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DAqTNALf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CIgoWNnr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ee39a61c9-7aa1d04d-03c9-4d1b-813c-355886645c34-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781935006;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9/NXJaMpokLF+B0D/5KPzk8LYEm1dOaHpdEDHA7Ft48=;
	b=DAqTNALfWqFb5CubDGsh+edli+7ehKtCUANCFPjBtrpQLaBRqQ2ArqGgfc3gczJL
	/QPcfCBO6+tcD9LHvo/ZrEGzSZrV2z6gWfNJajwrLEiMcjxp5s/AdnnUPkqwZIhwpWD
	lM3CrcXXuXtr/8/IVZ1f27EUSjNYFwemxmTpdEpE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781935006;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9/NXJaMpokLF+B0D/5KPzk8LYEm1dOaHpdEDHA7Ft48=;
	b=CIgoWNnr5ws3gyTz97ekx8TpSzXeMU9lBJFiVfTIFrgGJb/vMrLZSSajjaVzsgsx
	uOUeGfUkNh0Y63ectmzF7CmIxDe+HqgexQ3F3m3kMEEw8cKUU8cHELd5bFB6Kz3w28a
	0wFx8aaCEJiwPCLG1Hlj4kCM5JsFAopYzx+LG9vk=
Content-Type: multipart/mixed; boundary="===============0504420222999317837=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 321 SUCCEEDED
Message-ID: <0101019ee39a61c9-7aa1d04d-03c9-4d1b-813c-355886645c34-000000@us-west-2.amazonses.com>
Date: Sat, 20 Jun 2026 05:56:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.20-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 05:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239202

--===============0504420222999317837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *321* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-319-321.patch
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
From 4f556518d454d15235d627cf669545f7c5c284b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 20 Jun 2026 05:56:38 +0000
Subject: [PATCH] diffoscope: upgrade 319 -> 321

---
 .../diffoscope/{diffoscope_319.bb => diffoscope_321.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_319.bb => diffoscope_321.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_319.bb b/meta/recipes-support/diffoscope/diffoscope_321.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_319.bb
rename to meta/recipes-support/diffoscope/diffoscope_321.bb
index 258dab9027..1344669c84 100644
--- a/meta/recipes-support/diffoscope/diffoscope_319.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_321.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "990d8ac71a5e7045c8ad6c66353f6a0dcbf5537ab323295e31bd795b043aa916"
+SRC_URI[sha256sum] = "334ed39f13f92a1ffad5018a4038a88dacc4a287996601082d8af4428e1f0493"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============0504420222999317837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "319" to "321"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 319 [default] to 321 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "319" to "321"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 319 [default] to 321 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "319" to "321"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 319 [default] to 321 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "319" to "321"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 319 [default] to 321 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "319" to "321"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 319 [default] to 321 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "319" to "321"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 319 [default] to 321 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411758 to 1412068 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "319" to "321"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-321.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-321.dist-info
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 319 [default] to 321 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "319" to "321"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-319.tar.gz;downloadfilename=diffoscope-319.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-321.tar.gz;downloadfilename=diffoscope-321.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 319 [default] to 321 [default]
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-319.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-321.dist-info

--===============0504420222999317837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-326d8a68cccb59ed265b3581925ef5f81e6d2f9d"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:326d8a68cccb59ed265b3581925ef5f81e6d2f9d"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 844 Local 663 Mirrors 0 Missed 181 Current 222 (78% match, 83% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 230 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 307 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_populate_lic_setscene)
NOTE: Running setscene task 336 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 345 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 415 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 418 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 441 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffoscope-321-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe debugedit-5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe patchelf-native-0.18.0+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-native-5.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_spdx_setscene)
NOTE: recipe diffoscope-321-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 444 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 448 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe patchelf-native-0.18.0+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 458 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 462 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-native-5.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.6-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 469 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_recipe_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pytest/9.1.0/temp/log.do_packagedata_setscene.1198599
NOTE: Running setscene task 471 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 472 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe perl-5.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vim-9.2.0569-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 478 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 482 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vim-9.2.0569-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 499 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 504 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 505 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 506 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_package_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patchelf-native-0.18.0+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe patchelf-native-0.18.0+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 509 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 520 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 522 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 523 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 528 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 533 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 535 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 538 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 540 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 547 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe file-native-5.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 554 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe file-native-5.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 573 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 581 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 586 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 591 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 592 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 598 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 614 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_package_setscene)
NOTE: Running setscene task 615 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 620 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 621 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 628 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 633 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.46.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 636 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 656 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 660 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 661 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 662 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 666 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 671 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 672 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 675 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 677 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 684 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 685 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 693 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 704 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 706 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 707 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 711 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 714 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 737 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 740 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe perl-native-5.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-native-5.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 749 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 751 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 755 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 759 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-native-5.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 766 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 777 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe perl-native-5.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 781 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 796 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe perlcross-native-1.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 808 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 824 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 830 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 834 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnu-config-native-20250709+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 853 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnu-config-native-20250709+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 856 of 1066 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe perlcross-native-1.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gnu-config-native-20250709+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 859 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 861 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot_setscene)
NOTE: Running task 670 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_fetch)
NOTE: recipe gnu-config-native-20250709+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 754 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_fetch)
NOTE: Running task 799 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_write_config)
NOTE: Running task 830 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 832 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_fetch)
NOTE: Running task 841 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: Running task 847 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch)
NOTE: Running task 848 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 849 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_fetch)
NOTE: Running task 866 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: Running task 868 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_fetch)
NOTE: Running task 869 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_write_config)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Started
NOTE: Running task 884 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_write_config: Started
NOTE: recipe binutils-2.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: Running setscene task 862 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_recipe_qa_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_fetch: Started
NOTE: recipe lua-5.5.0-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_write_config: Succeeded
NOTE: Running task 899 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_write_config: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 920 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: Running task 921 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_fetch)
NOTE: Running task 925 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_fetch)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe binutils-2.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 933 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_recipe_qa)
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe perl-5.42.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.194-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-321-r0: task do_recipe_qa: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_fetch: Succeeded
NOTE: Running task 934 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe diffoscope-321-r0: task do_recipe_qa: Succeeded
NOTE: Running task 936 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_fetch)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_patch)
NOTE: Running task 938 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_unpack)
NOTE: Running task 939 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_unpack)
NOTE: recipe diffoscope-321-r0: task do_fetch: Started
NOTE: recipe diffoscope-321-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Succeeded
NOTE: Running task 943 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: Running task 944 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_unpack)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 945 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_patch: Succeeded
NOTE: Running task 946 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running task 947 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 948 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_unpack)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_patch)
NOTE: recipe lua-5.5.0-r0: task do_unpack: Started
NOTE: recipe lua-5.5.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_unpack: Succeeded
NOTE: Running task 950 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_patch)
NOTE: Running task 951 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_deploy_source_date_epoch unihash changed to e61fe574ae5a8ec91df5994a9d21288d5261d5f621edb1f0cd0b327e3e6575c6
NOTE: recipe libpcre2-10.47-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch unihash changed to 732724e51121d45b7847f28ba61659bc914c70ac67894fa8818fa82c3af7be7b
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_patch: Succeeded
NOTE: Running task 952 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 953 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 954 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 955 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_check_backend)
NOTE: Running task 956 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe lua-5.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_check_backend: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_check_backend: Succeeded
NOTE: Running task 969 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 970 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_unpack: Succeeded
NOTE: Running task 971 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_unpack)
NOTE: recipe binutils-2.46.1-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_patch: Started
NOTE: recipe diffoscope-321-r0: task do_unpack: Started
NOTE: recipe lua-5.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_deploy_source_date_epoch unihash changed to d726715f8cc609892fb385923eccdbe651c0d3f45ffc29e69333f531f839d088
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-321-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch unihash changed to d8c9b1de2cc9629a79c715707cc15560ed717caaa86a835532d6045ee48b6536
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_patch: Succeeded
NOTE: Running task 979 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 980 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 981 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_patch)
NOTE: Running task 986 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_fetch)
NOTE: Running task 987 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_fetch)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-321-r0: task do_patch: Started
NOTE: recipe vim-9.2.0569-r0: task do_fetch: Started
NOTE: recipe binutils-2.46.1-r0: task do_fetch: Succeeded
NOTE: Running task 988 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe diffoscope-321-r0: task do_patch: Succeeded
NOTE: Running task 993 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 994 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1000 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch unihash changed to fda6fd7fc71dcd19b52729fb5b9917f783601fd945e0279b9066dad9aaf33efe
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_deploy_source_date_epoch unihash changed to 89801a65718b7c17db9d580c8fc2a62c48c77aa6acaf70b89ca972c67d18930e
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.194-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 838 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running setscene task 853 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 855 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.42.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 856 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 863 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_package_setscene)
NOTE: Running setscene task 872 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_package_setscene)
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 882 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 883 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 886 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_package_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_package_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1002 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1013 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_unpack)
NOTE: Running task 1014 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1020 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1021 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 894 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 895 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 896 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe json-c-0.18-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 897 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_deploy_source_date_epoch unihash changed to 89801a65718b7c17db9d580c8fc2a62c48c77aa6acaf70b89ca972c67d18930e
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 891 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 894 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 895 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 897 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 899 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 900 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 910 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 911 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 912 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 913 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_package_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1025 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running setscene task 920 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1027 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_package_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_fetch: Succeeded
NOTE: Running task 1028 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1030 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_package_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: Running task 1036 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_package_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 923 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 925 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 927 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 928 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_package_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 929 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 930 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 938 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_fetch: Succeeded
NOTE: Running setscene task 942 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 943 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 944 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_package_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 955 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_package_setscene: Started
NOTE: Running setscene task 956 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 958 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 965 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_package_setscene)
NOTE: recipe libcap-2.78-r0: task do_package_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1177 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_fetch)
NOTE: Running task 1179 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1185 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_package_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 967 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.7-r0: task do_fetch: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1195 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe json-c-0.18-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1196 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 968 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 969 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_package_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 970 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 971 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_patch: Succeeded
NOTE: Running setscene task 972 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 973 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 974 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 975 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_fetch: Succeeded
NOTE: Running setscene task 976 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1200 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe binutils-2.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 1202 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1203 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1205 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1207 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe gnutls-3.8.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 980 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 981 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 982 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_package_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 983 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 985 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running setscene task 988 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 989 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 990 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 993 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 995 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_package_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 996 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package_setscene)
NOTE: Running setscene task 999 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1005 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1220 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: Running task 1221 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1228 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: Running task 1234 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: Running task 1235 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.7-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1011 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1236 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1242 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1243 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1012 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_patch: Started
NOTE: Running task 1245 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1013 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: Running task 1247 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1249 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: Running task 1250 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: Running setscene task 1014 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1251 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 1253 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_patch)
NOTE: Running setscene task 1015 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1017 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.194-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1255 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1256 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1018 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: Running setscene task 1019 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1259 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1261 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1263 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1264 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_patch)
NOTE: Running task 1273 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_patch)
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: Running task 1278 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: Running task 1282 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: recipe lz4-1_1.10.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: Running task 1284 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1286 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: Running task 1288 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_unpack)
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: Running task 1290 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: Running task 1291 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1292 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch unihash changed to b5648a04c3eaa53514d7e6c542e884b5415d2920c64692c597d9a7175574c9a3
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 999 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1020 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1293 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: Running task 1294 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_patch)
NOTE: Running task 1296 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_patch)
NOTE: Running task 1297 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_unpack)
NOTE: Running task 1303 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe perl-5.42.2-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_deploy_source_date_epoch unihash changed to a7fe7698f97972f53c0f3810cab0515555cb351fae0ef51bdda2d46f32f2f523
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1023 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1309 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.46.1-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1028 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch unihash changed to bd37bb34ef3f5c40bcfd4b652faaeba8c1a9cabfd7749b844a50632357d911bd
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1311 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 1312 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: Running task 1315 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1321 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: Running task 1322 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1324 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_unpack)
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: Running task 1328 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1035 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1036 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch unihash changed to 73e76bf06240a91e0b6c22691db78d3dde06dfba8b7b2bd2dc4d89c99b409f41
NOTE: Running setscene task 1035 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch unihash changed to 1737d26e3b26bc9d38e25ea84093f5fa98531b813c0e4a3a043cb418e2fd613b
NOTE: recipe elfutils-0.194-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1329 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1330 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: Running task 1336 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: Running task 1353 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1360 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_patch)
NOTE: Running task 1382 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe xxhash-0.8.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1384 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.42.2-r0: task do_patch: Started
NOTE: recipe diffoscope-321-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1394 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_patch: Succeeded
NOTE: Running task 1408 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1419 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_check_backend)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-321-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-321-r0: task do_check_backend: Started
NOTE: Running setscene task 1048 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-321-r0: task do_check_backend: Succeeded
NOTE: Running setscene task 1051 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1432 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_patch)
NOTE: Running task 1434 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch unihash changed to 3096cd7d02a78c7c51e4d2df6f545a4ba811e84d2d83598c827ee67d011e0e45
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1435 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1437 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_check_backend)
NOTE: Running setscene task 1056 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1443 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1444 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1446 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 1058 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1447 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_check_backend: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_check_backend: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1463 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1066 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1499 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1503 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx)
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: Running task 1510 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_recipe_spdx)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1511 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1599 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_deploy_source_date_epoch unihash changed to 1e6284a88a8b1f5960dfc3ae2c3a44442dd884cb153284c4e10e35ccf03f0741
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1831 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1833 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.42.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_deploy_source_date_epoch unihash changed to 4ee68ec6eeeacc4dc0e5c2986524042b5a895befa72ad61b788db50b91a07f6e
NOTE: recipe rpm-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1892 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1900 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1926 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe lz4-1_1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1949 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1973 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1974 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1980 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_recipe_spdx)
NOTE: recipe libpcre2-10.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1981 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_create_recipe_spdx)
NOTE: Running task 1982 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_configure)
NOTE: recipe rpm-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe perl-5.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-321-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1983 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure)
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpcre2-10.47-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_configure: Started
NOTE: Running task 1984 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe perl-5.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1985 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 1987 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_configure)
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1988 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_configure: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: Running task 1989 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1990 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_recipe_spdx)
NOTE: Running task 1991 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_create_recipe_spdx)
NOTE: recipe perl-5.42.2-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe xxhash-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1992 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_unpack)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1993 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile)
NOTE: Running task 1994 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_configure)
NOTE: recipe diffoscope-321-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1995 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_configure)
NOTE: recipe xxhash-0.8.3-r0: task do_unpack: Started
NOTE: Running task 1996 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_configure: Started
NOTE: recipe debugedit-5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1998 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_create_recipe_spdx)
NOTE: recipe diffoscope-321-r0: task do_configure: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1999 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2021 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2024 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.8.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2025 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-321-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 2027 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_compile)
NOTE: recipe xxhash-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2028 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe diffoscope-321-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2029 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_compile)
NOTE: recipe libarchive-3.8.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2037 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_unpack)
NOTE: recipe xxhash-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2074 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_compile: Started
NOTE: Running task 2100 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_recipe_spdx)
NOTE: recipe debugedit-5.2-r0: task do_unpack: Started
NOTE: recipe xxhash-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2101 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe debugedit-5.2-r0: task do_unpack: Succeeded
NOTE: Running task 2102 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_patch)
NOTE: recipe json-c-0.18-r0: task do_create_recipe_spdx: Started
NOTE: recipe xxhash-0.8.3-r0: task do_patch: Started
NOTE: recipe debugedit-5.2-r0: task do_patch: Started
NOTE: recipe xxhash-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2103 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2154 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe xxhash-0.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.18-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2167 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_create_recipe_spdx)
NOTE: recipe debugedit-5.2-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx)
NOTE: recipe binutils-2.46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx: Started
NOTE: recipe xxhash-0.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_deploy_source_date_epoch unihash changed to 8d8dd0c9b4e31d687590819c6288d592cc119a4db50790a9cf8290507bfe095b
NOTE: Setscene tasks completed
NOTE: Running task 2173 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_configure)
NOTE: recipe rpm-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2174 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2175 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe xxhash-0.8.3-r0: task do_configure: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe binutils-2.46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2176 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_configure)
NOTE: recipe rpm-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2177 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_compile)
NOTE: Running task 2182 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_recipe_spdx)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2184 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: recipe xxhash-0.8.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch unihash changed to 2d0cb9546a7a064cb561bb968521cac8e0600b8b897e218fa04d35b7fe6e20c3
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 2187 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2188 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-321-r0: task do_compile: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2189 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_install)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_create_recipe_spdx)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: Running task 2204 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_compile_ptest_base)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2215 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-321-r0: task do_install: Started
NOTE: recipe elfutils-0.194-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe debugedit-5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2216 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_install)
NOTE: recipe debugedit-5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_deploy_source_date_epoch unihash changed to 800580b72b95d9d8665eb17b9ea6774c44dcf01dc0a159d5e3c0248f52e2cb5a
NOTE: recipe elfutils-0.194-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2217 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_create_spdx)
NOTE: Running task 2257 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2258 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2267 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx)
NOTE: recipe libarchive-3.8.7-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_install: Succeeded
NOTE: Running task 2268 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-9.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2270 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_recipe_spdx)
NOTE: Running task 2273 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx)
NOTE: recipe diffoscope-321-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2274 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_package)
NOTE: Running task 2275 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-321-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2276 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2277 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_create_spdx)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Running task 2280 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_spdx)
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx: Succeeded
NOTE: Running task 2289 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_populate_sysroot)
NOTE: recipe libcap-2.78-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-321-r0: task do_populate_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_create_spdx: Succeeded
NOTE: Running task 2290 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_spdx)
NOTE: recipe file-5.48-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_create_spdx: Succeeded
NOTE: Running task 2291 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.8.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2297 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx)
NOTE: Running task 2298 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-321-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.48-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: Running task 2299 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_spdx)
NOTE: Running task 2300 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx)
NOTE: recipe nettle-4.0-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata unihash changed to cac0d8a5770e32d34366730584fcd1d582f1448d253fc9a733ceac220a47bd26
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2304 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_recipe_spdx)
NOTE: Running task 2305 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_recipe_spdx)
NOTE: recipe binutils-2.46.1-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2306 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_compile)
NOTE: Running task 2307 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_create_recipe_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe binutils-2.46.1-r0: task do_compile: Started
NOTE: recipe lua-5.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2308 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_recipe_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2309 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_recipe_spdx)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2310 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe lua-5.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package: Succeeded
NOTE: Running task 2311 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx)
NOTE: recipe lz4-1_1.10.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2312 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_packagedata)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-321-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_packagedata: Started
NOTE: Running task 2313 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nettle-4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2314 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx)
NOTE: recipe diffoscope-321-r0: task do_packagedata: Started
NOTE: Running task 2315 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_create_spdx)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2316 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx)
NOTE: Running task 2318 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_create_recipe_spdx)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2322 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_create_recipe_spdx)
NOTE: recipe gnutls-3.8.13-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-321-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_packagedata unihash changed to 41690c6048407ea4b9fbba564ae79418551244976bdc74fb8235322a6067e390
NOTE: Setscene tasks completed
NOTE: Running task 2323 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe diffoscope-321-r0: task do_packagedata: Succeeded
NOTE: Running task 2324 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2325 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_create_recipe_spdx)
NOTE: recipe diffoscope-321-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2326 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_create_spdx)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vim-9.2.0569-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2327 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_recipe_spdx)
NOTE: recipe json-c-0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 2328 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.20.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe diffoscope-321-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_populate_sysroot: Started
NOTE: recipe vim-9.2.0569-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2329 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_create_recipe_spdx)
NOTE: recipe rpm-1_4.20.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2330 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-magic-0.4.27-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2331 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_ipk)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe binutils-2.46.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2332 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_create_spdx)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_ipk: Started
NOTE: recipe diffoscope-321-r0: task do_create_spdx: Succeeded
NOTE: Running task 2333 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_deb)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2334 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2335 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_rpm)
NOTE: recipe binutils-2.46.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2336 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_qa)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_qa: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2337 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_ipk)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_ipk: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2338 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_deb)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_ipk unihash changed to 70d4509e4c642497f08e78f8121fab3332c46b8b6c44bf8392fc1d2223f01050
NOTE: Running task 2339 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_deb: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_qa unihash changed to 771fd593471f83e35cb82e0619322cabd83333ea7c663fa2f1805cd3d2c406f1
NOTE: Running task 2340 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_qa)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_deb unihash changed to 8701811d2c06076e3555bedd0b4602f94148c8c767bd4a8d6fe97933a2dd12f8
NOTE: recipe python3-magic-0.4.27-r0: task do_package_qa: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_ipk unihash changed to 0854c73193666ebeff073eb5a21c5678d73f9cbf4929226b21e922e81eaa90b7
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_qa unihash changed to dee17bc1ab964966aeb0aaf19171c1df3462c83d8dd14e358859c41bf4d37a9c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_deb unihash changed to f86c5ba7c54145a59f1801230ab1d3ffdd12211e4087dd4c249257381b56df3f
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm unihash changed to 211d78ca9bbf427dd2a1a0027001498060aa3ac248a9756ffd99906a5960365b
NOTE: recipe xxhash-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_install)
NOTE: recipe xxhash-0.8.3-r0: task do_install: Started
NOTE: recipe gnutls-3.8.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2343 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_create_spdx: Started
NOTE: recipe xxhash-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 2345 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_package)
NOTE: recipe xxhash-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe xxhash-0.8.3-r0: task do_package: Started
NOTE: recipe libpcre2-10.47-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2348 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_create_spdx)
NOTE: recipe libpcre2-10.47-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2349 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_compile)
NOTE: Running task 2350 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe elfutils-0.194-r0: task do_create_spdx: Started
NOTE: recipe xxhash-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2351 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.47-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe debugedit-5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2352 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_configure)
NOTE: recipe debugedit-5.2-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Succeeded
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2354 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_compile)
NOTE: Running task 2355 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe xxhash-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 2356 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_packagedata)
NOTE: recipe xxhash-0.8.3-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.194-r0: task do_create_spdx: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_packagedata unihash changed to fc54beb8f1e97bd76b26b89f3ac40fb4f100e956e0e7a8e5fcd7f62f69cf8c59
NOTE: Setscene tasks completed
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe libice-1_1.1.2-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2360 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2361 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2363 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_configure)
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe lz4-1_1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2366 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe debugedit-5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2367 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_compile)
NOTE: recipe debugedit-5.2-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata unihash changed to ee289f6fdb3b5bff071a830c4af6147b3f1ce81de2cddaef4d847c281c6dadce
NOTE: Setscene tasks completed
NOTE: Running task 2368 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2369 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe libpcre2-10.47-r0: task do_compile: Succeeded
NOTE: Running task 2370 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.47-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.47-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2371 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_install)
NOTE: recipe libpcre2-10.47-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2372 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.47-r0: task do_install: Succeeded
NOTE: Running task 2373 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_install_ptest_base)
NOTE: recipe libpcre2-10.47-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_install)
NOTE: recipe libpcre2-10.47-r0: task do_install_ptest_base: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_install: Started
NOTE: Running task 2375 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot)
NOTE: Running task 2376 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_package)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.47-r0: task do_package: Started
NOTE: recipe debugedit-5.2-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_package)
NOTE: recipe debugedit-5.2-r0: task do_package: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2378 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2379 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_install)
NOTE: recipe lz4-1_1.10.0-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_configure)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2382 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_package)
NOTE: Running task 2383 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_package: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2384 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2385 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_configure)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_configure: Succeeded
NOTE: Running task 2386 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_compile)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_compile: Started
NOTE: recipe debugedit-5.2-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_packagedata)
NOTE: recipe debugedit-5.2-r0: task do_packagedata: Started
NOTE: recipe debugedit-5.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_packagedata unihash changed to db0337ef86f167fd53c7da5b0b24f6840b5ba7f756f0cd322614671e2893d922
NOTE: Setscene tasks completed
NOTE: recipe libpcre2-10.47-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2389 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_compile)
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_package: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata)
NOTE: Running task 2391 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata unihash changed to 12590febb8c6c087207d842b26c78736efb14b81806a226ec24ec88e74bac0bd
NOTE: Setscene tasks completed
NOTE: Running task 2392 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_install)
NOTE: Running task 2393 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot)
NOTE: Running task 2395 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package)
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2396 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2397 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_install)
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_configure)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package)
NOTE: Running task 2400 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2402 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package: Succeeded
NOTE: Running task 2403 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_packagedata: Started
NOTE: recipe vim-9.2.0569-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2404 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_unpack)
NOTE: Running task 2405 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_create_spdx)
NOTE: Running task 2406 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_ipk)
NOTE: Running task 2407 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_deb)
NOTE: Running task 2408 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_rpm)
NOTE: Running task 2409 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_qa)
NOTE: recipe vim-9.2.0569-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_spdx: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_ipk: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_deb: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_qa: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_spdx: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_qa unihash changed to df3304c4996f16c1eb2640b3773d79ad91033c81f0c039070bee8dd3dc80bea1
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe vim-9.2.0569-r0: task do_unpack: Succeeded
NOTE: Running task 2410 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_patch)
NOTE: recipe vim-9.2.0569-r0: task do_patch: Started
NOTE: recipe vim-9.2.0569-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.2.0569-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.2.0569-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_deploy_source_date_epoch unihash changed to c9a0050b73737449a1001e14dfb111635dac2171fbbbfab613033344e52bae82
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2413 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_compile)
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_install)
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_package)
NOTE: Running task 2417 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2419 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2421 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_install: Succeeded
NOTE: Running task 2422 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2423 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2424 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2425 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2426 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 2427 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe binutils-2.46.1-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_install)
NOTE: recipe binutils-2.46.1-r0: task do_install: Started
NOTE: recipe perl-5.42.2-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_configure_ptest_base)
NOTE: recipe perl-5.42.2-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.42.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2430 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_compile)
NOTE: recipe perl-5.42.2-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2434 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2437 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_install: Succeeded
NOTE: Running task 2440 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_populate_sysroot)
NOTE: Running task 2441 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_package_write_ipk)
NOTE: Running task 2442 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_package_write_deb)
NOTE: Running task 2443 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_package_write_rpm)
NOTE: Running task 2444 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_package_qa)
NOTE: recipe binutils-2.46.1-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.46.1-r0: task do_package_write_ipk: Started
NOTE: recipe binutils-2.46.1-r0: task do_package_write_deb: Started
NOTE: recipe binutils-2.46.1-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.46.1-r0: task do_package_qa: Started
NOTE: recipe binutils-2.46.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2449 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_create_spdx)
NOTE: recipe binutils-2.46.1-r0: task do_create_spdx: Started
NOTE: recipe binutils-2.46.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_package_qa unihash changed to c6aeed45edef6731fc5cdd463f3335ab74f0ed4ae3bd06289cdb1a80f57288f1
NOTE: recipe binutils-2.46.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_configure: Succeeded
NOTE: Running task 2450 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2451 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_compile)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2453 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_install: Succeeded
NOTE: Running task 2454 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2455 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_populate_sysroot)
NOTE: Running task 2456 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2457 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 2459 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2462 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.2.0569-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.2.0569-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2463 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_configure)
NOTE: recipe vim-9.2.0569-r0: task do_configure: Started
WARNING: readline-8.3-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/readline/readline-8.3.tar.gz;name=archive, attempting MIRRORS if available
NOTE: recipe perl-5.42.2-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_compile_ptest_base)
NOTE: recipe perl-5.42.2-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.42.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2465 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_install)
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: Running task 2466 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: Running task 2467 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.42.2-r0: task do_install: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe readline-8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2468 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: recipe readline-8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: Running task 2469 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch unihash changed to a07ffd414632e6b879daa3d9cfa1ef5d39341f742c8435bcfe34a0fe9ea75115
NOTE: Setscene tasks completed
NOTE: Running task 2470 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_configure)
NOTE: recipe readline-8.3-r0: task do_configure: Started
NOTE: recipe vim-9.2.0569-r0: task do_configure: Succeeded
NOTE: Running task 2471 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_packagedata)
NOTE: recipe vim-9.2.0569-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2473 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: Running task 2474 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_spdx: Started
NOTE: recipe readline-8.3-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Running task 2475 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_compile)
NOTE: Running task 2476 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe readline-8.3-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2477 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Succeeded
NOTE: recipe readline-8.3-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_install)
NOTE: recipe readline-8.3-r0: task do_install: Started
NOTE: recipe readline-8.3-r0: task do_install: Succeeded
NOTE: Running task 2479 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot)
NOTE: Running task 2480 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_package)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.3-r0: task do_package: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2481 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2482 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_configure)
NOTE: recipe lua-5.5.0-r0: task do_configure: Started
NOTE: recipe lua-5.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2483 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_configure_ptest_base)
NOTE: recipe lua-5.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2484 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile)
NOTE: recipe lua-5.5.0-r0: task do_compile: Started
NOTE: recipe readline-8.3-r0: task do_package: Succeeded
NOTE: Running task 2485 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata)
NOTE: recipe readline-8.3-r0: task do_packagedata: Started
NOTE: recipe lua-5.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2486 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile_ptest_base)
NOTE: recipe lua-5.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe readline-8.3-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2487 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx)
NOTE: Running task 2488 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_install)
NOTE: recipe readline-8.3-r0: task do_create_spdx: Started
NOTE: recipe lua-5.5.0-r0: task do_install: Started
NOTE: recipe lua-5.5.0-r0: task do_install: Succeeded
NOTE: Running task 2489 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_install_ptest_base)
NOTE: recipe readline-8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2490 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_package)
NOTE: Running task 2491 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_populate_sysroot)
NOTE: recipe lua-5.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.5.0-r0: task do_package: Started
NOTE: recipe lua-5.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2492 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2493 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: recipe rpm-1_4.20.1-r0: task do_configure: Started
NOTE: recipe vim-9.2.0569-r0: task do_compile: Succeeded
NOTE: Running task 2494 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_install)
NOTE: recipe vim-9.2.0569-r0: task do_install: Started
NOTE: recipe lua-5.5.0-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_packagedata)
NOTE: recipe lua-5.5.0-r0: task do_packagedata: Started
NOTE: recipe lua-5.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_packagedata unihash changed to 49a538f8401dc0c0807c664e5b587bf08d26a08d8b551e1eaf54a18401b6d468
NOTE: Setscene tasks completed
NOTE: Running task 2496 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_create_spdx)
NOTE: recipe lua-5.5.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe vim-9.2.0569-r0: task do_install: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2497 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package)
NOTE: Running task 2498 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_populate_sysroot)
NOTE: Setscene tasks completed
NOTE: Running task 2499 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_compile)
NOTE: recipe vim-9.2.0569-r0: task do_package: Started
NOTE: recipe vim-9.2.0569-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_compile: Started
NOTE: recipe vim-9.2.0569-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_install)
NOTE: recipe rpm-1_4.20.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package)
NOTE: Running task 2502 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_package: Succeeded
NOTE: Running task 2503 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_packagedata)
NOTE: recipe vim-9.2.0569-r0: task do_package: Succeeded
NOTE: Running task 2504 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.20.1-r0: task do_packagedata: Started
NOTE: recipe vim-9.2.0569-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2505 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_create_spdx)
NOTE: recipe vim-9.2.0569-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_packagedata unihash changed to 1af8b531f3aa9ffdaddcaa573171eccd4a9145e941c5fb0e45730581587fe0ea
NOTE: Setscene tasks completed
NOTE: Running task 2506 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_create_spdx)
NOTE: Running task 2507 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_write_ipk)
NOTE: Running task 2508 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_write_deb)
NOTE: recipe rpm-1_4.20.1-r0: task do_create_spdx: Started
NOTE: Running task 2509 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_write_rpm)
NOTE: Running task 2510 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_qa)
NOTE: Running task 2511 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_package_write_ipk)
NOTE: Running task 2512 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_package_write_deb)
NOTE: Running task 2513 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_package_write_rpm)
NOTE: recipe vim-9.2.0569-r0: task do_create_spdx: Started
NOTE: Running task 2514 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_package_qa)
NOTE: recipe vim-9.2.0569-r0: task do_package_write_ipk: Started
NOTE: recipe vim-9.2.0569-r0: task do_package_write_deb: Started
NOTE: recipe vim-9.2.0569-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.2.0569-r0: task do_package_qa: Started
NOTE: recipe diffoscope-321-r0: task do_package_write_ipk: Started
NOTE: recipe diffoscope-321-r0: task do_package_write_deb: Started
NOTE: recipe diffoscope-321-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-321-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-321-r0: task do_package_write_ipk: Succeeded
NOTE: recipe diffoscope-321-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-321-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-321-r0: task do_package_write_deb: Succeeded
NOTE: recipe vim-9.2.0569-r0: task do_package_write_ipk: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_install: Succeeded
NOTE: Running task 2515 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_install_ptest_base)
NOTE: recipe perl-5.42.2-r0: task do_install_ptest_base: Started
NOTE: recipe vim-9.2.0569-r0: task do_create_spdx: Succeeded
NOTE: Running task 2516 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_create_package_spdx)
NOTE: recipe diffoscope-321-r0: task do_create_package_spdx: Started
NOTE: recipe vim-9.2.0569-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_qa unihash changed to 13c21182a30ca9598437ccf22e5f04821819d6baaeb1f08c73a7abcd4c1c7ebf
NOTE: recipe diffoscope-321-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vim-9.2.0569-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.2.0569-r0: task do_package_write_deb: Succeeded
NOTE: recipe perl-5.42.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2517 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_package)
NOTE: recipe perl-5.42.2-r0: task do_package: Started
NOTE: recipe perl-5.42.2-r0: task do_package: Succeeded
NOTE: Running task 2518 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.2.bb:do_packagedata)
NOTE: recipe perl-5.42.2-r0: task do_packagedata: Started
NOTE: recipe perl-5.42.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2519 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_ipk)
NOTE: Running task 2520 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_deb)
NOTE: Running task 2521 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_rpm)
NOTE: Running task 2522 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_qa)
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_ipk: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_deb: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_package_qa: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_qa unihash changed to b3126c50b5e543ce4bbaa7bfce6918fee272f3d6a6f7a85942a10adce6cbe8e6
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2523 of 2523 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_321.bb:do_build)
NOTE: Tasks Summary: Attempted 2523 tasks of which 2094 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-9.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:9.1.1-r0 to 0:9.1.0-r0) [version-going-backwards]
ERROR: python3-pytest-9.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:9.1.1-r0 to 0:9.1.0-r0) [version-going-backwards]
ERROR: python3-pytest-9.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:9.1.1-r0 to 0:9.1.0-r0) [version-going-backwards]
ERROR: python3-pytest-9.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:9.1.1-r0 to 0:9.1.0-r0) [version-going-backwards]
ERROR: python3-pytest-9.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:9.1.1-r0 to 0:9.1.0-r0) [version-going-backwards]
ERROR: python3-pytest-9.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:9.1.1-r0 to 0:9.1.0-r0) [version-going-backwards]
ERROR: python3-pytest-9.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:9.1.1-r0 to 0:9.1.0-r0) [version-going-backwards]
ERROR: python3-pytest-9.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0504420222999317837==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-319-321.patch"

RnJvbSA0ZjU1NjUxOGQ0NTRkMTUyMzVkNjI3Y2Y2Njk1NDVmN2M1YzI4NGIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjAgSnVuIDIwMjYgMDU6NTY6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMxOSAtPiAzMjEKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzE5LmJiID0+IGRpZmZvc2NvcGVfMzIxLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMTkuYmIgPT4gZGlmZm9zY29wZV8z
MjEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMxOS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyMS5iYgppbmRleCAyNThkYWI5
MDI3Li4xMzQ0NjY5Yzg0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMjEuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTkwZDhh
YzcxYTVlNzA0NWM4YWQ2YzY2MzUzZjZhMGRjYmY1NTM3YWIzMjMyOTVlMzFiZDc5NWIwNDNhYTkx
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMzRlZDM5ZjEzZjkyYTFmZmFkNTAxOGE0MDM4YTg4
ZGFjYzRhMjg3OTk2NjAxMDgyZDhhZjQ0MjhlMWYwNDkzIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============0504420222999317837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-321.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-319.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-321.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-319.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-321.dist-info

--===============0504420222999317837==--

