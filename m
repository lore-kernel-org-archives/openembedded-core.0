Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C077C44503
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:11:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2993.1783577519002157720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PJJuxzqS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XpDydVT2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f45811fbb-03a96ece-8ee7-4c22-ab2c-a75c973d4ce8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577518;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OWwFGKa+R/s8BjVFATrQT6lnwhRcffFJVvuSmim20Xw=;
	b=PJJuxzqSFCdjKMRN4J55YM7vneIlL7nAcCZ38uakn5DDlxtojHnVbIRdEEFo2IDg
	VZ4FQU+qxrC6SFMm5UWKlaE4t+CIqTbi4+zSw+r9HS3g2z9ZRKRrbM2KHjc0W2axfYg
	OCaMQ1jg6QL5fPqV8IVtCJGnw9ri1mZ+ph0QLSjs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577518;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OWwFGKa+R/s8BjVFATrQT6lnwhRcffFJVvuSmim20Xw=;
	b=XpDydVT2lNl0OkU0jTddG21hMC2d4FiD4hXWF0UVzstPrscvOsWy2wumiZs2obz0
	WtnTfQUhfroaBsIRlc05XLVEHw+7Q/jvJd3kPQl+ncF0/EF1avUJxr+Y71wVnK+7exs
	C77N3aLLbrYoU0ROGt/ivCk2dGBzNibQj5vFZb1Q=
Content-Type: multipart/mixed; boundary="===============2742467425876578288=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.28.5 SUCCEEDED
Message-ID: <0101019f45811fbb-03a96ece-8ee7-4c22-ab2c-a75c973d4ce8-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240537

--===============2742467425876578288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.28.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.28.4-1.28.5.patch
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
From a1572b8d4736ee1ea579d0cf9f96ad5710ebfd3e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 05:56:28 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.28.4 -> 1.28.5

---
 ...reamer1.0-python_1.28.4.bb => gstreamer1.0-python_1.28.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.4.bb => gstreamer1.0-python_1.28.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
index 555b310594..d9179286a3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c4eb382720b4443fb801a53418dff0bd4cd7478716d5ced493504a675b4d09fd"
+SRC_URI[sha256sum] = "0ac461b5700b9766998aa686439064caf58ca4fdaf848dfd477b5a7700b176cc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.47.1


