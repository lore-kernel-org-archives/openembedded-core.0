Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDADDD172C2
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29058.1769951567353759956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2ArcuGoS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AvF39s0P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c19559e5b-17c7b6b8-38bf-4406-ab2a-e558aa5d90d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951567;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C3tPFJBJTUDYS+QDC1EeDQRH8UUNAoR0iS47Jgt9DyA=;
	b=2ArcuGoSAvoN0D9WafKn0o1dhysKKkQ6OcAS2Yoov5piLwLs6taAUvOds6KrmHV9
	/nOIzo6OgMBQbFukyhXoVlwY3EebxE9pT0cb5wVXpkUexjdB5oclAV8tcZIMt/j5+tV
	mvtiQFqlCAjtSf70BjTXpcdsaLMb7MVsyBcguX98=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951567;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C3tPFJBJTUDYS+QDC1EeDQRH8UUNAoR0iS47Jgt9DyA=;
	b=AvF39s0PblFix4hi2Qicufniu0dn5pNU7Dm2QeJ56mgp4W6pcg2zrFOZTa98DVmH
	0mlyc39ct5UJQgLIp8YFOirKcoq8pXZiHttJECQ9iX4GFLp65kBIERLCmzM4rz3bjAd
	JKj6b+8Fep3L3vziqQgwnEGIsHWsHk0vbcqlcoqg=
Content-Type: multipart/mixed; boundary="===============6592009594737496090=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.38.1 SUCCEEDED
Message-ID: <0101019c19559e5b-17c7b6b8-38bf-4406-ab2a-e558aa5d90d4-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230280

--===============6592009594737496090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dbusmock* to *0.38.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.37.2-0.38.1.patch
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
From 4d3ad4ece7c2c260d5c42d2a09748cf8e4b8cec1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 08:10:19 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.37.2 -> 0.38.1

