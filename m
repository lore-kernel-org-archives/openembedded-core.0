Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5380EC04A94
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5934.1689456453455337169
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E/Egl+Jh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101895b73b259-0fe36a8a-8c3a-48da-8ad3-31557311587f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wKI9FrdnLPwdv53bNF3TOC+bmIDtCC9qAv6qmaKAQXs=;
	b=E/Egl+Jh01dlnUSfBOd8fW+yQ40ZEa67C84kAEYnA8IQz7Dd8yHC6p+AfuD9gOUt
	jjvxvz3tpTwm0L6/QZo+Zbz1nFLPGxqYcXs9zLvqGhOryJJL5tBkMVku5hIeybvYpRG
	tBiC7I8Wsam7Zi9gQssRLfFAGYGc3d9h+jvNPcKI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wKI9FrdnLPwdv53bNF3TOC+bmIDtCC9qAv6qmaKAQXs=;
	b=BwJoGtWqD5e7ooVLL7Iacn77Rro47V4d4vQawFRmymR7/j3F23y/9Pri4xZ2JzfX
	hFfK+rCmuIWz/LhrqBT3UT6CzB7l6V140EVCHi7RAA5AfKIs0YPp3iT50GwDuLB8bGP
	A97J7bc/kSKvc6CCbb6J6omo3piz628f91RfsbLQ=
Content-Type: multipart/mixed; boundary="===============0439561170180702423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 244 SUCCEEDED
Message-ID: <010101895b73b259-0fe36a8a-8c3a-48da-8ad3-31557311587f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184403

--===============0439561170180702423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *244* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-242-244.patch
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
From 6e6750ed611bb8dcfa5354bd2b2dd6cc64ff4e3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 20:48:50 +0000
Subject: [PATCH] diffoscope: upgrade 242 -> 244