--===============2742467425876578288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d62813b58da61cf10919f20ec64ed6ecf66343b5"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:d62813b58da61cf10919f20ec64ed6ecf66343b5"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1290 Local 1243 Mirrors 0 Missed 47 Current 318 (96% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_populate_lic_setscene)
NOTE: Running setscene task 343 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 391 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 392 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 424 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 470 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 478 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_create_spdx_setscene)
NOTE: Running setscene task 480 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 483 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 487 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 498 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 499 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.30-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe librsvg-2.62.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 500 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.87-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 505 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 506 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 507 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 509 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.62.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 517 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 520 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 522 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 523 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 527 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.87-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 529 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 531 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bluez5-5.87-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 540 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.30-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.62.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.62.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.58.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.30-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 544 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 546 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.58.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.62.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 564 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe orc-0.4.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.62.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 571 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 592 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 593 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 596 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 610 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.62.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 630 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 632 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 650 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.62.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_package_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 670 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 673 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 681 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 693 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 704 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.58.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_setscene: Started
NOTE: recipe pango-1.58.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.62.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 726 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 727 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.96.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.62.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 757 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 758 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 761 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 764 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 784 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 787 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 800 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 802 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 820 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 835 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 843 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 848 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 859 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 860 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 873 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 877 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 889 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 913 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 918 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 933 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 953 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 967 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 977 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 981 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 983 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 992 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1000 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1023 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1028 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1029 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1035 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1040 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1044 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1049 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1055 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1065 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1068 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1075 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1080 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1088 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1100 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1111 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1120 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1125 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1126 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1128 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1130 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 539 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1155 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1158 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 975 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1004 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1312 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1352 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_fetch)
NOTE: Running task 1397 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_fetch)
NOTE: Running task 1426 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_fetch)
NOTE: Running task 1441 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1488 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_recipe_qa)
NOTE: Running task 1504 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_write_config)
NOTE: Running task 1514 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_write_config)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_fetch: Started
NOTE: Running task 1571 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_write_config)
NOTE: Running task 1589 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_fetch: Succeeded
NOTE: Running task 1642 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_create_recipe_spdx)
NOTE: Running task 1646 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_recipe_qa: Started
NOTE: Running task 1647 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_unpack)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_write_config: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1678 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1679 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1680 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 1682 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_fetch: Succeeded
NOTE: Running task 1683 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1684 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_unpack: Started
NOTE: Running task 1685 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_patch)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_fetch: Succeeded
NOTE: Running task 1686 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_unpack: Succeeded
NOTE: Running task 1687 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_patch)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pygobject-3.56.3-r0: task do_patch: Started
NOTE: Running setscene task 1172 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1173 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1174 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1175 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1178 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1179 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1180 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1181 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1182 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1183 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 1184 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.58.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1185 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1186 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1187 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1188 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1189 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1190 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1191 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1192 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1200 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.58.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1688 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.58.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1208 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1211 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1213 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1214 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.58.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1216 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1218 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1219 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1222 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1226 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1227 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-14.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1229 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1231 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.58.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1232 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1234 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_package_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1235 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1237 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.58.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-14.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1243 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-14.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1245 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1246 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running task 1731 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_patch)
NOTE: Running task 1734 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1742 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1248 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1749 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_patch: Started
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-14.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_patch: Started
NOTE: Running setscene task 1251 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1252 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash c1188c844478778af6d732e80b25c498e29152c733ea86dea1a2e51080c0c036 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '60730317a09c613069aa6434ff4dc614debfe895af5830c26668cee61205e081', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'c1188c844478778af6d732e80b25c498e29152c733ea86dea1a2e51080c0c036'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 60730317a09c613069aa6434ff4dc614debfe895af5830c26668cee61205e081 -> c1188c844478778af6d732e80b25c498e29152c733ea86dea1a2e51080c0c036 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe mesa-2_26.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1254 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1255 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1258 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1259 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1263 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-14.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1265 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1269 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-14.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1270 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1272 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1273 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1274 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1284 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1289 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1290 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1293 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1297 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1300 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1312 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1313 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1318 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_26.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1321 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1322 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1326 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 1336 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_26.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1343 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1344 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1350 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1354 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1356 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1357 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1358 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1359 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1361 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1363 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1366 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1367 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1368 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1369 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1370 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1376 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1377 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1379 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1381 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1383 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1942 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1385 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1388 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1389 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1391 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running setscene task 1393 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1395 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1396 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1399 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1400 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1402 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1403 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1404 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1409 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1412 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1414 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1415 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1416 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1417 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1419 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1420 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1421 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1422 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1423 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2006 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1427 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1430 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1431 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1433 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1434 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1435 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1437 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1439 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1440 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1441 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1442 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1443 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1444 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1447 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1449 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1452 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1454 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1457 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1458 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1459 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1460 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1461 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1462 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1464 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1468 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1469 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1471 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1474 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1476 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1477 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1478 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1479 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1480 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1481 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1482 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1483 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1485 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1486 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1488 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1489 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1490 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1491 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1493 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1495 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1497 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1500 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1502 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1503 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1504 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1505 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1507 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1509 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1511 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1512 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1514 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1515 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1520 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1522 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1523 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1524 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1525 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1527 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1528 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1533 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1534 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1535 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1540 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1542 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1545 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1546 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1547 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1549 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1551 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1552 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1554 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1557 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1558 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1561 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2464 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1564 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1565 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1567 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1568 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1570 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1572 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1574 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1575 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1577 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1578 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1579 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1580 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1581 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1589 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1591 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1593 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1594 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1598 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1600 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1605 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3424 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3524 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3661 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3721 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_package_write_ipk)
NOTE: Running task 3722 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_package_write_deb)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3723 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_package_write_rpm)
NOTE: Running task 3724 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb:do_package_qa)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3725 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3726 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash c1188c844478778af6d732e80b25c498e29152c733ea86dea1a2e51080c0c036 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ccdef911e3b6c2aaba741d6e2f7057fb89f955594e81f3226d5155360c6ef5a8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'c1188c844478778af6d732e80b25c498e29152c733ea86dea1a2e51080c0c036'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed ccdef911e3b6c2aaba741d6e2f7057fb89f955594e81f3226d5155360c6ef5a8 -> c1188c844478778af6d732e80b25c498e29152c733ea86dea1a2e51080c0c036 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3728 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3741 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_configure: Succeeded
NOTE: Running task 3742 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_compile: Succeeded
NOTE: Running task 3743 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_install)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_install: Succeeded
NOTE: Running task 3744 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_populate_sysroot)
NOTE: Running task 3745 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_package)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3746 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3747 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_configure)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3748 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_package: Succeeded
NOTE: Running task 3749 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3750 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_create_spdx)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3751 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3752 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3753 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_compile)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pygobject-3.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3754 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_install)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_configure: Succeeded
NOTE: Running task 3755 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_install: Succeeded
NOTE: Running task 3756 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package)
NOTE: Running task 3757 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package unihash changed to 9d66c66871d680751f3c0e46cf58043db90891c9536c4a6e8f7b887d279a678c
NOTE: Setscene tasks completed
NOTE: Running task 3758 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3759 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_package_write_ipk)
NOTE: Running task 3760 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_package_write_deb)
NOTE: Running task 3761 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_package_write_rpm)
NOTE: Running task 3762 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_package_qa)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package: Succeeded
NOTE: Running task 3763 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_packagedata unihash changed to 7bac3d0f4bcab3f3d32fbb5460587681a559a9101486bb5f2d76c66aad524826
NOTE: Setscene tasks completed
NOTE: Running task 3764 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_create_spdx)
NOTE: Running task 3765 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package_write_ipk)
NOTE: Running task 3766 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package_write_deb)
NOTE: Running task 3767 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package_write_rpm)
NOTE: Running task 3768 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package_qa)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_create_spdx: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package_qa: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package_write_ipk unihash changed to 67946a0814c18c20a60be776db1e830f7a94585653fa1e809f81c47c29eb4724
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package_qa unihash changed to 92845fc97607d4d28effade94e01d3d3b6b8ddda93850023d7d36cc5c968f018
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package_write_rpm unihash changed to a57279f36f5adc428abb81399ddc2b21d35973b0003ff835b75ef40779b8788c
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.56.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_package_write_deb unihash changed to ed7f97be56ccf36adb62ea8be0b8c35dfa43ec175ae0c50ac0fac089bae6552f
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb:do_package_qa unihash changed to 605e02d6024cc53458f0263ccc287cd3764eb90fef8d1304adc11953e7669750
NOTE: recipe gstreamer1.0-1.28.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_compile: Succeeded
NOTE: Running task 3769 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_install: Succeeded
NOTE: Running task 3770 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_package)
NOTE: Running task 3771 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3772 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3773 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_configure: Succeeded
NOTE: Running task 3774 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_compile)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_compile: Succeeded
NOTE: Running task 3775 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_install)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_install: Succeeded
NOTE: Running task 3776 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.28.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_package: Succeeded
NOTE: Running task 3777 of 3787 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3777 tasks of which 3694 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260709055514.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260709055514.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-bad/1.28.4/temp/log.do_packagedata.4186206
Summary: There were 186 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ar went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-kk went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstanalytics-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstdxva-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstmse-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-analyticsoverlay went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mse went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-unixfd went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvcgadget went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-analytics-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecparsers-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dxva-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mse-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.28.5-r0 to 0:1.28.4-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.28.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-bad/1.28.4/temp/log.do_packagedata.4186206
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb:do_packagedata) failed with exit code '1'

