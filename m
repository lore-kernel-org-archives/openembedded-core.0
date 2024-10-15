Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414DAD1F9DB
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11815.1728994567162786026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BJ1ViFsq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=B8nB0s8b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010192901b6199-469d4ffe-93d4-457a-9f4a-7bcb7e8fdc9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o7U8+Z+O2R/NTQRsZNvsb4gjCtIKSPOIQgwSUxhcvxU=;
	b=BJ1ViFsq4SWdElwbz7EKzsuFpHL4G6N/15rgwfwI6d6qewoIo35+KOWCZqtVPmLx
	kaGmw2n1/z92yTjTFw093KGpYD7iZHy9grAU0JIHDI+9K4G3HyAg6TKfxX/bfmgDb68
	qU7of8eV7SUGxzmaxvOeRtWPxL29YVafzcRiS6V4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o7U8+Z+O2R/NTQRsZNvsb4gjCtIKSPOIQgwSUxhcvxU=;
	b=B8nB0s8bE9SnFrL2RlK+SK5KDS+9hbBLzCMUN1BaV6Q2DwnCf+1UPOEn9pxRD/FJ
	zpHvDLRJchiq5Nd7odJCj3lvcknOW+YpRjn2OtOgEkgJW4hZdiAG5mkLIEgQwsqHw6U
	LYAqDWk4iJ8DHdrPvuLpMI2EW1HDhYbo3GEsis5k=
Content-Type: multipart/mixed; boundary="===============1965659794388445022=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 47.1 SUCCEEDED
Message-ID: <01010192901b6199-469d4ffe-93d4-457a-9f4a-7bcb7e8fdc9e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205876

--===============1965659794388445022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *47.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-47.0-47.1.patch
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
From d4537f05589c349a34ab3280cf32903e8e2508be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 10:27:17 +0000
Subject: [PATCH] epiphany: upgrade 47.0 -> 47.1