---
 .../{python3-dbusmock_0.37.2.bb => python3-dbusmock_0.38.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.37.2.bb => python3-dbusmock_0.38.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
index afbf0f0c57..bc81b362ee 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "e0c7354f6887036ee519f2fbba55ce14bb21c3ffceab06c085d15bbbda2b1d03"
+SRC_URI[sha256sum] = "221b65e1c2e48de9fd11bf7e8c165adaf91648f49a11f390d086a498386f2984"
 
 PYPI_PACKAGE = "python_dbusmock"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============6592009594737496090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.14/site-packages/python_dbusmock-0.37.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/python_dbusmock-0.38.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/python_dbusmock-0.37.2.dist-info -> /usr/lib/python3.14/site-packages/python_dbusmock-0.38.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.14/site-packages/python_dbusmock-0.37.2.dist-info moved to /usr/lib/python3.14/site-packages/python_dbusmock-0.38.1.dist-info

--===============6592009594737496090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1958 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-84743e142f4518a436391b4d40a411b0f863304e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:84743e142f4518a436391b4d40a411b0f863304e"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: Initial setup loop progress: 420 of 2400 in 31.33686351776123
NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 605 Local 505 Mirrors 0 Missed 100 Current 270 (83% match, 88% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 299 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 319 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 321 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 370 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 375 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 410 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 420 of 875 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 421 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.86.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 432 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 433 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 439 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 441 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 447 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.86.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 452 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 456 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 458 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 463 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 466 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 470 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 478 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 481 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 493 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 496 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 513 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 515 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 566 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 567 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 592 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 593 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 604 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 607 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 610 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 611 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 622 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 639 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 643 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 653 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 660 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 670 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 680 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 682 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 692 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 693 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 702 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 710 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 825 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_fetch)
NOTE: Running task 831 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 847 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_write_config)
NOTE: Running setscene task 739 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 913 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_fetch)
NOTE: Running task 915 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 917 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 945 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 961 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_write_config)
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_write_config: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1007 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 754 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 755 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 756 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: Running task 1027 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_unpack)
NOTE: recipe libpng-1.6.54-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: Running setscene task 760 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1036 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_fetch)
NOTE: Running task 1052 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1053 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1060 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1080 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: Running setscene task 765 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1117 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1118 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: Running task 1119 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1120 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: Running task 1126 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: Running task 1127 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1129 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_fetch)
NOTE: recipe fontconfig-2.17.1-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_fetch: Succeeded
NOTE: Running task 1135 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: Running task 1136 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 1137 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_unpack: Succeeded
NOTE: Running task 1138 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_patch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1139 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe freetype-2.14.1-r0: task do_write_config: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 771 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.47-r0: task do_patch: Started
NOTE: recipe freetype-2.14.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 774 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 777 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 778 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 779 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/expat/2.7.3/temp/log.do_packagedata_setscene.740959
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 783 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 789 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_package_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 793 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_package_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 796 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1159 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1177 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 1178 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_patch)
NOTE: Running task 1179 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_patch)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/ncurses/6.5/temp/log.do_packagedata_setscene.741466
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 830 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1190 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1191 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_patch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1197 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Started
NOTE: Running task 1208 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_patch: Started
NOTE: recipe expat-2.7.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1223 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 832 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1233 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_package_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1234 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1239 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1252 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1255 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1256 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1302 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1303 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1304 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe freetype-2.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_unpack)
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1306 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1307 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_write_config)
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: Running task 1313 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_fetch)
NOTE: recipe freetype-2.14.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1314 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe fontconfig-2.17.1-r0: task do_write_config: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe fontconfig-2.17.1-r0: task do_write_config: Succeeded
NOTE: Running task 1324 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_patch: Succeeded
NOTE: Running task 1325 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.54-r0: task do_fetch: Succeeded
NOTE: Running task 1326 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: Running task 1327 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_patch: Succeeded
NOTE: Running task 1328 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.14.1-r0: task do_unpack: Succeeded
NOTE: Running task 1329 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_patch)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1330 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_unpack: Succeeded
NOTE: Running task 1331 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_patch)
NOTE: recipe libpng-1.6.54-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 1354 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_recipe_qa)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.14.1-r0: task do_patch: Started
NOTE: recipe freetype-2.14.1-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1355 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1356 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa: Started
NOTE: recipe libpng-1.6.54-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_patch)
NOTE: recipe freetype-2.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_patch: Succeeded
NOTE: Running task 1359 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_recipe_qa)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1360 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.54-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: Running task 1361 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.54-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_recipe_qa: Started
NOTE: Running task 1362 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.54-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: Running task 1363 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_deploy_source_date_epoch unihash changed to d8c9b1de2cc9629a79c715707cc15560ed717caaa86a835532d6045ee48b6536
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch unihash changed to 732724e51121d45b7847f28ba61659bc914c70ac67894fa8818fa82c3af7be7b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch unihash changed to a3a73d783f799038180d92161f93cb048ddde2a4f7140e3a1f7c527a75f78b45
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch unihash changed to 936a5973d7444ab6451ad65547090449efa48ddf5af5385c864dbdabbda3eacb
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_deploy_source_date_epoch unihash changed to 1ede75d16ddb3d1d6000cd708d7461696ab2715d3cb8b0deeb854344975836ff
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_deploy_source_date_epoch unihash changed to 2ab6796b33806801b84dcf5666cfaac6c33fe43240c036f5a9e5f6885ab39147
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_deploy_source_date_epoch unihash changed to 79fecf9cfbd8e362b66904e6bc03f4e352d6242fad3924b8dd2388746aca67a2
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_deploy_source_date_epoch unihash changed to 90e4f82c11e28a2a9f85026a13e55dc8cb4709a8036c5230e07c73a6c1142a23
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_recipe_qa unihash changed to 7e58557b65f56f0131645191b1f85c19f27fac12a7f5f543385a8b0a0078bef0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch unihash changed to d63a2acbc24f9f22d97c9148feaf2222376d325ae312a769f3ab1829b7bf9a47
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_deploy_source_date_epoch unihash changed to 632a7b7b0c77657614fb4481902d79145d9d143aaa17e2d73aa3829f4609a908
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Running setscene task 787 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1364 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: Running task 1365 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: Running task 1366 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1367 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_fetch)
NOTE: Running task 1368 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_fetch)
NOTE: Running task 1369 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_fetch)
NOTE: Running task 1374 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1375 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_write_config)
NOTE: Running task 1385 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1403 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_write_config)
NOTE: Running task 1404 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_write_config)
NOTE: Running task 1494 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_write_config: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1495 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 1496 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_unpack)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_write_config: Started
NOTE: Running task 1497 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_unpack)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: Running task 1498 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1504 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_write_config: Succeeded
NOTE: Running task 1505 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 839 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-dbus-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_write_config: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_unpack: Started
NOTE: Running setscene task 841 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbus-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: Running task 1509 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 1510 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1511 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe python3-dbus-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_patch: Started
NOTE: Running task 1512 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: Running task 1513 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1524 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1525 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_populate_lic)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-dbus-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1526 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_populate_lic: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_patch: Succeeded
NOTE: Running task 1527 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dbus-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 858 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_deploy_source_date_epoch unihash changed to ac3310da8e06ded9b14a7722ceb905695f09b27feebb85ac15401be650505435
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_populate_lic: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch unihash changed to 0f3332aef1bbf00c6752db8afa62a57ce75b95b86fe4bdca6c21bb57ad7b05e4
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch unihash changed to cd3d50eef65678cb0f9efe5da2b38fec98d1d0520225e2b753d9bcb6ced5edc4
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_deploy_source_date_epoch unihash changed to 5de56d9b36391096c84a0cfc7002366f03de22352a1cfb29595a15965445d0bb
NOTE: recipe python3-pygobject-3.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_deploy_source_date_epoch unihash changed to 5c260fe1a96d5404db2953d281d8ce12dcacdcb8fac365afe1cdc55564c6d971
NOTE: Running setscene task 852 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 857 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 860 of 875 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1549 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: Running task 1550 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 1551 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1774 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1784 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1856 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata)
NOTE: Running task 1903 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata)
NOTE: Running task 1975 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1976 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.54-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2080 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_collect_spdx_deps)
NOTE: Running task 2091 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.5-r0: task do_packagedata: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata: Started
NOTE: Running task 2124 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2204 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: Running task 2205 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_collect_spdx_deps)
NOTE: recipe libpcre2-10.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.54-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre2-10.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2218 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_configure)
NOTE: Running task 2219 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_configure)
NOTE: recipe libxrender-1_0.9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_configure: Started
NOTE: recipe libpcre2-10.47-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2220 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_configure)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_configure: Started
NOTE: Running task 2221 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_configure)
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2222 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2223 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_configure)
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_configure: Started
NOTE: Running task 2224 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_compile)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_configure: Succeeded
NOTE: Running task 2225 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_compile)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot unihash changed to 72614d21295fb80d6bc9820e0b643d0848f898bcf02bc0967c4758f5c932b7e7
NOTE: recipe ncurses-6.5-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2240 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_collect_spdx_deps)
NOTE: Running task 2245 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_collect_spdx_deps)
NOTE: Running task 2246 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_compile: Succeeded
NOTE: Running task 2251 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_install)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_install)
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: Running task 2253 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_install: Succeeded
NOTE: Running task 2254 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_package)
NOTE: Running task 2255 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_populate_sysroot)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to 93cc1c11d4f28b0efbdbba19097b57853c8e240d73f61b5d4a2c8dbc87feb3f4
NOTE: Setscene tasks completed
NOTE: Running task 2256 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe initscripts-1.0-r0: task do_packagedata: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_install: Succeeded
NOTE: Running task 2257 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package: Succeeded
NOTE: Running task 2260 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata unihash changed to a0855b44690359c2009f4cbd0813e0b84f6ec366bdfaba93856ae4e3913e9d63
NOTE: Setscene tasks completed
NOTE: Running task 2261 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx: Started
NOTE: recipe libpng-1.6.54-r0: task do_configure: Succeeded
NOTE: Running task 2262 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_configure_ptest_base)
NOTE: recipe libpng-1.6.54-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2263 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx)
NOTE: Running task 2264 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_compile)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx: Started
NOTE: recipe libpng-1.6.54-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_create_spdx)
NOTE: Running task 2266 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe libpcre2-10.47-r0: task do_configure: Succeeded
NOTE: Running task 2267 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_compile)
NOTE: recipe libpcre2-10.47-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_configure: Succeeded
NOTE: Running task 2268 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_compile)
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: Running task 2269 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: Running task 2270 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe libxrender-1_0.9.12-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_compile: Succeeded
NOTE: Running task 2271 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_install)
NOTE: recipe libxrender-1_0.9.12-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_install: Succeeded
NOTE: Running task 2272 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2273 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to 7f75e7431ee4ad5b4b5083bf59cf2741447f9bef6a5f8391df2e91b8069b483a
NOTE: recipe libpng-1.6.54-r0: task do_compile: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_compile: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to 876785db86b90fbcf0eeabbd8e0bf2c45503b15e5c6b3517b816842b6edad731
NOTE: Setscene tasks completed
NOTE: Running task 2274 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_install)
NOTE: Running task 2275 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_compile_ptest_base)
NOTE: Running task 2276 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata)
NOTE: Running task 2277 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata)
NOTE: recipe libpng-1.6.54-r0: task do_compile_ptest_base: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.47-r0: task do_install: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.54-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2278 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_install)
NOTE: recipe libpng-1.6.54-r0: task do_install: Started
NOTE: recipe libpcre2-10.47-r0: task do_install: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_install: Succeeded
NOTE: Running task 2279 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot)
NOTE: Running task 2280 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_package)
NOTE: Running task 2281 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_install_ptest_base)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.47-r0: task do_package: Started
NOTE: recipe libpng-1.6.54-r0: task do_install_ptest_base: Started
NOTE: recipe libpng-1.6.54-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2282 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_populate_sysroot)
NOTE: Running task 2283 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_package)
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.54-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata unihash changed to 5cdf77448234ba901a4a394d0c32360d9d931f1fa80165252740f1b722b039b6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata unihash changed to 5bc3363f472da0ec2e6e1f0457fbd8373954191daad7b13be7b26121ed52b235
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot unihash changed to fd15d2eedb7d875424b68f5c791d73d5113e62c7e02ae08cedb7d16dd40c308a
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_populate_sysroot unihash changed to b3764f2e88591d60fbce6a1aa0226ca26c33257ffa7e817537f3137e320d500d
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_package unihash changed to 709392bed2187ce23ad9d2fd51ea814beb6b4e484a82afb216c63197b7c80e16
NOTE: recipe libpng-1.6.54-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2284 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2285 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2286 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_packagedata)
NOTE: Running task 2287 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata)
NOTE: Running task 2288 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: Running task 2289 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.54-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2290 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_configure)
NOTE: Running task 2291 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_configure)
NOTE: recipe freetype-2.14.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_packagedata: Succeeded
NOTE: Running task 2292 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_create_spdx)
NOTE: recipe libpng-1.6.54-r0: task do_create_spdx: Started
NOTE: recipe freetype-2.14.1-r0: task do_configure: Succeeded
NOTE: Running task 2293 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_compile)
NOTE: recipe freetype-2.14.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata unihash changed to 1315731902bd212fbab682cbedbcd197661a3005134dd25fb1f7e4f121a99e43
NOTE: recipe libpng-1.6.54-r0: task do_create_spdx: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2294 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_install)
NOTE: Running task 2295 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx)
NOTE: Running task 2296 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_collect_spdx_deps)
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx: Started
NOTE: recipe freetype-2.14.1-r0: task do_install: Started
NOTE: recipe freetype-2.14.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe freetype-2.14.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_install: Succeeded
NOTE: Running task 2297 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_populate_sysroot)
NOTE: Running task 2298 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_package)
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.14.1-r0: task do_package: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2300 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_compile: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2301 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2302 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2303 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_configure)
NOTE: recipe fontconfig-2.17.1-r0: task do_configure: Started
NOTE: recipe freetype-2.14.1-r0: task do_package: Succeeded
NOTE: Running task 2304 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_packagedata)
NOTE: recipe freetype-2.14.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.14.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2305 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_create_spdx)
NOTE: recipe freetype-2.14.1-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_compile)
NOTE: recipe fontconfig-2.17.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2308 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_install: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_compile: Succeeded
NOTE: Running task 2309 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_install)
NOTE: recipe fontconfig-2.17.1-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_install: Succeeded
NOTE: Running task 2310 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_install_ptest_base)
NOTE: recipe freetype-2.14.1-r0: task do_create_spdx: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_install: Succeeded
NOTE: Running task 2311 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_collect_spdx_deps)
NOTE: Running task 2312 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot)
NOTE: Running task 2313 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_package)
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_install_ptest_base: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_package: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2314 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.17.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2315 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2316 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2317 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-initial-1_2.86.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2319 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata unihash changed to fa9fc42afa8b470894fb74f19b1af13a92fd05ff7fdcddb14bff0fff0e9957c5
NOTE: Setscene tasks completed
NOTE: Running task 2321 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2324 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2325 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Running task 2327 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2328 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2329 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_configure: Succeeded
NOTE: Running task 2330 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2331 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2333 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2335 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot)
NOTE: Running task 2336 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2337 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2338 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_configure)
NOTE: recipe cairo-1.18.4-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2340 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe cairo-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_compile)
NOTE: recipe cairo-1.18.4-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2343 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2345 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 2346 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2349 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2350 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2351 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2352 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_configure)
NOTE: recipe python3-dbus-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2353 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package: Succeeded
NOTE: Running task 2354 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata)
NOTE: recipe python3-dbus-1.4.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_compile: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_compile: Started
NOTE: Running task 2357 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_install)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_install: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_install)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_install: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_install: Started
NOTE: Running task 2359 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_package)
NOTE: Running task 2361 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package)
NOTE: Running task 2362 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_create_spdx)
NOTE: recipe cairo-1.18.4-r0: task do_package: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.16.2-r0: task do_package: Started
NOTE: Running task 2363 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_populate_sysroot)
NOTE: recipe python3-dbus-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2364 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2365 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_configure)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2366 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_collect_spdx_deps)
NOTE: Running task 2367 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_collect_spdx_deps)
NOTE: recipe cairo-1.18.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.16.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe cairo-1.18.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 2368 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2369 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_compile)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_package: Succeeded
NOTE: Running task 2370 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_install)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2373 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_package)
NOTE: Running task 2374 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_package: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata unihash changed to b9f098f9c37fcaad796182c2ed787d21bd1d510e0a4c398dd403d55367e01552
NOTE: recipe python3-pygobject-3.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2375 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_package)
NOTE: Running task 2376 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_collect_spdx_deps)
NOTE: Running task 2377 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_package: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2379 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-dbus-1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2380 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package)
NOTE: Running task 2381 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_create_spdx)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_packagedata)
NOTE: recipe python3-dbus-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2383 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_collect_spdx_deps)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_create_spdx)
NOTE: Running task 2385 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_package_write_ipk)
NOTE: Running task 2386 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_package_write_deb)
NOTE: Running task 2387 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2388 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_package_qa)
NOTE: recipe python3-dbus-1.4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_package_qa: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbus_1.4.0.bb:do_package_qa unihash changed to 0596ba4a1eb09ddd774357edf128f4ac5ed7d3cee9fb27c800b43a51e3bda3e3
NOTE: recipe python3-dbus-1.4.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-dbus-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_create_spdx)
NOTE: Running task 2391 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_write_ipk)
NOTE: Running task 2392 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_write_deb)
NOTE: Running task 2393 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_write_rpm)
NOTE: Running task 2394 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_qa)
NOTE: Running task 2395 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_package_write_ipk)
NOTE: Running task 2396 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_package_write_deb)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_create_spdx: Started
NOTE: Running task 2397 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_package_write_rpm)
NOTE: Running task 2398 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_package_qa)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_qa: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package_qa: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2399 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_create_package_spdx)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_qa: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_create_package_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_qa unihash changed to 7f12d7eb984f2a23e4f4ce0df8a7d7e442919ef969fcda63c51dea6e32be80ce
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2400 of 2400 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2400 tasks of which 2130 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 32 ERROR messages, returning a non-zero exit code.
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.7.4-r0 to 0:2.7.3-r0) [version-going-backwards]
ERROR: expat-2.7.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6592009594737496090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-dbusmock: PV changed from "0.37.2" to "0.38.1"
packages/x86-64-v3-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python_dbusmock/python_dbusmock-0.37.2.tar.gz;downloadfilename=python_dbusmock-0.37.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python_dbusmock/python_dbusmock-0.38.1.tar.gz;downloadfilename=python_dbusmock-0.38.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-dbusmock: PKGV changed from 0.37.2 [default] to 0.38.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.37.2" to "0.38.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.37.2 [default] to 0.38.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.37.2" to "0.38.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.37.2 [default] to 0.38.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.37.2" to "0.38.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.37.2 [default] to 0.38.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.37.2" to "0.38.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.37.2 [default] to 0.38.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.37.2" to "0.38.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.37.2 [default] to 0.38.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.37.2" to "0.38.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.37.2 [default] to 0.38.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 503874 to 498268 (-1%)
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.37.2" to "0.38.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.14/site-packages/python_dbusmock-0.37.2.dist-info -> /usr/lib/python3.14/site-packages/python_dbusmock-0.38.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/python_dbusmock-0.37.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/python_dbusmock-0.38.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.37.2 [default] to 0.38.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.14/site-packages/python_dbusmock-0.37.2.dist-info moved to /usr/lib/python3.14/site-packages/python_dbusmock-0.38.1.dist-info

