Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E43C531DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1374.1721071147269202538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bq8MQNWZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JbWokh9W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010190b7d59994-e0da262c-7861-423a-9728-677aa5a31920-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DGwoaV5vGFB2DLOxP+CupQvu3NcsLDjPm2D9WDtwb38=;
	b=bq8MQNWZBVcZlQeon4OGI9Uu2cvJaBFbJNcQEdMJNwHBAS4uq8k8kI0OjrDx660x
	dLJfX5lTBuvpTe50M4hIrXJ0ViouO7y1LdsS0+qjsmKzppM6fCXe9EY6ykxZB7rwNlb
	RQ9ceeiRh0Uyw+u+WuYsS1rDFHck97BVVb2JG9Qc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DGwoaV5vGFB2DLOxP+CupQvu3NcsLDjPm2D9WDtwb38=;
	b=JbWokh9WJ/jRXKRUEHpUYiFFZwPQk+ilV/geNuJLLoXhFeNLxCbOVLmfan440Y7l
	RFZ83AAjppT39P4K2oMLmhfBxAazKRkS8G3jR0Z+ck7OZAHueUbQLqfw/qWO+tecu41
	X3sE+Lgmi1msCcfiDnGmvrlBVhnbY4IKFihyQjP0=
Content-Type: multipart/mixed; boundary="===============2863315880630405956=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 46.2 SUCCEEDED
Message-ID: <01010190b7d59994-e0da262c-7861-423a-9728-677aa5a31920-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202026

--===============2863315880630405956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *46.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-46.0-46.2.patch
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
From 4100b2a457feca1aefa103553684196c6280f3d7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 14:26:54 +0000
Subject: [PATCH] epiphany: upgrade 46.0 -> 46.2