---
 .../epiphany/{epiphany_47.0.bb => epiphany_47.1.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_47.0.bb => epiphany_47.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_47.0.bb b/meta/recipes-gnome/epiphany/epiphany_47.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_47.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_47.1.bb
index b3e295737d..a726d01314 100644
--- a/meta/recipes-gnome/epiphany/epiphany_47.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_47.1.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "8e38ee7f90fd6054f8aef0e7f505d53c4520742f5acd1f008282a47b2764affa"
+SRC_URI[archive.sha256sum] = "642fd72045f6e9b18f09c3ef16df762d9b7816119abb22edd5d82ef687c6a004"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index e129d503e8..a3ce3447e7 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 4ec86871f8c2a854aec9e6955566fa437fd5f09a Mon Sep 17 00:00:00 2001
+From b977401138a710c67b41a20664b6f31a64be3b6f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index ba674e4aad..5d949de65b 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 641c9d5fc0d9f16151a20a5df2f0b4059d1130a1 Mon Sep 17 00:00:00 2001
+From 0f312ac67cb600560870f1836eeddaac5a15cdb1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 2691828..c466af6 100644
+index 91ba264..104d5db 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 53837f448b..46d983f257 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 2fcc2b3c3751b2fb63474ca78b24e4b6375d62a9 Mon Sep 17 00:00:00 2001
+From 98a5caf1f9fad9957e9e6f79411690867be036f3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.44.1


--===============1965659794388445022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
Removing 152 recipes from the core2-64 sysroot...done.
Removing 160 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:260180b7835e2cf10cb25d061edf6b29eb4beedc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1243 Local 1128 Mirrors 0 Missed 115 Current 438 (90% match, 93% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 443 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 474 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 499 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.32.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe epiphany-47.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libportal-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 510 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-47.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 516 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.32.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libportal-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 525 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 526 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 542 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 547 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libportal-0.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_create_spdx_setscene)
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 551 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 552 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 554 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_create_spdx_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libportal-0.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 556 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 560 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 561 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 564 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libarchive/3.7.6/temp/log.do_packagedata_setscene.2916441
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_package_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 573 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 574 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 604 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 605 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 606 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 611 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 625 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 632 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 635 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk4-4.16.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_populate_sysroot_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 644 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 645 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 648 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 655 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_package_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-10.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 656 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 657 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 658 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 663 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 671 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 678 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 685 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 691 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 693 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 697 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 698 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 701 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 703 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 706 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_package_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 713 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 718 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 733 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 741 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-10.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 742 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 744 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 745 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 746 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 747 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx_setscene)
NOTE: Running setscene task 752 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 753 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 759 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 772 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 775 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-10.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 781 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 783 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 784 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 785 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 786 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 788 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 797 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 803 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 804 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 805 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 806 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 807 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 809 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 812 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 817 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 834 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 838 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 839 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 842 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 849 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 851 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 862 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 867 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 869 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 874 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 875 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 876 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 879 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 884 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 886 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 889 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 900 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 905 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 907 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 909 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 910 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 912 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 917 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 918 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 921 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 930 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 933 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 936 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 939 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 941 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 951 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 956 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 957 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 962 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 963 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 964 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 965 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe enchant2-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 967 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 972 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 973 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 975 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 977 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 979 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 981 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 983 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 984 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 985 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 987 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 989 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 990 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe enchant2-2.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 991 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 995 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 999 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1006 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1009 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1014 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1017 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1019 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1021 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1023 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1027 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1029 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1032 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1034 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1035 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1037 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1040 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1041 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1044 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1045 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1048 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1049 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1053 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1055 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1057 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1059 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1060 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1062 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1063 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1064 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1065 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1070 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1071 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1072 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1074 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1075 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1077 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1078 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1082 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1087 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1089 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1091 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1092 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1094 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1096 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1098 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1099 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1101 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1102 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1104 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1107 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1109 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1110 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1114 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1116 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1120 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1121 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1122 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1124 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1126 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1129 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1131 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1132 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1134 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1136 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1137 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_populate_sysroot_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1138 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1139 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1142 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1143 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1145 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1147 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1148 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1149 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1151 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1153 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1155 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1158 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1160 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.63.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1163 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1165 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1167 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1169 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.63.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1170 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1171 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.63.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1173 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1174 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.63.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1177 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1213 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1215 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1282 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1283 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1284 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.63.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1378 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1380 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1381 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.63.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1417 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1419 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1425 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1426 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1428 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.63.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1430 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1431 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1432 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1433 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1434 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1437 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1438 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1440 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1442 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1444 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1445 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.63.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.63.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1447 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1451 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1453 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1455 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1456 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1458 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1461 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1462 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1463 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1467 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1472 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1476 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1478 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1479 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1480 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1481 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1483 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1488 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1495 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1496 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1497 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1500 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1501 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1503 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1504 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_setscene)
NOTE: Running task 1789 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1792 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1840 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_fetch)
NOTE: Running task 1869 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_fetch)
NOTE: Running task 1919 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_fetch)
NOTE: Running task 1921 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1939 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: Running task 1946 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1948 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_write_config)
NOTE: Running task 1953 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_fetch)
NOTE: Running task 1971 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1981 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_write_config)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_fetch: Started
NOTE: Running setscene task 1508 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_setscene: Started
NOTE: Running task 2003 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_fetch)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_fetch: Succeeded
NOTE: Running task 2015 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_write_config)
NOTE: Running task 2016 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_unpack)
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2017 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_unpack)
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.10.0-r0: task do_fetch: Started
NOTE: Running task 2018 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe gtk4-4.16.3-r0: task do_fetch: Started
NOTE: Running task 2019 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_unpack)
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Started
NOTE: Running task 2020 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: recipe json-glib-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Started
NOTE: Running task 2021 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_unpack)
NOTE: Running task 2026 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_unpack)
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_unpack: Started
NOTE: Running task 2030 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_write_config: Succeeded
NOTE: Running task 2057 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_write_config)
NOTE: Running task 2058 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: Running task 2137 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2138 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_unpack)
NOTE: Running task 2146 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_write_config)
NOTE: Running task 2149 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe json-glib-1.10.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Started
NOTE: Running task 2153 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_write_config)
NOTE: recipe gtk4-4.16.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_unpack: Succeeded
NOTE: Running task 2154 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Started
NOTE: recipe json-glib-1.10.0-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2186 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_write_config)
NOTE: Running task 2198 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2207 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: Running task 2217 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_patch)
NOTE: Running task 2227 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_fetch)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_patch: Started
NOTE: recipe json-glib-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_write_config: Succeeded
NOTE: Running task 2228 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_patch)
NOTE: Running task 2230 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 2231 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: recipe gtk4-4.16.3-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_patch: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Started
NOTE: Running task 2233 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2234 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_patch)
NOTE: Running task 2236 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_fetch)
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_write_config: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: Running task 2237 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_fetch)
NOTE: recipe json-glib-1.10.0-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2268 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_generate_toolchain_file)
NOTE: Running task 2271 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb:do_fetch)
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_fetch: Started
NOTE: Running task 2277 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2282 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Started
NOTE: Running task 2298 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_unpack)
NOTE: Running task 2300 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 2301 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: recipe enchant2-2.8.2-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Succeeded
NOTE: Running task 2302 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_unpack)
NOTE: recipe enchant2-2.8.2-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2304 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_unpack)
NOTE: recipe webkitgtk-2.44.3-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.44.3-r0: task do_fetch: Succeeded
NOTE: Running task 2305 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_unpack)
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: Running task 2349 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_fetch)
NOTE: Running task 2350 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Started
NOTE: Running task 2352 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_patch)
NOTE: Running task 2353 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: recipe enchant2-2.8.2-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2354 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Succeeded
NOTE: Running task 2355 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_patch)
NOTE: recipe libportal-0.8.1-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2356 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb:do_fetch)
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2357 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_unpack: Succeeded
NOTE: Running task 2358 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: Running task 2359 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2361 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_fetch)
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 2363 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_patch)
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Started
NOTE: recipe enchant2-2.8.2-r0: task do_patch: Started
NOTE: recipe libadwaita-1.6.0-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_patch: Started
NOTE: recipe libadwaita-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2364 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_patch)
NOTE: Running task 2365 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Started
NOTE: recipe libportal-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_patch: Succeeded
NOTE: Running task 2384 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: Running task 2385 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_unpack)
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_patch: Succeeded
NOTE: Running task 2463 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_unpack)
NOTE: Running task 2464 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: Running task 2466 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: Running task 2467 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb:do_unpack)
NOTE: Running task 2468 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_unpack)
NOTE: recipe appstream-1.0.3-r0: task do_patch: Started
NOTE: Running task 2469 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_patch)
NOTE: recipe webkitgtk-2.44.3-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_unpack: Started
NOTE: Running task 2520 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_write_config)
NOTE: Running task 2523 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: Running task 2524 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_patch: Succeeded
NOTE: Running task 2526 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_write_config)
NOTE: recipe libportal-0.8.1-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.6.0-r0: task do_unpack: Started
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Started
NOTE: Running task 2534 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.1.bb:do_recipe_qa)
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-47.1-r0: task do_recipe_qa: Started
NOTE: Running task 2535 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_patch)
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Succeeded
NOTE: Running task 2543 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Succeeded
NOTE: Running task 2588 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: Running task 2598 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_write_config)
NOTE: Running task 2599 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: Running task 2600 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: Running task 2602 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb:do_write_config)
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2603 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_patch)
NOTE: Running task 2605 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libportal-0.8.1-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.6.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_patch: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: Running task 2656 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.1.bb:do_write_config)
NOTE: recipe libportal-0.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 2684 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.6.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_patch: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe epiphany-47.1-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-47.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2814 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb:do_patch)
NOTE: recipe libportal-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2815 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.1.bb:do_fetch)
NOTE: Running task 2816 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_patch)
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-47.1-r0: task do_write_config: Succeeded
NOTE: Running task 2817 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: recipe libadwaita-1.6.0-r0: task do_patch: Started
NOTE: recipe epiphany-47.1-r0: task do_fetch: Started
NOTE: recipe libportal-0.8.1-r0: task do_patch: Started
NOTE: recipe epiphany-47.1-r0: task do_fetch: Succeeded
NOTE: Running task 2818 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.1.bb:do_unpack)
NOTE: recipe libadwaita-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2820 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libportal-0.8.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-47.1-r0: task do_unpack: Started
NOTE: recipe gtk4-4.16.3-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running task 2822 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_patch)
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_patch: Started
NOTE: recipe gtk4-4.16.3-r0: task do_patch: Succeeded
NOTE: recipe epiphany-47.1-r0: task do_unpack: Succeeded
NOTE: Running task 2825 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.1.bb:do_patch)
NOTE: recipe epiphany-47.1-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2826 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe epiphany-47.1-r0: task do_patch: Succeeded
NOTE: Running task 2827 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-47.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-47.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.44.3-r0: task do_unpack: Succeeded
NOTE: Running task 2830 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb:do_patch)
NOTE: recipe webkitgtk-2.44.3-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.44.3-r0: task do_patch: Succeeded
NOTE: Running task 2832 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb:do_generate_toolchain_file)
NOTE: recipe webkitgtk-2.44.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.44.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1517 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1518 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1519 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1520 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1521 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1522 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1523 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1525 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1530 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1532 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1533 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1535 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1537 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1539 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1540 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1543 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1544 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1545 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1546 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1547 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1548 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1549 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1551 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1552 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1553 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1554 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1555 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1556 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1557 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1558 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1559 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1561 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1564 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1566 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1569 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1572 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1577 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1578 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1579 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1580 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1582 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1583 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1584 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1585 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1587 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1588 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1589 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1593 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1595 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1596 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1598 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1600 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1601 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1603 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1605 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1607 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1608 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1610 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1612 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1614 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1616 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1618 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1620 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1623 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1624 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1626 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1628 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1629 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1630 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1632 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1637 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1639 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1641 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1642 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1644 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1646 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1648 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1650 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1651 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1653 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1654 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1655 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1656 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1658 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1662 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1663 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1665 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1670 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1672 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1673 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1677 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1678 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1680 of 1681 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3832 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3836 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3873 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3902 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3945 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3980 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4018 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4061 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4109 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4110 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4112 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4113 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4141 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4194 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 4196 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4226 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4227 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4244 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4245 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4246 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_configure)
NOTE: Running task 4247 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure)
NOTE: Running task 4248 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_configure)
NOTE: Running task 4249 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 4250 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_configure)
NOTE: Running task 4251 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: Running task 4252 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: Running task 4253 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_configure: Started
NOTE: Running task 4254 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_configure)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Started
NOTE: Running task 4255 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_configure)
NOTE: Running task 4256 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 4272 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.10.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Started
NOTE: Running task 4287 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Started
NOTE: recipe enchant2-2.8.2-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4296 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: Running task 4301 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4313 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4324 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4332 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4333 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4334 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4336 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 4337 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4338 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4345 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 4348 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_install)
NOTE: Running task 4349 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe libwpe-1.16.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 4350 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 4351 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 4352 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_package)
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4353 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_compile)
NOTE: Running task 4354 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: Running task 4355 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe json-glib-1.10.0-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: Running task 4356 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Succeeded
NOTE: Running task 4357 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure_ptest_base)
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Succeeded
NOTE: Running task 4358 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_compile)
NOTE: recipe json-glib-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Started
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4359 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4360 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_compile: Succeeded
NOTE: Running task 4361 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_install)
NOTE: recipe json-glib-1.10.0-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4362 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 4363 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot)
NOTE: Running task 4364 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_configure: Succeeded
NOTE: Running task 4365 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_install: Succeeded
NOTE: Running task 4366 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4367 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 4368 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata)
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata unihash changed to f25a4f4e4ce4b0ebd16ba4867fc623ad6af54701d030ffa53030efcf02395bbb
NOTE: Setscene tasks completed
NOTE: Running task 4369 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: Running task 4370 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 4371 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to a20ca1508544a57af635fc4fd64f0141691612b6bb995792fb9c34c34c4c67d0
NOTE: Setscene tasks completed
NOTE: Running task 4372 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 4373 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 4374 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe json-glib-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 4375 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4376 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_install)
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Succeeded
NOTE: Running task 4377 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 4378 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.10.0-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4379 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 4380 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4381 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Succeeded
NOTE: Running task 4382 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_install)
NOTE: recipe json-glib-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 4383 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_install: Started
NOTE: Running task 4384 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_compile: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Started
NOTE: Running task 4385 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_install)
NOTE: recipe json-glib-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4386 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4387 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 4388 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_install: Started
NOTE: Running task 4389 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_package)
NOTE: Running task 4390 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe json-glib-1.10.0-r0: task do_package: Started
NOTE: recipe json-glib-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Started
NOTE: Running task 4391 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: Running task 4392 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libsecret-0.21.4-r0: task do_install: Succeeded
NOTE: Running task 4393 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_populate_sysroot)
NOTE: Running task 4394 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package: Succeeded
NOTE: Running task 4395 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4396 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: Running task 4397 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_packagedata)
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4398 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 4399 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_install: Succeeded
NOTE: Running task 4400 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_populate_sysroot)
NOTE: Running task 4401 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_package)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_packagedata unihash changed to 0f7c004fe629ac0e67a46bd0bf5c21107ee9af0dafa2891c35801817bdd3b4a2
NOTE: Running task 4402 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 4403 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_ipk)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to feb50d03871462d5312c1b3ddadc9443fd008d2577c1ecbf8022d289cf11fa89
NOTE: Setscene tasks completed
NOTE: Running task 4404 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_create_spdx: Started
NOTE: Running task 4405 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_deb)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_ipk: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_deb: Started
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4406 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_configure)
NOTE: recipe appstream-1.0.3-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4407 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_rpm)
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 4408 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_ipk unihash changed to bf4f234cf8c798a7659fc16087f63c81e9e208760339970f8280073b8dd854d6
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_deb unihash changed to 589c6ce2b3483bef1d723a7c4ad28ba9ba4fef61c5f18284b0d06879f699ff9b
NOTE: Running task 4409 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: Running task 4410 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to fe0558a19d16e1184fde44adacc9b178402ef3e00c2a22b46a03f28820aa33de
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata unihash changed to 9cd91bbdb45471610e8c5b912eb51019dd563e5fd55990652e1d2cf5d079ee0d
NOTE: Setscene tasks completed
NOTE: Running task 4411 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: Running task 4412 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 4413 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 4414 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 4415 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: Running task 4416 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to 58e57b0f7be4b72e5589671a6e5e21755c64b965ae429565437c8196ed2b751a
NOTE: Setscene tasks completed
NOTE: Running task 4417 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_ipk)
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: Running task 4418 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_deb)
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4419 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_rpm: Started
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4420 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_compile)
NOTE: recipe appstream-1.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 4421 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libsecret-0.21.4-r0: task do_package: Succeeded
NOTE: Running task 4422 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata)
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 4423 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 4424 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.10.0-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: Running task 4425 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_packagedata)
NOTE: recipe json-glib-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata unihash changed to e8c9d4483a9136347a248144c461a95e548edc31948bd44e8dcbba7ac424d71d
NOTE: Setscene tasks completed
NOTE: Running task 4426 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4427 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4428 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_packagedata unihash changed to edd56e78b08b1ad7f6ccdad3157572015f4c8da5a4bd625eded9e2524f075a79
NOTE: Setscene tasks completed
NOTE: Running task 4429 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_ipk unihash changed to 3b5fefcd6f8c48c39b5453a442f2b71e5d2b88b38be5cc34e703194da3fc2a7d
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4430 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 4431 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.10.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4432 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata unihash changed to 5a0dc8fc615a39409dc8cf7fc6191061affcc5da9cb19e283f7522f31be3d864
NOTE: Setscene tasks completed
NOTE: Running task 4433 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 4434 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-47.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_47.1.bb:do_package_write_rpm unihash changed to 72ddba210819c207dc2a3a2e6bf3a4cf1712bd7b310a6d9ca23b8b88afbf5f51
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to bb4b9a64e9000b622cf492294c3eb208cd28e45d06864c275305c2c89937b248
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4435 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4436 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_package: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4437 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4438 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_compile)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_configure: Succeeded
NOTE: Running task 4439 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_compile)
NOTE: recipe enchant2-2.8.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_packagedata unihash changed to fd28f77f43b4959e4c6ea12e769f230b4cf2eaf24dc3281f1d354374c0688235
NOTE: Setscene tasks completed
NOTE: Running task 4440 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4441 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_install)
NOTE: recipe appstream-1.0.3-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_compile: Succeeded
NOTE: Running task 4442 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4443 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 4444 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_populate_sysroot)
NOTE: Running task 4445 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_package)
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_install: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_package: Started
NOTE: Running task 4446 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_populate_sysroot)
NOTE: Running task 4447 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_package)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_compile: Succeeded
NOTE: Running task 4448 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_install)
NOTE: recipe enchant2-2.8.2-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4449 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_compile)
NOTE: Running task 4450 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_populate_sysroot)
NOTE: Running task 4451 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_package)
NOTE: recipe enchant2-2.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Started
NOTE: recipe enchant2-2.8.2-r0: task do_package: Started
NOTE: recipe enchant2-2.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_package: Succeeded
NOTE: Running task 4452 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_packagedata unihash changed to 9578d58d1327aa4d0645ae4724f40a29054c6d41fae83f1670b8f73874d6a71e
NOTE: Setscene tasks completed
NOTE: Running task 4453 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb:do_create_spdx)
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.14.3-r0: task do_create_spdx: Succeeded
NOTE: recipe enchant2-2.8.2-r0: task do_package: Succeeded
NOTE: Running task 4454 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_packagedata)
NOTE: recipe enchant2-2.8.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_deb unihash changed to 7b8b84c6634f3d445f7ade5d399b68ac7a25be58c1dc50d334ed726da20f20dd
NOTE: recipe enchant2-2.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_packagedata unihash changed to 8f348474ec9b7a6d1f4fa52d8cd46846a84e4b8d59669ae17592a36c27d9ca31
NOTE: Setscene tasks completed
NOTE: Running task 4455 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.2.bb:do_create_spdx)
NOTE: recipe appstream-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 4456 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata)
NOTE: recipe enchant2-2.8.2-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata unihash changed to b7808ca1cc242aab49ba98171101e2781e6c795042681e8dadef99843cdf5a47
NOTE: Setscene tasks completed
NOTE: Running task 4457 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_create_spdx)
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 4458 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_install: Started
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 4459 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_sysroot)
NOTE: Running task 4460 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4461 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4462 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_rpm unihash changed to 21526a83318ae67652ce9a0345e8abf37d045430172adb98c3edbe2be246339c
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 4463 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 4464 of 4566 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata: Failed
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 4464 tasks of which 4201 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015102607.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015102607.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0-plugins-base/1.24.6/temp/log.do_packagedata.3000380
Summary: There were 116 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-src went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-dbg went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package bsdcpio went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package bsdtar went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-staticdev went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-dev went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-doc went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-locale went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive went backwards which would break package feeds (from 0:3.7.7-r0 to 0:3.7.6-r0) [version-going-backwards]
ERROR: libarchive-3.7.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-basedebug went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dsd went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0-plugins-base/1.24.6/temp/log.do_packagedata.3000380
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata) failed with exit code '1'