---
 .../diffoscope/{diffoscope_242.bb => diffoscope_244.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_242.bb => diffoscope_244.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_242.bb b/meta/recipes-support/diffoscope/diffoscope_244.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_242.bb
rename to meta/recipes-support/diffoscope/diffoscope_244.bb
index 4b0d518edc..7500eae132 100644
--- a/meta/recipes-support/diffoscope/diffoscope_242.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_244.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d858c591d2c8d42b2b29eb6d229408607b1cd8a4e7ade72d0cd002db6d1c2a6e"
+SRC_URI[sha256sum] = "8bee8bbb144cdb7ddfa21886d5ce1822220139241c9a53def09b4adc3340db93"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.39.2


--===============0439561170180702423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 242 [default] to 244 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "242" to "244"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 242 [default] to 244 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "242" to "244"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 242 [default] to 244 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "242" to "244"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 242 [default] to 244 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "242" to "244"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 242 [default] to 244 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "242" to "244"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 242 [default] to 244 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "242" to "244"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 242 [default] to 244 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "242" to "244"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1408047 to 1408493 (+0%)
packages/core2-32-poky-linux/diffoscope: PKGV changed from 242 [default] to 244 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-242.tar.gz;downloadfilename=diffoscope-242.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-244.tar.gz;downloadfilename=diffoscope-244.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "242" to "244"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-242.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-244.dist-info

--===============0439561170180702423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-242.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-244.dist-info

--===============0439561170180702423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:425eed4f08207cb572aca0f21ebd2119227fdda2"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 37 Mirrors 0 Missed 66 Current 839 (35% match, 92% complete)
Removing 2 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 857 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2046 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 2047 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 2048 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 2049 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2347 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2348 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2351 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_fetch)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 2415 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 2416 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2417 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2418 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2419 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2420 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2477 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-244-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: Running task 2478 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2479 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 2480 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2481 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 2482 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2483 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2484 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2512 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2539 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2540 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: Running task 2567 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 2582 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2595 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 2596 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2597 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2598 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2599 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 2619 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 2642 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe diffoscope-244-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 2678 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe diffoscope-244-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 2716 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2787 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: Running task 2788 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2791 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2792 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 2793 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2795 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-244-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: Running task 2807 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_patch)
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: Running task 2808 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: Running task 2809 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2810 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2811 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2826 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2827 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-244-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2838 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2839 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2840 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2841 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2842 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 2843 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2844 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2845 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2846 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2847 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2848 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2849 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2850 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe diffoscope-244-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-244-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2851 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: Running task 2852 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_deploy_source_date_epoch)
NOTE: Running task 2853 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 2854 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2855 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2856 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe diffoscope-244-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-244-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2857 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-244-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_lic unihash changed to e77d6eb96dbd025db4926cc70129c332da331f445abc5242a55dbc5b99b1b17c
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: Running task 2858 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2859 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2860 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2861 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: Running task 2862 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: Running task 2863 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-244-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2864 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe diffoscope-244-r0: task do_configure: Succeeded
NOTE: Running task 2865 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_compile)
NOTE: Running task 2866 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 2867 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe diffoscope-244-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 2868 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2869 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2870 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-244-r0: task do_compile: Succeeded
NOTE: Running task 2871 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2872 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2873 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2874 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2875 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-244-r0: task do_install: Started
NOTE: Running task 2876 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2877 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2878 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2879 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2880 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2881 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe diffoscope-244-r0: task do_install: Succeeded
NOTE: Running task 2882 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_package)
NOTE: Running task 2883 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: Running task 2884 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: Running task 2885 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2886 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-244-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-244-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2887 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe diffoscope-244-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2888 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2889 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 2890 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2891 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2892 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2893 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: Running task 2894 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-244-r0: task do_package: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2894 tasks of which 2789 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-libarchive-c/4.0-r0/temp/log.do_packagedata.3938592
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============0439561170180702423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:425eed4f08207cb572aca0f21ebd2119227fdda2"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 37 Mirrors 0 Missed 66 Current 839 (35% match, 92% complete)
Removing 2 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 1 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 857 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2046 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 2047 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 2048 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2049 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 2349 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_fetch)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: Running task 2413 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2414 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2415 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 2416 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2417 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2418 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 2475 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2488 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2489 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2490 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2491 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 2565 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 2566 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-244-r0: task do_fetch: Started
NOTE: Running task 2567 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2568 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-244-r0: task do_fetch: Succeeded
NOTE: Running task 2611 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_unpack)
NOTE: Running task 2612 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: Running task 2632 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2721 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2722 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: Running task 2753 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2754 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2781 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: Running task 2782 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2783 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-244-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 2820 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 2821 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2822 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2823 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-244-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2824 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2825 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: Running task 2826 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2827 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2828 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 2829 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 2830 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-244-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2831 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2832 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2833 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2834 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_patch)
NOTE: Running task 2835 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: Running task 2836 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2837 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-244-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2838 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: Running task 2839 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-244-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2840 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2841 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 2842 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2843 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 2844 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2845 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2846 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-244-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-244-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2847 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2848 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2849 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2850 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 2851 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2852 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 2853 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2854 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-244-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_populate_lic: Started
NOTE: Running task 2855 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2856 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2857 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe diffoscope-244-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_lic unihash changed to e77d6eb96dbd025db4926cc70129c332da331f445abc5242a55dbc5b99b1b17c
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2858 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: Running task 2859 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe diffoscope-244-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: Running task 2860 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2861 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2862 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe diffoscope-244-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2863 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2864 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe diffoscope-244-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2865 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: Running task 2866 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_compile)
NOTE: Running task 2867 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 2868 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe diffoscope-244-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2869 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2870 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2871 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-244-r0: task do_compile: Succeeded
NOTE: Running task 2872 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_install)
NOTE: Running task 2873 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-244-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2874 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2875 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: Running task 2876 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 2877 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2878 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2879 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe diffoscope-244-r0: task do_install: Succeeded
NOTE: Running task 2880 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_package)
NOTE: Running task 2881 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_sysroot)
NOTE: recipe diffoscope-244-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe diffoscope-244-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2882 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2883 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2884 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-244-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2885 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: Running task 2886 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2887 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2888 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2889 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2890 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe diffoscope-244-r0: task do_package: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2890 tasks of which 2789 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-libarchive-c/4.0-r0/temp/log.do_packagedata.3834579
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============0439561170180702423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============0439561170180702423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-242-244.patch"

RnJvbSA2ZTY3NTBlZDYxMWJiOGRjZmE1MzU0YmQyYjJkZDZjYzY0ZmY0ZTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMjA6NDg6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI0MiAtPiAyNDQKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjQyLmJiID0+IGRpZmZvc2NvcGVfMjQ0LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNDIuYmIgPT4gZGlmZm9zY29wZV8y
NDQuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI0Mi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNDQuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0Mi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0NC5iYgppbmRleCA0YjBkNTE4
ZWRjLi43NTAwZWFlMTMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjQyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNDQuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDg1OGM1OTFkMmM4ZDQyYjJiMjllYjZkMjI5NDA4NjA3YjFjZDhhNGU3YWRlNzJkMGNk
MDAyZGI2ZDFjMmE2ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4YmVlOGJiYjE0NGNkYjdkZGZh
MjE4ODZkNWNlMTgyMjIyMDEzOTI0MWM5YTUzZGVmMDliNGFkYzMzNDBkYjkzIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzkuMgoK

--===============0439561170180702423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:425eed4f08207cb572aca0f21ebd2119227fdda2"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 104 Local 38 Mirrors 0 Missed 66 Current 844 (36% match, 93% complete)
Removing 2 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 862 of 948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2052 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2053 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 2054 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 2055 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: Running task 2367 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2431 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2432 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2433 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2434 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2435 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2436 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: Running task 2478 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 2479 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2480 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2481 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2492 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2493 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2494 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 2646 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe diffoscope-244-r0: task do_fetch: Started
NOTE: Running task 2681 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2682 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe diffoscope-244-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: Running task 2758 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_unpack)
NOTE: Running task 2759 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2795 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2796 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2797 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: Running task 2798 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2799 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 2800 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2801 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2802 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: Running task 2805 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2809 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: Running task 2810 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 2811 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_unpack: Started
NOTE: Running task 2812 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 2847 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe diffoscope-244-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2848 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: Running task 2850 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 2851 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2852 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2853 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2854 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2855 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-244-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2856 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: Running task 2857 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_patch)
NOTE: Running task 2858 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: Running task 2859 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-244-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe diffoscope-244-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2860 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2861 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2862 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 2863 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 2864 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2865 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2866 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2867 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2868 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2869 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: Running task 2870 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2871 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 2872 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2873 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2874 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2875 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe diffoscope-244-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2876 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-244-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-244-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2877 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2878 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_deploy_source_date_epoch)
NOTE: Running task 2879 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_lic)
NOTE: Running task 2880 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2881 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: Running task 2882 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe diffoscope-244-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-244-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2883 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe diffoscope-244-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_lic unihash changed to e77d6eb96dbd025db4926cc70129c332da331f445abc5242a55dbc5b99b1b17c
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe diffoscope-244-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2884 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_configure)
NOTE: Running task 2885 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2886 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-244-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: Running task 2887 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe diffoscope-244-r0: task do_configure: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2888 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_compile)
NOTE: Running task 2889 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2890 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe diffoscope-244-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2891 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2892 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2893 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-244-r0: task do_compile: Succeeded
NOTE: Running task 2894 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: Running task 2895 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_install)
NOTE: Running task 2896 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2897 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2898 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe diffoscope-244-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2899 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2900 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2901 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2902 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe diffoscope-244-r0: task do_install: Succeeded
NOTE: Running task 2904 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_package)
NOTE: Running task 2905 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2906 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: Running task 2907 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2908 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-244-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-244-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2909 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe diffoscope-244-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2911 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2912 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2913 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2914 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2915 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 2916 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-244-r0: task do_package: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2916 tasks of which 2811 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-libarchive-c/4.0-r0/temp/log.do_packagedata.3717840
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============0439561170180702423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:425eed4f08207cb572aca0f21ebd2119227fdda2"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 37 Mirrors 0 Missed 66 Current 839 (35% match, 92% complete)
Removing 2 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 857 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2046 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 2047 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 2048 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2049 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 2348 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_fetch)
NOTE: Running task 2413 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: Running task 2414 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2415 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2416 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2417 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 2418 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: Running task 2470 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2502 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2503 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2504 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2505 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 2506 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2507 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 2580 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2581 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2628 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe diffoscope-244-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: Running task 2773 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: Running task 2774 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_unpack)
NOTE: Running task 2775 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2776 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2777 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: Running task 2778 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2779 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2793 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2794 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2795 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2821 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 2822 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2823 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 2824 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 2825 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2826 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 2827 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: Running task 2828 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2829 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 2830 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-244-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe diffoscope-244-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2831 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2832 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2833 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 2834 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2835 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-244-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: Running task 2836 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_patch)
NOTE: Running task 2837 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2838 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2839 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-244-r0: task do_patch: Started
NOTE: recipe diffoscope-244-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2840 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2841 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 2842 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2843 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: Running task 2844 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2845 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2846 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2847 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2848 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-244-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2849 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-244-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-244-r0: task do_patch: Succeeded
NOTE: Running task 2850 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_deploy_source_date_epoch)
NOTE: Running task 2851 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2852 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2853 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 2854 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-244-r0: task do_populate_lic: Started
NOTE: Running task 2855 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe diffoscope-244-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2856 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2857 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe diffoscope-244-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_lic unihash changed to e77d6eb96dbd025db4926cc70129c332da331f445abc5242a55dbc5b99b1b17c
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2858 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2859 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: Running task 2860 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2861 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-244-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2862 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-244-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2863 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-244-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2864 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2865 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_compile)
NOTE: Running task 2866 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: Running task 2867 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe diffoscope-244-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 2868 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2869 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2870 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2871 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-244-r0: task do_compile: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2872 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: Running task 2873 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2874 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2875 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: Running task 2876 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe diffoscope-244-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2877 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2878 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2879 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2880 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2881 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe diffoscope-244-r0: task do_install: Succeeded
NOTE: Running task 2882 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: Running task 2883 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2884 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_package)
NOTE: Running task 2885 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_244.bb:do_populate_sysroot)
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2886 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe diffoscope-244-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-244-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2887 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe diffoscope-244-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2888 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2889 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2890 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2891 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2892 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2893 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 2894 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-244-r0: task do_package: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2894 tasks of which 2789 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-libarchive-c/4.0-r0/temp/log.do_packagedata.3882488
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============0439561170180702423==--