--===============6592009594737496090==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.37.2-0.38.1.patch"

RnJvbSA0ZDNhZDRlY2U3YzJjMjYwZDVjNDJkMmEwOTc0OGNmOGU0YjhjZWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODoxMDoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZGJ1c21vY2s6IHVwZ3JhZGUgMC4zNy4yIC0+IDAuMzguMQoKLS0tCiAuLi4ve3B5dGhv
bjMtZGJ1c21vY2tfMC4zNy4yLmJiID0+IHB5dGhvbjMtZGJ1c21vY2tfMC4zOC4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWRidXNtb2NrXzAuMzcuMi5i
YiA9PiBweXRob24zLWRidXNtb2NrXzAuMzguMS5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGJ1c21vY2tfMC4zNy4yLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMzguMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZGJ1c21vY2tfMC4zNy4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZGJ1c21vY2tfMC4zOC4xLmJiCmluZGV4IGFmYmYwZjBjNTcuLmJj
ODFiMzYyZWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kYnVzbW9ja18wLjM3LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWRidXNtb2NrXzAuMzguMS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3B5dGhvbi1kYnVzbW9jay8iCiBMSUNFTlNFID0gIkdQTC0z
LjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU2YTYwMGZk
NWUxZDljYmRlMmQ5ODM2ODAyMzNhZDAyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTBjNzM1
NGY2ODg3MDM2ZWU1MTlmMmZiYmE1NWNlMTRiYjIxYzNmZmNlYWIwNmMwODVkMTViYmJkYTJiMWQw
MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMjFiNjVlMWMyZTQ4ZGU5ZmQxMWJmN2U4YzE2NWFk
YWY5MTY0OGY0OWExMWYzOTBkMDg2YTQ5ODM4NmYyOTg0IgogCiBQWVBJX1BBQ0tBR0UgPSAicHl0
aG9uX2RidXNtb2NrIgogVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdFID0gIiR7UFlQSV9QQUNL
QUdFfSIKLS0gCjIuNDcuMQoK

--===============6592009594737496090==--