---
 .../epiphany/{epiphany_46.0.bb => epiphany_46.2.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_46.0.bb => epiphany_46.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_46.0.bb b/meta/recipes-gnome/epiphany/epiphany_46.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_46.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_46.2.bb
index 9052fe170b..01382d0e2e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_46.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_46.2.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "f4348f2cf51c07c0c106d130172d4d23f2cd4068771e1de007b758ca2ade5660"
+SRC_URI[archive.sha256sum] = "fb932da7a24e87f1edb900b5b94251b42b37080753864651c059dc6c93cb5049"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index e505466764..1a0f3dd4ce 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From bd45c75fe691e275d7a7d7e641ac66b153369a1c Mon Sep 17 00:00:00 2001
+From 3891fc36f04f48b627aab5a3848f11b7114d35d8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index a2800eb62d..9ccad4c6a7 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From c297f5b89d7c8e98ac98e1d9a7506df6db6fc025 Mon Sep 17 00:00:00 2001
+From dedfcabc04ea8934e1a920a1615105bc1ea474c0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index e416cc7..ee5f7b1 100644
+index ec658e0..d54ae3a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 1b4404c8ca..7cac503834 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From b38a4ceaeec05efb1b822d52c43590e7fd518113 Mon Sep 17 00:00:00 2001
+From a17a969101af6e4af26e4851f5a1237a9cbacfa9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.44.0


--===============2863315880630405956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 68478 to 129737 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGSIZE changed from 79725 to 98935 (+24%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGSIZE changed from 76679 to 86421 (+13%)
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-kab"

--===============2863315880630405956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 151 recipes from the core2-64 sysroot...done.
Removing 156 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-a0001684b0b243de1a15f3bed7184983f0325b51"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a0001684b0b243de1a15f3bed7184983f0325b51"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1215 Local 1041 Mirrors 0 Missed 174 Current 489 (85% match, 89% complete)
Removing 6 stale sstate objects for arch qemux86_64...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 494 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 513 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 544 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libadwaita-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 562 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb:do_packagedata_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 564 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 567 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 569 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-dbusmock/0.31.1/temp/log.do_packagedata_setscene.3794929
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 588 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_package_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 605 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 621 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 623 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 625 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 626 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 627 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 633 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 644 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 673 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 677 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 679 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 696 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_package_setscene: Started
NOTE: recipe gtk4-4.14.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 715 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.14.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 716 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 735 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 738 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 739 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.57.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 741 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 742 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 753 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 755 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 757 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.57.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 758 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 759 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 761 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 764 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 766 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 769 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.57.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 771 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 772 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 776 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 777 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.57.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 783 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 785 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 786 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 791 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 800 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 802 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 805 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 806 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 809 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 812 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 816 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 819 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 820 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 825 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 827 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 829 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 831 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 835 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 836 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 846 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 851 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 853 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 854 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 860 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 863 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 865 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 871 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 877 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 878 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 884 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 886 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 888 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 891 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 892 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 904 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 907 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 910 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 916 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 918 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 920 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 925 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 928 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 937 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 941 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 945 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 946 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 948 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 949 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 951 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 953 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 958 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 959 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 961 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 962 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 963 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 964 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 966 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 968 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 969 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 973 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 978 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 979 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 985 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 986 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 987 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 988 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 990 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 991 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 994 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 998 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 999 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1001 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1003 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1004 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1005 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1006 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1010 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe enchant2-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1012 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1015 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1017 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1019 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe enchant2-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1020 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1021 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1024 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1025 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1028 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe enchant2-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1033 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1034 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1039 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1043 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1044 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1046 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1048 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1049 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1051 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1052 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1055 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1060 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1065 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1070 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1072 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1075 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1080 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1083 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1086 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1088 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1090 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1091 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1092 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1094 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1101 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1102 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1105 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1106 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 1110 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1111 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1112 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1113 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1114 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1115 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1117 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1118 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1121 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1122 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1123 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1125 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1126 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1129 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1130 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1133 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1135 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1136 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1137 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1138 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1140 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1141 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1142 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1145 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1147 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1149 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1150 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1151 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1158 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1163 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1165 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1170 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1172 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1175 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1176 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1178 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1180 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1186 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1187 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1189 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1190 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1191 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1193 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1194 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1195 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1196 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1197 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1198 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1199 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1200 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1201 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1203 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1204 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1206 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1208 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1209 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1210 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1211 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1213 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1215 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1219 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1220 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1222 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1225 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1226 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1227 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1231 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1232 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1237 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1238 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1239 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1240 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1241 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1242 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1247 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1248 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1250 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1251 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1253 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1254 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1255 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1256 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1257 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1260 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1263 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1264 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1268 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1278 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1279 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1282 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1284 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1286 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1288 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1292 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1295 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1296 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1298 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1300 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1302 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1303 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1304 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1305 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1306 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1308 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1309 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1311 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1378 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1380 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1397 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1469 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1478 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1479 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1520 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_setscene)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1522 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1523 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1526 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1529 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1531 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1535 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 904 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 938 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_fetch)
NOTE: Running task 942 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 944 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 986 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 988 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: Running task 1073 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1074 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.5.0-r0: task do_fetch: Started
NOTE: recipe pango-1.52.2-r0: task do_fetch: Started
NOTE: Running task 1087 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_write_config)
NOTE: Running task 1090 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_write_config)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1094 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: recipe harfbuzz-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1095 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_fetch)
NOTE: Running task 1100 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_unpack)
NOTE: recipe pango-1.52.2-r0: task do_fetch: Succeeded
NOTE: Running task 1112 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: Running task 1139 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1142 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1168 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_write_config: Started
NOTE: recipe pango-1.52.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_unpack: Started
NOTE: Running task 1204 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_fetch: Succeeded
NOTE: Running task 1221 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1234 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe pango-1.52.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1248 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: Running task 1265 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_fetch)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1276 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_fetch)
NOTE: Running task 1281 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1288 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: Running task 1302 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_write_config)
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1326 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe bluez5-5.72-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: recipe bluez5-5.72-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_write_config: Started
NOTE: Running task 1420 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_unpack)
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: Running task 1435 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_unpack)
NOTE: Running task 1439 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_fetch)
NOTE: recipe pango-1.52.2-r0: task do_unpack: Succeeded
NOTE: Running task 1464 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_write_config: Succeeded
NOTE: Running task 1484 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_write_config)
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1518 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: Running task 1526 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1532 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_fetch)
NOTE: recipe bluez5-5.72-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1548 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_patch)
NOTE: Running task 1577 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe pango-1.52.2-r0: task do_patch: Started
NOTE: Running task 1578 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: recipe librsvg-2.57.3-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe pango-1.52.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_patch: Started
NOTE: Running task 1591 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1598 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_unpack)
NOTE: Running task 1607 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.57.3-r0: task do_fetch: Succeeded
NOTE: Running task 1622 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 1623 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1624 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Started
NOTE: Running task 1626 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe bluez5-5.72-r0: task do_unpack: Succeeded
NOTE: Running task 1628 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_fetch: Started
NOTE: Running task 1629 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: Running task 1632 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe librsvg-2.57.3-r0: task do_unpack: Started
NOTE: Running task 1651 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_unpack)
NOTE: recipe bluez5-5.72-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1652 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_patch: Succeeded
NOTE: Running task 1653 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_patch)
NOTE: Running task 1655 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: Running task 1673 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1674 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 1683 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 1686 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 1689 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_patch: Succeeded
NOTE: Running task 1695 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_write_config)
NOTE: recipe gtk+3-3.24.42-r0: task do_fetch: Started
NOTE: Running task 1699 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: Running task 1711 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe gtk+3-3.24.42-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1714 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_fetch)
NOTE: Running task 1719 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1720 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_unpack)
NOTE: recipe bluez5-5.72-r0: task do_patch: Succeeded
NOTE: Running task 1722 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Started
NOTE: Running task 1723 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe gtk4-4.14.4-r0: task do_fetch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1732 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_unpack)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_fetch: Succeeded
NOTE: Running task 1734 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 1735 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_fetch)
NOTE: Running task 1745 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: Running task 1749 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_unpack: Succeeded
NOTE: Running task 1750 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_patch)
NOTE: Running task 1753 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_unpack)
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: Running task 1754 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 1755 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_write_config: Started
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1760 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_patch: Started
NOTE: recipe gtk4-4.14.4-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Succeeded
NOTE: Running task 1761 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_write_config: Succeeded
NOTE: Running task 1776 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1777 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 1782 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_write_config)
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1783 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 1786 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_write_config: Started
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 1788 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.42-r0: task do_write_config: Started
NOTE: Running task 1801 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_write_config: Succeeded
NOTE: Running task 1810 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_patch)
NOTE: Running task 1812 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_write_config)
NOTE: Running task 1816 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_write_config)
NOTE: recipe gtk+3-3.24.42-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Succeeded
NOTE: Running task 1844 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Started
NOTE: Running task 1867 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_fetch)
NOTE: Running task 1868 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_fetch)
NOTE: Running task 1870 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 1871 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: recipe harfbuzz-8.5.0-r0: task do_patch: Started
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_write_config: Started
NOTE: Running task 1873 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_fetch)
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe enchant2-2.8.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Started
NOTE: recipe gtk4-4.14.4-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_patch)
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: Running task 1876 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1882 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_generate_toolchain_file)
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: Running task 1898 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_fetch)
NOTE: Running task 1901 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_fetch)
NOTE: Running task 1914 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_unpack)
NOTE: Running task 1915 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_unpack)
NOTE: Running task 1917 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1918 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Succeeded
NOTE: Running task 1919 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Started
NOTE: Running task 1920 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.1-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Succeeded
NOTE: Running task 1921 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1947 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: Running task 1949 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_fetch)
NOTE: Running task 1950 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_patch)
NOTE: Running task 1952 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: Running task 1953 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1954 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Started
NOTE: Running task 1955 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1956 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: recipe enchant2-2.8.1-r0: task do_patch: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_fetch: Started
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1957 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_fetch)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1958 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: Running task 1959 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1960 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Succeeded
NOTE: Running task 1961 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_patch)
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe enchant2-2.8.1-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1964 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: Running task 1965 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_patch: Succeeded
NOTE: Running task 1968 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_unpack)
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: Running task 1982 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2004 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_unpack)
NOTE: Running task 2006 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_unpack)
NOTE: Running task 2007 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe gtk+3-3.24.42-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: Running task 2008 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_patch)
NOTE: Running task 2009 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_unpack)
NOTE: recipe appstream-1.0.3-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: Running task 2042 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_write_config)
NOTE: Running task 2046 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_unpack: Started
NOTE: Running task 2047 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Started
NOTE: Running task 2049 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_write_config)
NOTE: recipe appstream-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2052 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_unpack: Succeeded
NOTE: Running task 2053 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: Running task 2065 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_recipe_qa)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 2066 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: Running task 2074 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_write_config)
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2091 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.42-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_patch: Started
NOTE: Running task 2110 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_write_config)
NOTE: Running task 2112 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_write_config)
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Succeeded
NOTE: Running task 2113 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: Running task 2114 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_patch: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_recipe_qa: Started
NOTE: Running task 2116 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_write_config: Started
NOTE: recipe gcr-4.3.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_write_config: Succeeded
NOTE: Running task 2146 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_write_config)
NOTE: recipe gcr-4.3.0-r0: task do_patch: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2191 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_patch)
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_write_config: Started
NOTE: recipe epiphany-46.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_fetch)
NOTE: Running task 2237 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_patch)
NOTE: recipe libportal-0.7.1-r0: task do_patch: Started
NOTE: recipe epiphany-46.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: Running setscene task 1542 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1543 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1544 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1545 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1546 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1547 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe epiphany-46.2-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_patch: Started
NOTE: recipe epiphany-46.2-r0: task do_fetch: Succeeded
NOTE: Running task 2240 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_unpack)
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.14.4-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2241 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_unpack: Started
NOTE: Running setscene task 1548 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1550 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1551 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1554 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1556 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.14.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1560 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_patch)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe epiphany-46.2-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1562 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1564 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1565 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1566 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1567 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1568 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1569 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1570 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1571 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1572 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1573 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1574 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1576 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1578 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: recipe epiphany-46.2-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1579 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1581 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1584 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1585 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1587 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1589 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1591 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1593 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1594 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1596 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1598 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1599 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1601 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1603 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xz/5.4.6/temp/log.do_packagedata_setscene.3809645
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1604 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1605 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1607 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1609 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1611 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1612 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1614 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_package_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1616 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1617 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1619 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1621 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1622 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1623 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1628 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1630 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1632 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1635 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1637 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1640 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1642 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1643 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1645 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2755 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2937 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.57.3-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2964 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_patch)
NOTE: Running task 3017 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_populate_lic)
NOTE: recipe epiphany-46.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1647 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1648 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1650 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-46.2-r0: task do_populate_lic: Started
NOTE: recipe librsvg-2.57.3-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Succeeded
NOTE: Running task 3018 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1651 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1652 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1653 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1655 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_populate_lic: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_populate_lic unihash changed to 24c1920052f08560d89da2324b5fc1a005f9240139dc515c6ac8ffdb08c315d4
NOTE: recipe epiphany-46.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.57.3-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 3025 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_rust_gen_targets)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1658 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1660 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1662 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.57.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.57.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 1663 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1665 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1667 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Succeeded
NOTE: Running task 3046 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_generate_toolchain_file)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 1669 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1670 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1672 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1673 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1675 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1677 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1678 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1679 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1683 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1684 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1686 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 3054 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1691 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1692 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1694 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 06d2442fee737e4dab77668d30341b807e9502b1fca5977822c491efcf24f100 to wss://hashserv.yoctoproject.org/ws ({'taskhash': '575fd2b0ce60265c4d734ec46bcc901ce2617e47439c73b14cacadbeb9b5daaf', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '06d2442fee737e4dab77668d30341b807e9502b1fca5977822c491efcf24f100'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 575fd2b0ce60265c4d734ec46bcc901ce2617e47439c73b14cacadbeb9b5daaf -> 06d2442fee737e4dab77668d30341b807e9502b1fca5977822c491efcf24f100 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1697 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1699 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1700 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1702 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1704 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3493 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3505 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3513 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3519 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata)
NOTE: Running task 3529 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3572 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3599 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata: Started
NOTE: Running task 3661 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3844 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3874 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3893 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3929 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3985 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3986 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4023 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: Running task 4032 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4037 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: Running task 4039 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 4083 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4084 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4085 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4086 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4087 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4088 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe harfbuzz-8.5.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4089 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_configure)
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4090 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4091 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4092 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 4093 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4094 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: Running task 4097 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: Running task 4109 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4110 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: Running task 4115 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.8.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4116 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4121 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_configure: Started
NOTE: Running task 4164 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4166 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4167 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4208 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4216 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4236 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4258 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 4259 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4260 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4268 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 4269 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata: Succeeded
NOTE: Running task 4274 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Succeeded
NOTE: Running task 4275 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure_ptest_base)
NOTE: Running task 4276 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4282 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe enchant2-2.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4283 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile)
NOTE: Running task 4284 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: Running task 4285 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_configure: Succeeded
NOTE: Running task 4286 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_compile)
NOTE: recipe enchant2-2.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4288 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: Running task 4289 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4297 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 4301 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot)
NOTE: Running task 4302 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_compile: Succeeded
NOTE: Running task 4303 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_configure: Succeeded
NOTE: Running task 4304 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 4305 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_install: Succeeded
NOTE: Running task 4306 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package)
NOTE: Running task 4307 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_configure: Succeeded
NOTE: Running task 4308 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: Running task 4309 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4310 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4311 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: Running task 4312 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4313 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 4314 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to 5db9736414718339db455167f8ea8bbdfe5ac1b17da127a3d5725487c9f19c29
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 4315 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 4316 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: Running task 4317 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Succeeded
NOTE: Running task 4318 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile_ptest_base)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4319 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: Running task 4320 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4321 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 4322 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 4323 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 7c5abe343338f3014520b56d394af8dbbdcd6e87d7a40b92b61d41a98f9e7354
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4324 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: Running task 4325 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: Running task 4326 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_compile)
NOTE: Running task 4327 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install)
NOTE: Running task 4328 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package: Succeeded
NOTE: Running task 4329 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install_ptest_base)
NOTE: Running task 4330 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4331 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_populate_sysroot)
NOTE: Running task 4332 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_package)
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 4333 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 4334 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 4335 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_packagedata unihash changed to b60adee7a73d3a6d0b97de711c6de978c6886c2241ee05bdf6e09a48c01b8dd6
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 4336 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_install)
NOTE: Running task 4337 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: Running task 4338 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install_ptest_base)
NOTE: Running task 4339 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4340 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: Running task 4341 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_ipk)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_ipk: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4342 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 4343 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4344 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_install: Succeeded
NOTE: Running task 4345 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4346 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_package)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4347 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4348 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_deb)
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Succeeded
NOTE: Running task 4349 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_deb: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 4350 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: Running task 4351 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 4352 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata unihash changed to 121afb3f9aed5e360938f7817d119bd3474c5433059092d4ba47075c540d0d4e
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to f5ece72d05e0cdff47289b87559dbb4efbdf0ff5c56c9392eedf5da1e60ccdc1
NOTE: Setscene tasks completed
NOTE: Running task 4353 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: Running task 4354 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: Running task 4355 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Started
NOTE: Running task 4356 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_ipk unihash changed to 33b6d7848219afaa44cfbc946d2545146f80797b25d07f62d8e4593d6efc8d96
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_deb unihash changed to 5f5ff1879ba9597be1479d2110cf9ca09b08012aac802d449642e55372f134b9
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 4149b04010538f790c3b690598848ff1c7dea17d2431681b0ff46017fed7a2ed
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4357 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 4358 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_package: Succeeded
NOTE: Running task 4359 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata)
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 4360 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 4472517fe6ea751a2e2c22ccb624a4711c6f9b575ae728e7bf5fcec25de0e18e
NOTE: Setscene tasks completed
NOTE: Running task 4361 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: Running task 4362 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_ipk)
NOTE: Running task 4363 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_deb)
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: Running task 4364 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_rpm: Started
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata unihash changed to 9ea528ec85a91fbf0b8ce5c75d3a434798ba2623e50e1c4c5fabf2b56fc13f9d
NOTE: Setscene tasks completed
NOTE: Running task 4365 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_create_spdx)
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_compile: Succeeded
NOTE: Running task 4366 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_compile_ptest_base)
NOTE: Running task 4367 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 4368 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4369 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4370 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 4371 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4372 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_install: Succeeded
NOTE: Running task 4373 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package: Succeeded
NOTE: Running task 4374 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4375 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_populate_sysroot)
NOTE: Running task 4376 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_rpm unihash changed to 76c4fc773110143ffc24002d1e0214ccbff054ed73ba9259213a959955db71cc
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata unihash changed to 30b836d005b24d3a8913261763c5bfdb888ef3710fd0383c234abc3a555b9022
NOTE: Setscene tasks completed
NOTE: Running task 4377 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Running task 4378 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4379 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot)
NOTE: Running task 4380 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 4381 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_ipk unihash changed to 5c02547fce51d33023bf0cdf669edaf0207b401b308f6ef43451c0a01fcf288e
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata unihash changed to bfef6bea1cfec861c97d9beb3286facc1d6ddea3e2f9695efb7e3f9718ead1b3
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4382 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: Running task 4383 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4384 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 4385 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_compile)
NOTE: recipe enchant2-2.8.1-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4386 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe enchant2-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 4387 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_install)
NOTE: recipe enchant2-2.8.1-r0: task do_install: Started
NOTE: recipe enchant2-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 4388 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 4389 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_package)
NOTE: recipe enchant2-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.1-r0: task do_package: Started
NOTE: recipe enchant2-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_package: Succeeded
NOTE: Running task 4390 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Succeeded
NOTE: Running task 4391 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 4392 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_packagedata unihash changed to 934e0b315c9a87cd693bcf42b4aacaf97b2aa4d0b97cc346a406cbcc6489d359
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 4393 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 4394 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_packagedata)
NOTE: recipe enchant2-2.8.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 4395 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_packagedata unihash changed to 4456f2c4d06eafe206c87d2c2ce14237e6d9db9bfa66f9e71b7ad54d5e93d001
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata unihash changed to ceb7ced08e2b42a028b5bc294530817263d6f2d33230709bc9a651dc80cadd15
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_deb unihash changed to 13a032a9c221dac22078a841d0e47dd0504ecfacf6e1deed8bfc006b69618f63
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 4396 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx)
NOTE: Running task 4397 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: Running task 4398 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe enchant2-2.8.1-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 4399 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 4400 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to 670c922ebe45f409c0a097bd054da40c99b226a11a964d3e0efca3247b625029
NOTE: Setscene tasks completed
NOTE: Running task 4401 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Running task 4402 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_install)
NOTE: recipe vala-0.56.17-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_rpm unihash changed to d36b8f1fac6fcf7a64645ff1dee08d6b54208c6891999c553cd839797a5b6270
NOTE: recipe vala-0.56.17-r0: task do_install: Succeeded
NOTE: Running task 4403 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot)
NOTE: Running task 4404 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package)
NOTE: recipe vala-0.56.17-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4405 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4406 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4407 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4408 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4409 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4410 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_configure)
NOTE: Running task 4411 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_configure)
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4412 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_configure)
NOTE: recipe libical-3.0.18-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Started
NOTE: recipe appstream-1.0.3-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Succeeded
NOTE: Running task 4413 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata unihash changed to 5220851cb21c2510260f690916d938e96bcc18f3ce8715374bb14345d7f6c5ec
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4414 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: Running task 4415 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe appstream-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4416 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 4417 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.3-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 4418 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_collect_spdx_deps)
NOTE: Running task 4419 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: Running task 4420 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 4421 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4422 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_compile)
NOTE: recipe libical-3.0.18-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Succeeded
NOTE: Running task 4423 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_install)
NOTE: recipe libsecret-0.21.4-r0: task do_install: Started
NOTE: recipe libsecret-0.21.4-r0: task do_install: Succeeded
NOTE: Running task 4424 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_populate_sysroot)
NOTE: Running task 4425 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_package)
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_package: Started
NOTE: recipe appstream-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4426 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_install)
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_install: Started
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 4427 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: recipe appstream-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 4428 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_populate_sysroot)
NOTE: Running task 4429 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_package)
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Started
NOTE: Running task 4430 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 4431 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: recipe appstream-1.0.3-r0: task do_package: Started
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_compile: Succeeded
NOTE: Running task 4432 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_install)
NOTE: recipe libical-3.0.18-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_install: Succeeded
NOTE: Running task 4433 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot)
NOTE: Running task 4434 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Started
NOTE: recipe libsecret-0.21.4-r0: task do_package: Succeeded
NOTE: Running task 4435 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata)
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4436 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.72-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata unihash changed to 581a849ccffcfd9a98cea642ead9ff5c4debcc3fcdd21b25b65e734877d3a465
NOTE: recipe bluez5-5.72-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4437 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_configure)
NOTE: Running task 4438 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_create_spdx)
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.72-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 4439 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata)
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Succeeded
NOTE: Running task 4440 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata)
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata unihash changed to 2ec28dc81210c3f6fb825966abca7629767708c04284d907ba9c30f796feb06d
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata unihash changed to 123e367b356e986ec559940ff21236eebcc25cd0db122026b5cbbc3441e79424
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4441 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: Running task 4442 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_create_spdx)
NOTE: Running task 4443 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 4444 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata unihash changed to d8041488b69229194c56d86e956954157a9d6ac52fae1478802d74ab02867e99
NOTE: recipe bluez5-5.72-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 4445 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.72-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4446 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.72-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.72-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4447 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_compile)
NOTE: recipe bluez5-5.72-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 4448 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_install)
NOTE: recipe harfbuzz-8.5.0-r0: task do_install: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 4449 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_populate_sysroot)
NOTE: Running task 4450 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_package)
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_package: Started
NOTE: recipe bluez5-5.72-r0: task do_compile: Succeeded
NOTE: Running task 4451 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_compile_ptest_base)
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_compile_ptest_base: Started
NOTE: Running task 4452 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.52.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.52.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4453 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_configure)
NOTE: recipe pango-1.52.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 4454 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata unihash changed to 5ed35a1fdd9068ca15fba9ba5718ea118c6fbc104a1f7c804b7650104ac5a202
NOTE: Setscene tasks completed
NOTE: Running task 4455 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.5.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.52.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4456 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_configure_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4457 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_compile)
NOTE: recipe pango-1.52.2-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4458 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.52.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.52.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_compile: Succeeded
NOTE: Running task 4459 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_compile_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4460 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_install)
NOTE: recipe pango-1.52.2-r0: task do_install: Started
NOTE: recipe bluez5-5.72-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4461 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_install)
NOTE: recipe bluez5-5.72-r0: task do_install: Started
NOTE: recipe pango-1.52.2-r0: task do_install: Succeeded
NOTE: Running task 4462 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_install_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.72-r0: task do_install: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4463 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_install_ptest_base)
NOTE: Running task 4464 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_populate_sysroot)
NOTE: Running task 4465 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_package)
NOTE: recipe bluez5-5.72-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.52.2-r0: task do_package: Started
NOTE: recipe bluez5-5.72-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4466 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot)
NOTE: Running task 4467 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_package)
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.72-r0: task do_package: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4468 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.57.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.57.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4469 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.57.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.57.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 4470 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_configure)
NOTE: recipe librsvg-2.57.3-r0: task do_configure: Started
NOTE: recipe pango-1.52.2-r0: task do_package: Succeeded
NOTE: Running task 4471 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata)
NOTE: recipe pango-1.52.2-r0: task do_packagedata: Started
NOTE: recipe pango-1.52.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata unihash changed to 3555b1b338fe85316d363080c082896355eacfbefa40cc3b8ea794c2b9985900
NOTE: Setscene tasks completed
NOTE: Running task 4472 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_create_spdx)
NOTE: recipe pango-1.52.2-r0: task do_create_spdx: Started
NOTE: recipe pango-1.52.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4473 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.57.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.57.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_package: Succeeded
NOTE: Running task 4474 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_packagedata)
NOTE: recipe bluez5-5.72-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.72-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_packagedata unihash changed to 4fe82dd9519f34e6b509909d52bac1a91dee1c31c7f9a783ca74fba030c8e31a
NOTE: Setscene tasks completed
NOTE: Running task 4475 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_create_spdx)
NOTE: recipe bluez5-5.72-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Running task 4476 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Started
NOTE: recipe bluez5-5.72-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Succeeded
NOTE: Running task 4477 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot)
NOTE: Running task 4478 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_package)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Started
NOTE: recipe librsvg-2.57.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4479 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_compile)
NOTE: recipe librsvg-2.57.3-r0: task do_compile: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4480 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4481 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4482 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4483 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4484 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4485 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 4486 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_compile)
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 4487 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_install)
NOTE: recipe libwpe-1.16.0-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 4488 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 4489 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: Running task 4490 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_populate_sysroot)
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4491 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 4492 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4493 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4494 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Succeeded
NOTE: Running task 4495 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 4496 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: Running task 4497 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx)
NOTE: Running task 4498 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 4499 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata)
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 4500 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata unihash changed to 814525c1c9875846d879846a1207cd0de75eec78760ff499ef5527e7be136b7c
NOTE: Setscene tasks completed
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 4501 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 9070ba335f30cd1c5e023819d7b2ca5c2780f260087621d438c42d67ec5ce83d
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4502 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 4503 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 4504 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4505 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4506 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4507 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4508 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 4509 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.42-r0: task do_configure: Started
NOTE: Running task 4510 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 4511 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 4512 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4513 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4514 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to bb6ede44dd5a20d0630baee643032f0db5244bbc333678ff48f7cc469e1a370a
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 4515 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4516 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4517 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_collect_spdx_deps)
NOTE: Running task 4518 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4519 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_compile)
NOTE: recipe gtk+3-3.24.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 4520 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 4521 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 4522 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_package)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4523 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_compile)
NOTE: recipe gtk+3-3.24.42-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 4524 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata unihash changed to 1ce377009c4cc111da149cc3a07f4b03b037034352742e34119db98fedbda469
NOTE: Setscene tasks completed
NOTE: Running task 4525 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_create_spdx)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_compile: Succeeded
NOTE: Running task 4526 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_install: Succeeded
NOTE: Running task 4527 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_populate_sysroot)
NOTE: Running task 4528 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_package: Succeeded
NOTE: Running task 4529 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_packagedata unihash changed to dc2109f084ec2c75aa0f32cfede7f5da3ae11c49eb5a0109517effc606cd81a0
NOTE: Setscene tasks completed
NOTE: Running task 4530 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_compile: Succeeded
NOTE: Running task 4531 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_install)
NOTE: recipe gtk+3-3.24.42-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_install: Succeeded
NOTE: Running task 4532 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_populate_sysroot)
NOTE: Running task 4533 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_package)
NOTE: recipe gtk+3-3.24.42-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4534 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4535 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4540 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_configure)
NOTE: Running task 4541 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4542 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_compile)
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 4543 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_package: Succeeded
NOTE: Running task 4544 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.42-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_packagedata unihash changed to 3c3dadad1aee2cb0fb27e756094188661f50b18a2c5e244517165456e992dca4
NOTE: Setscene tasks completed
NOTE: Running task 4545 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.42-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4551 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_install)
NOTE: recipe libhandy-1.8.3-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 4552 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_collect_spdx_deps)
NOTE: Running task 4553 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 4556 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_package)
NOTE: Running task 4557 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot)
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_package: Started
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4558 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 4559 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: Running task 4560 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 4561 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata)
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata unihash changed to e15c07912fee4e7cca6049784824f589eff3d7f80c9e75c801e3b6d073a86407
NOTE: Setscene tasks completed
NOTE: Running task 4562 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_create_spdx)
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 4563 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata unihash changed to 4d786e3e35c3a63891df7d8653c4d6385ef4fc89cc688a86f06c54c1a8b0c691
NOTE: Setscene tasks completed
NOTE: Running task 4564 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_create_spdx)
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.57.3-r0: task do_compile: Succeeded
NOTE: Running task 4565 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_install)
NOTE: recipe librsvg-2.57.3-r0: task do_install: Started
NOTE: recipe librsvg-2.57.3-r0: task do_install: Succeeded
NOTE: Running task 4566 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_populate_sysroot)
NOTE: Running task 4567 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_package)
NOTE: recipe librsvg-2.57.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.57.3-r0: task do_package: Started
NOTE: recipe librsvg-2.57.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4568 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4569 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.57.3-r0: task do_package: Succeeded
NOTE: Running task 4570 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_packagedata)
NOTE: recipe librsvg-2.57.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.57.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_packagedata unihash changed to b90502e6330af0a2d0d7aed451d758b82512876be8d14bc24c0d5f8917e48b00
NOTE: Setscene tasks completed
NOTE: Running task 4571 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.57.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.57.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4572 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4573 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_compile: Succeeded
NOTE: Running task 4574 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_install: Succeeded
NOTE: Running task 4575 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_populate_sysroot)
NOTE: Running task 4576 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4577 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4578 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_configure)
NOTE: recipe gtk4-4.14.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.14.4-r0: task do_configure: Succeeded
NOTE: Running task 4579 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_compile)
NOTE: recipe gtk4-4.14.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_package: Succeeded
NOTE: Running task 4580 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_packagedata unihash changed to c13a9108f6fdb758cf149344846902f9da905b46f2b370938bb3f46713ffb97d
NOTE: Setscene tasks completed
NOTE: Running task 4581 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4582 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.14.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.14.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4583 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_install)
NOTE: recipe gtk4-4.14.4-r0: task do_install: Started
NOTE: recipe gtk4-4.14.4-r0: task do_install: Succeeded
NOTE: Running task 4584 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_populate_sysroot)
NOTE: Running task 4585 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_package)
NOTE: recipe gtk4-4.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.14.4-r0: task do_package: Started
NOTE: recipe gtk4-4.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4586 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4587 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4588 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4589 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libadwaita-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-4.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4590 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_configure)
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4591 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_configure)
NOTE: recipe webkitgtk-2.44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4592 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_configure)
NOTE: recipe libadwaita-1.5.1-r0: task do_configure: Started
NOTE: recipe libportal-0.7.1-r0: task do_configure: Started
NOTE: recipe gcr-4.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4593 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_configure)
NOTE: recipe webkitgtk-2.44.1-r0: task do_configure: Started
NOTE: recipe gcr-4.3.0-r0: task do_configure: Started
NOTE: recipe libportal-0.7.1-r0: task do_configure: Succeeded
NOTE: Running task 4594 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_compile)
NOTE: recipe libportal-0.7.1-r0: task do_compile: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 4595 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_compile)
NOTE: recipe gcr-4.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4596 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_compile)
NOTE: recipe libadwaita-1.5.1-r0: task do_compile: Started
NOTE: recipe gcr-4.3.0-r0: task do_compile: Started
NOTE: recipe gcr-4.3.0-r0: task do_compile: Succeeded
NOTE: Running task 4597 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_install)
NOTE: recipe gtk4-4.14.4-r0: task do_package: Succeeded
NOTE: Running task 4598 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_packagedata)
NOTE: recipe gcr-4.3.0-r0: task do_install: Started
NOTE: recipe gtk4-4.14.4-r0: task do_packagedata: Started
NOTE: recipe libportal-0.7.1-r0: task do_compile: Succeeded
NOTE: Running task 4599 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_install)
NOTE: recipe libportal-0.7.1-r0: task do_install: Started
NOTE: recipe gtk4-4.14.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_packagedata unihash changed to 27354b5965ec9413cc172adbf594495566a1df369e5405c6071215429d31fe5d
NOTE: Setscene tasks completed
NOTE: Running task 4600 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_create_spdx)
NOTE: recipe gcr-4.3.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4601 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_package)
NOTE: recipe gtk4-4.14.4-r0: task do_create_spdx: Started
NOTE: Running task 4602 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_populate_sysroot)
NOTE: recipe gcr-4.3.0-r0: task do_package: Started
NOTE: recipe gcr-4.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4603 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_package)
NOTE: Running task 4604 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot)
NOTE: recipe libportal-0.7.1-r0: task do_package: Started
NOTE: recipe libportal-0.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-4.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4605 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_collect_spdx_deps)
NOTE: Running task 4606 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_collect_spdx_deps)
NOTE: Running task 4607 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.5.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4608 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcr-4.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_package: Succeeded
NOTE: Running task 4609 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_packagedata)
NOTE: recipe webkitgtk-2.44.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4610 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_install)
NOTE: recipe libportal-0.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_packagedata unihash changed to d5dfa7caf50e1e22d2b835f228fbadbad5e63503aeb24fcc8090e0ac2017ebeb
NOTE: recipe libadwaita-1.5.1-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 4611 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_create_spdx)
NOTE: recipe libportal-0.7.1-r0: task do_create_spdx: Started
NOTE: recipe libportal-0.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_install: Succeeded
NOTE: Running task 4612 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_package)
NOTE: Running task 4613 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_populate_sysroot)
NOTE: recipe libadwaita-1.5.1-r0: task do_package: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_package: Succeeded
NOTE: Running task 4614 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_packagedata)
NOTE: recipe gcr-4.3.0-r0: task do_packagedata: Started
NOTE: recipe gcr-4.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_packagedata unihash changed to 05e6f7171e07389369771eaf688c0b52c7f3e7943a6b3547641677b6694214d4
NOTE: Setscene tasks completed
NOTE: Running task 4615 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_create_spdx)
NOTE: recipe gcr-4.3.0-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 4616 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_packagedata)
NOTE: recipe libadwaita-1.5.1-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_packagedata unihash changed to 59319190b7bdcec3d1e0364c29709ae3d864344e0e74a3e476b47b00923ddd4c
NOTE: Setscene tasks completed
NOTE: Running task 4617 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_create_spdx)
NOTE: recipe libadwaita-1.5.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4618 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile)
NOTE: recipe webkitgtk-2.44.1-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile
NOTE: recipe webkitgtk-2.44.1-r0: task do_compile: Succeeded
NOTE: Running task 4619 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_install)
NOTE: recipe webkitgtk-2.44.1-r0: task do_install: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_install: Succeeded
NOTE: Running task 4620 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_package)
NOTE: Running task 4621 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.44.1-r0: task do_package: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4622 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4623 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_configure)
NOTE: recipe epiphany-46.2-r0: task do_configure: Started
NOTE: recipe epiphany-46.2-r0: task do_configure: Succeeded
NOTE: Running task 4624 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_compile)
NOTE: recipe epiphany-46.2-r0: task do_compile: Started
NOTE: recipe epiphany-46.2-r0: task do_compile: Succeeded
NOTE: Running task 4625 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_install)
NOTE: recipe epiphany-46.2-r0: task do_install: Started
NOTE: recipe epiphany-46.2-r0: task do_install: Succeeded
NOTE: Running task 4626 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_populate_sysroot)
NOTE: recipe epiphany-46.2-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-46.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_package: Succeeded
NOTE: Running task 4627 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_packagedata)
NOTE: recipe webkitgtk-2.44.1-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_packagedata unihash changed to 905d211633f6e27d0d7effd060dc0b9e160995a586d05717eb55e356be30dbde
NOTE: Setscene tasks completed
NOTE: Running task 4628 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package)
NOTE: Running task 4629 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_create_spdx)
NOTE: recipe epiphany-46.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_create_spdx: Started
NOTE: recipe epiphany-46.2-r0: task do_package: Succeeded
NOTE: Running task 4630 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_packagedata)
NOTE: recipe epiphany-46.2-r0: task do_packagedata: Started
NOTE: recipe epiphany-46.2-r0: task do_packagedata: Succeeded
NOTE: Running task 4631 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package_write_ipk)
NOTE: Running task 4632 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package_write_deb)
NOTE: Running task 4633 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package_write_rpm)
NOTE: Running task 4634 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package_qa)
NOTE: recipe epiphany-46.2-r0: task do_package_write_ipk: Started
NOTE: recipe epiphany-46.2-r0: task do_package_write_deb: Started
NOTE: recipe epiphany-46.2-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-46.2-r0: task do_package_qa: Started
NOTE: recipe epiphany-46.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_package_qa: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4635 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-46.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-46.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4636 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_create_spdx)
NOTE: recipe epiphany-46.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_create_spdx: Started
NOTE: recipe epiphany-46.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4637 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_create_runtime_spdx)
NOTE: recipe epiphany-46.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe epiphany-46.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 4638 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_build)
NOTE: Tasks Summary: Attempted 4638 tasks of which 4090 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 40 ERROR messages, returning a non-zero exit code.
ERROR: python3-dbusmock-0.31.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-src went backwards which would break package feeds (from 0:0.32.1-r0 to 0:0.31.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.31.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-dbg went backwards which would break package feeds (from 0:0.32.1-r0 to 0:0.31.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.31.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-staticdev went backwards which would break package feeds (from 0:0.32.1-r0 to 0:0.31.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.31.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-dev went backwards which would break package feeds (from 0:0.32.1-r0 to 0:0.31.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.31.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-doc went backwards which would break package feeds (from 0:0.32.1-r0 to 0:0.31.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.31.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-locale went backwards which would break package feeds (from 0:0.32.1-r0 to 0:0.31.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.31.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock went backwards which would break package feeds (from 0:0.32.1-r0 to 0:0.31.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.31.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-ptest went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2863315880630405956==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-46.0-46.2.patch"

RnJvbSA0MTAwYjJhNDU3ZmVjYTFhZWZhMTAzNTUzNjg0MTk2YzYyODBmM2Q3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTQ6MjY6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0Ni4wIC0+IDQ2LjIKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80Ni4wLmJiID0+IGVwaXBoYW55XzQ2LjIuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L3tlcGlwaGFueV80Ni4wLmJiID0+IGVwaXBoYW55XzQ2LjIuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYuMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjIu
YmIKaW5kZXggOTA1MmZlMTcwYi4uMDEzODJkMGUyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2VwaXBoYW55XzQ2LjIuYmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICIk
e0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9
IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiZjQzNDhmMmNmNTFjMDdjMGMxMDZkMTMwMTcyZDRkMjNmMmNkNDA2
ODc3MWUxZGUwMDdiNzU4Y2EyYWRlNTY2MCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
ImZiOTMyZGE3YTI0ZTg3ZjFlZGI5MDBiNWI5NDI1MWI0MmIzNzA4MDc1Mzg2NDY1MWMwNTlkYzZj
OTNjYjUwNDkiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1Z2dpbmcKIFBBQ0tBR0VD
T05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9dHJ1ZSwtRGRldmVsb3Bl
cl9tb2RlPWZhbHNlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2Zp
bGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQt
ZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKaW5kZXggZTUwNTQ2Njc2NC4uMWEwZjNkZDRj
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVs
cC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZDQ1Yzc1ZmU2OTFl
Mjc1ZDdhN2Q3ZTY0MWFjNjZiMTUzMzY5YTFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAzODkxZmMzNmYwNGY0OGI2MjdhYWI1YTM4NDhmMTFiNzExNGQzNWQ4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDMxIEphbiAyMDE4IDE1OjUwOjM4ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGhlbHAvbWVzb24uYnVpbGQ6IGRpc2FibGUgdGhlIHVzZSBvZiB5ZWxwCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKaW5kZXgg
YTI4MDBlYjYyZC4uOWNjYWQ0YzZhNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzI5
N2Y1Yjg5ZDdjOGU5OGFjOThlMWQ5YTc1MDZkZjZkYjZmYzAyNSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZGVkZmNhYmMwNGVhODkzNGUxYTkyMGExNjE1MTA1YmMxZWE0NzRjMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogRnJpLCAyNiBGZWIgMjAyMSAxMDoxNzo1MiAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBlbmNvZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMv
b3MtcmVsZWFzZSBpbnRvIHRoZQpAQCAtMTEsNyArMTEsNyBAQCBSUCAyMDIxLzIvMjYKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIv
bWVzb24uYnVpbGQKLWluZGV4IGU0MTZjYzcuLmVlNWY3YjEgMTAwNjQ0CitpbmRleCBlYzY1OGUw
Li5kNTRhZTNhIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBA
QCAtMTUsNiArMTUsNyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKaW5kZXggMWI0NDA0YzhjYS4u
N2NhYzUwMzgzNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVz
L21pZ3JhdG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjM4YTRjZWFlZWMwNWVmYjFiODIy
ZDUyYzQzNTkwZTdmZDUxODExMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTE3YTk2
OTEwMWFmNmU0YWYyNmU0ODUxZjVhMTIzN2E5Y2JhY2ZhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPgogRGF0ZTogVGh1LCAyNSBGZWIgMjAyMSAxNDo1MjozMiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBlcGlwaGFueTogRml4IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZQotLSAKMi40NC4wCgo=

--===============2863315880630405956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 5546968 to 5559552 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGSIZE changed from 88440 to 88598 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 88111 to 88263 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 88383 to 89102 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 122124 to 120333 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 81039 to 81183 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGSIZE changed from 104308 to 104481 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 88128 to 87060 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGSIZE changed from 86566 to 86717 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGSIZE changed from 90634 to 90795 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 68478 to 129737 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGSIZE changed from 89181 to 89343 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 135909 to 136127 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGSIZE changed from 85911 to 86066 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGSIZE changed from 70801 to 76497 (+8%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGSIZE changed from 79725 to 98935 (+24%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 87371 to 87539 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGSIZE changed from 88540 to 87740 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 87939 to 87219 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 112297 to 112434 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGSIZE changed from 85030 to 85168 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGSIZE changed from 76679 to 86421 (+13%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGSIZE changed from 112171 to 111273 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGSIZE changed from 84664 to 84805 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 85733 to 85729 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGSIZE changed from 109665 to 109813 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGSIZE changed from 79434 to 79576 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4443502 to 4449019 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2053420 to 2056052 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/46/epiphany-46.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/46/epiphany-46.2.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-kab"
packages/core2-64-poky-linux/epiphany: PV changed from "46.0" to "46.2"

--===============2863315880630405956==--