--===============1965659794388445022==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-47.0-47.1.patch"

RnJvbSBkNDUzN2YwNTU4OWMzNDlhMzRhYjMyODBjZjMyOTAzZThlMjUwOGJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTA6Mjc6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0Ny4wIC0+IDQ3LjEKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80Ny4wLmJiID0+IGVwaXBoYW55XzQ3LjEuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L3tlcGlwaGFueV80Ny4wLmJiID0+IGVwaXBoYW55XzQ3LjEuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ3LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDcuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDcu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ3LjEu
YmIKaW5kZXggYjNlMjk1NzM3ZC4uYTcyNmQwMTMxNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ3LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2VwaXBoYW55XzQ3LjEuYmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICIk
e0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9
IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiOGUzOGVlN2Y5MGZkNjA1NGY4YWVmMGU3ZjUwNWQ1M2M0NTIwNzQy
ZjVhY2QxZjAwODI4MmE0N2IyNzY0YWZmYSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjY0MmZkNzIwNDVmNmU5YjE4ZjA5YzNlZjE2ZGY3NjJkOWI3ODE2MTE5YWJiMjJlZGQ1ZDgyZWY2
ODdjNmEwMDQiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1Z2dpbmcKIFBBQ0tBR0VD
T05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9dHJ1ZSwtRGRldmVsb3Bl
cl9tb2RlPWZhbHNlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2Zp
bGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQt
ZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKaW5kZXggZTEyOWQ1MDNlOC4uYTNjZTM0NDdl
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVs
cC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZWM4Njg3MWY4YzJh
ODU0YWVjOWU2OTU1NTY2ZmE0MzdmZDVmMDlhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBiOTc3NDAxMTM4YTcxMGM2N2I0MWEyMDY2NGI2ZjMxYTY0YmUzYjZmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDMxIEphbiAyMDE4IDE1OjUwOjM4ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGhlbHAvbWVzb24uYnVpbGQ6IGRpc2FibGUgdGhlIHVzZSBvZiB5ZWxwCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKaW5kZXgg
YmE2NzRlNGFhZC4uNWQ5NDlkZTY1YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjQx
YzlkNWZjMGQ5ZjE2MTUxYTIwYTVkZjJmMGI0MDU5ZDExMzBhMSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMGYzMTJhYzY3Y2I2MDA1NjA4NzBmMTgzNmVlZGRhYWM1YTE1Y2RiMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogRnJpLCAyNiBGZWIgMjAyMSAxMDoxNzo1MiAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBlbmNvZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMv
b3MtcmVsZWFzZSBpbnRvIHRoZQpAQCAtMTEsNyArMTEsNyBAQCBSUCAyMDIxLzIvMjYKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIv
bWVzb24uYnVpbGQKLWluZGV4IDI2OTE4MjguLmM0NjZhZjYgMTAwNjQ0CitpbmRleCA5MWJhMjY0
Li4xMDRkNWRiIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBA
QCAtMTUsNiArMTUsNyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKaW5kZXggNTM4MzdmNDQ4Yi4u
NDZkOTgzZjI1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVz
L21pZ3JhdG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmZjYzJiM2MzNzUxYjJmYjYzNDc0
Y2E3OGIyNGU0YjYzNzVkNjJhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOThhNWNh
ZjFmOWZhZDk5NTdlOWU2Zjc5NDExNjkwODY3YmUwMzZmMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPgogRGF0ZTogVGh1LCAyNSBGZWIgMjAyMSAxNDo1MjozMiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBlcGlwaGFueTogRml4IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZQotLSAKMi40NC4xCgo=