--===============2742467425876578288==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.28.4-1.28.5.patch"

RnJvbSBhMTU3MmI4ZDQ3MzZlZTFlYTU3OWQwY2Y5Zjk2YWQ1NzEwZWJmZDNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNTo1NjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yOC40IC0+IDEuMjguNQoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjguNC5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjguNS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yOC40LmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yOC41LmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjguNC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjguNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjI4LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjguNS5iYgppbmRleCA1NTViMzEwNTk0Li5kOTE3OTI4NmEzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI4LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yOC41LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNGViMzgyNzIwYjQ0NDNmYjgwMWE1MzQx
OGRmZjBiZDRjZDc0Nzg3MTZkNWNlZDQ5MzUwNGE2NzViNGQwOWZkIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjBhYzQ2MWI1NzAwYjk3NjY5OThhYTY4NjQzOTA2NGNhZjU4Y2E0ZmRhZjg0OGRmZDQ3
N2I1YTc3MDBiMTc2Y2MiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgog
UkRFUEVORFM6JHtQTn0gKz0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
IHB5dGhvbjMtcHlnb2JqZWN0IgotLSAKMi40Ny4xCgo=

--===============2742467425876578288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-python/1.28.4/plugin -> /usr/src/debug/gstreamer1.0-python/1.28.5/plugin, directory renamed /usr/src/debug/gstreamer1.0-python/1.28.4/gi/overrides -> /usr/src/debug/gstreamer1.0-python/1.28.5/gi/overrides
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python: PKGV changed from 1.28.4 [default] to 1.28.5 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python: PV changed from "1.28.4" to "1.28.5"
packages/x86-64-v3-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.28.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.28.5.tar.xz"

--===============2742467425876578288==--