--===============1965659794388445022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGSIZE changed from 54974 to 44106 (-20%)

--===============1965659794388445022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 5651848 to 5656944 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGSIZE changed from 115981 to 116456 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGSIZE changed from 119046 to 119359 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGSIZE changed from 88832 to 93744 (+6%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 93307 to 93414 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 93801 to 93910 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGSIZE changed from 92032 to 92279 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGSIZE changed from 110310 to 110427 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGSIZE changed from 73702 to 74083 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGSIZE changed from 97379 to 97612 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 87766 to 92107 (+5%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGSIZE changed from 91582 to 91699 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGSIZE changed from 95861 to 96342 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGSIZE changed from 87289 to 87460 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 143477 to 143643 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kab: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGSIZE changed from 90909 to 91025 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 87539 to 92673 (+6%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGSIZE changed from 92436 to 92554 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 91978 to 92220 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 118809 to 118733 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGSIZE changed from 54974 to 44106 (-20%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGSIZE changed from 90204 to 90310 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGSIZE changed from 89485 to 89592 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 90605 to 90715 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGSIZE changed from 116217 to 116356 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGSIZE changed from 83867 to 83974 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4559738 to 4562868 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2097904 to 2097956 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "47.0" to "47.1"
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/47/epiphany-47.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/47/epiphany-47.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PKGV changed from 47.0 [default] to 47.1 [default]
packages/core2-64-poky-linux/epiphany: PV changed from "47.0" to "47.1"

--===============1965659794388445022==--

