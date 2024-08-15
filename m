Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A179AC5473B
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.131093.1723748333871835531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WZRQT0c9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UC5vr50V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019157683cff-55dfe9ca-e18b-4c5c-8cdd-66289d622011-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B6cnb5Fmvrm5xQeiLnFlCtzOyWjzj4BwnuDd9BCiFas=;
	b=WZRQT0c9Mnn6jvgGji8qcJ+nmf1vC6XIH5fRFdXz4qD7JsWVRAeq5DHpwx1o9zTP
	uq2BuxqeS0K1iB6/OMJL+7WOobkGFHR3VcC2btKbx85ENRDMHPt319p+CWDvTE0Ks1L
	FJ8EA5v+DrItVfPbyYFmz6ElP5cjvfmBsb+pWjWI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B6cnb5Fmvrm5xQeiLnFlCtzOyWjzj4BwnuDd9BCiFas=;
	b=UC5vr50VH58/MYhNHPFcEeXn+acVxA7HktP+kOG46hA4zb8/jZ7GWS6dPtM+ierS
	rpLE/PhmKWeAFTYlBT8w5p/XKuHAASXia+aPoA2y7jAEPWX2tFwITfA51d9PNOl4efC
	ags+AK7i2rDQQqMft1ixPU4ZvlPT7XsQOtelEBrg=
Content-Type: multipart/mixed; boundary="===============3552050686154818155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 46.3 SUCCEEDED
Message-ID: <0101019157683cff-55dfe9ca-e18b-4c5c-8cdd-66289d622011-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203421

--===============3552050686154818155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *46.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-46.0-46.3.patch
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
From c8813e2ab196d847875cc45268a04764b9af97fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 14:46:17 +0000
Subject: [PATCH] epiphany: upgrade 46.0 -> 46.3

---
 .../epiphany/{epiphany_46.0.bb => epiphany_46.3.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_46.0.bb => epiphany_46.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_46.0.bb b/meta/recipes-gnome/epiphany/epiphany_46.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_46.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_46.3.bb
index 9052fe170b..d9ad38d693 100644
--- a/meta/recipes-gnome/epiphany/epiphany_46.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_46.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "f4348f2cf51c07c0c106d130172d4d23f2cd4068771e1de007b758ca2ade5660"
+SRC_URI[archive.sha256sum] = "a9e1ad206449117fc5ebe4d0177c1d7a2ff503d6b55019072a068ff2ab278656"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index e505466764..e129d503e8 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From bd45c75fe691e275d7a7d7e641ac66b153369a1c Mon Sep 17 00:00:00 2001
+From 4ec86871f8c2a854aec9e6955566fa437fd5f09a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index a2800eb62d..ba674e4aad 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From c297f5b89d7c8e98ac98e1d9a7506df6db6fc025 Mon Sep 17 00:00:00 2001
+From 641c9d5fc0d9f16151a20a5df2f0b4059d1130a1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index e416cc7..ee5f7b1 100644
+index 2691828..c466af6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 1b4404c8ca..53837f448b 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From b38a4ceaeec05efb1b822d52c43590e7fd518113 Mon Sep 17 00:00:00 2001
+From 2fcc2b3c3751b2fb63474ca78b24e4b6375d62a9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.44.0


--===============3552050686154818155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-2828ff626c95a71765acc90f4360101e88eb0689"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2828ff626c95a71765acc90f4360101e88eb0689"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1214 Local 1098 Mirrors 0 Missed 116 Current 473 (90% match, 93% complete)
Removing 5 stale sstate objects for arch allarch...done.
Removing 9 stale sstate objects for arch x86_64...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 478 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 508 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 517 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 527 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 546 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 548 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gi-docgen-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 554 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 562 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 563 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 565 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 567 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 571 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_create_spdx_setscene)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 583 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_create_spdx_setscene)
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 587 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 589 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.77-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 627 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 633 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 635 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gi-docgen-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 659 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.14.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 675 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 676 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 677 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 678 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 681 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 690 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.77.2.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 693 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 696 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.77.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gi-docgen-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.77.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 717 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.77.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 729 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.77.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 741 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 743 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 745 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 763 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 771 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 778 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.77.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.77.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 783 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 784 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 785 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 790 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 792 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 794 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.77.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 797 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 800 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.77.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 802 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 816 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 819 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 826 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 828 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 832 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 834 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 837 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 838 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 839 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 841 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 842 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 846 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 852 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 855 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 878 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 879 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 880 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 886 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 889 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 894 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 901 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 911 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 914 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 916 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 918 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 920 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 926 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 928 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 940 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 942 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 948 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 949 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 958 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 960 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 965 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 967 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe curl-8.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 968 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe enchant2-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 971 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 973 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 978 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 979 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 983 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 986 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 988 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 989 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe enchant2-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 993 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 996 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 997 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 999 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1000 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1001 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1002 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe enchant2-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1005 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1006 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1008 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1010 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1011 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1013 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1017 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1019 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1021 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1023 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1028 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1030 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1032 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1034 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1035 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1040 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1042 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1049 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1050 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1051 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1054 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1057 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1058 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1063 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1065 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1067 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1070 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1073 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1075 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1080 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1081 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1084 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1087 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1088 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1092 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1094 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1095 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1096 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1098 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1099 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1103 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1109 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1112 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1114 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1118 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1119 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1120 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1122 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1124 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1126 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1127 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1128 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1129 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1131 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1134 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1135 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1136 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1141 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1142 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1144 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1145 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1149 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1150 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1153 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1155 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1157 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1158 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1161 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1163 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1164 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1170 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1171 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1172 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1175 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1176 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1177 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1179 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1182 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1184 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1186 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1187 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1189 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1191 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1192 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1194 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1195 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1198 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1199 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1201 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1202 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1206 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1208 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1209 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1210 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1212 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1213 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1215 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1216 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1218 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1220 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1221 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1226 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1231 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1232 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1233 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1235 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1237 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1238 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1241 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1242 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1267 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1349 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1369 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1422 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1449 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1450 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1453 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1454 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1455 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1456 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1458 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1459 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1461 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1463 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1464 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1465 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1466 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1468 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1474 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1479 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1483 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1489 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1496 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1499 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1500 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1501 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1504 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1505 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 870 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1061 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1507 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1508 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1512 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 1156 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1363 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1505 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_fetch)
NOTE: Running task 1546 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_fetch)
NOTE: Running task 1570 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1591 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1624 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1626 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_fetch)
NOTE: Running task 1642 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: Running task 1647 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_write_config)
NOTE: Running task 1651 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_fetch)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_fetch: Started
NOTE: Running task 1670 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_fetch)
NOTE: Running task 1675 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_write_config)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_fetch: Succeeded
NOTE: Running task 1687 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_fetch)
NOTE: Running task 1693 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_unpack)
NOTE: Running task 1695 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_write_config)
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_fetch: Started
NOTE: Running task 1724 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1725 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_fetch: Succeeded
NOTE: Running task 1726 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1727 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_fetch: Succeeded
NOTE: Running task 1728 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Started
NOTE: Running task 1729 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_unpack)
NOTE: recipe gtk4-4.14.4-r0: task do_fetch: Started
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Started
NOTE: Running task 1730 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_unpack: Started
NOTE: recipe gtk4-4.14.4-r0: task do_fetch: Succeeded
NOTE: Running task 1731 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_write_config: Started
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1732 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_unpack)
NOTE: Running task 1733 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_setscene: Started
NOTE: Running task 1743 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_write_config)
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_write_config: Succeeded
NOTE: Running task 1746 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: Running task 1747 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_unpack)
NOTE: Running task 1751 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_unpack: Started
NOTE: Running task 1778 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_write_config)
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: recipe gtk4-4.14.4-r0: task do_unpack: Started
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 1806 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_fetch)
NOTE: Running task 1807 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: Running task 1808 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_write_config: Started
NOTE: Running task 1809 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1810 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 1811 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_patch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Started
NOTE: Running task 1812 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_patch)
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Succeeded
NOTE: Running task 1814 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1815 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_fetch)
NOTE: recipe gtk4-4.14.4-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_patch: Succeeded
NOTE: Running task 1816 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: Running task 1818 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Started
NOTE: Running task 1819 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.1-r0: task do_fetch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Started
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1848 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_fetch)
NOTE: Running task 1850 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_generate_toolchain_file)
NOTE: recipe enchant2-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1854 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_fetch)
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Started
NOTE: Running task 1864 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1865 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 1867 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: Running task 1870 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 1871 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_unpack)
NOTE: Running task 1872 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1873 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_unpack)
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Started
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1902 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: Running task 1903 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb:do_fetch)
NOTE: recipe enchant2-2.8.1-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: Running task 1905 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_fetch)
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Succeeded
NOTE: Running task 1906 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_patch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Started
NOTE: Running task 1907 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_fetch)
NOTE: recipe enchant2-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: recipe libadwaita-1.5.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: Running task 1910 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_patch)
NOTE: recipe libadwaita-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Started
NOTE: Running task 1912 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: Running task 1913 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: Running task 1914 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Succeeded
NOTE: Running task 1915 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1916 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_patch)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.1-r0: task do_patch: Started
NOTE: Running task 1927 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Started
NOTE: Running task 1928 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: Running task 1929 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_unpack)
NOTE: recipe enchant2-2.8.1-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: Running task 1962 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb:do_unpack)
NOTE: Running task 1964 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_unpack)
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 1965 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Succeeded
NOTE: Running task 1966 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Succeeded
NOTE: Running task 1994 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_write_config)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1996 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: Running task 1997 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: Running task 1998 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_unpack: Started
NOTE: Running task 2000 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_write_config)
NOTE: recipe appstream-1.0.3-r0: task do_patch: Started
NOTE: recipe libadwaita-1.5.2-r0: task do_unpack: Started
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_patch: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Started
NOTE: Running task 2007 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.3.bb:do_recipe_qa)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Started
NOTE: Running task 2014 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_unpack: Succeeded
NOTE: Running task 2015 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: Running task 2055 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb:do_write_config)
NOTE: Running task 2056 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_write_config)
NOTE: Running task 2057 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-46.3-r0: task do_recipe_qa: Started
NOTE: Running task 2058 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_patch)
NOTE: recipe appstream-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_write_config)
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_write_config: Started
NOTE: Running task 2061 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.5.2-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Started
NOTE: Running task 2062 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe gcr-4.3.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_patch: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.5.2-r0: task do_write_config: Succeeded
NOTE: Running task 2093 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.3.bb:do_write_config)
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Started
NOTE: Running task 2112 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2175 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 2176 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_patch)
NOTE: recipe epiphany-46.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe epiphany-46.3-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: Running task 2177 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.3.bb:do_fetch)
NOTE: recipe libadwaita-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 2179 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.2.bb:do_patch)
NOTE: recipe epiphany-46.3-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe libportal-0.7.1-r0: task do_patch: Started
NOTE: recipe epiphany-46.3-r0: task do_fetch: Started
NOTE: recipe epiphany-46.3-r0: task do_fetch: Succeeded
NOTE: Running task 2180 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.3.bb:do_unpack)
NOTE: recipe libadwaita-1.5.2-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2181 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe epiphany-46.3-r0: task do_unpack: Started
NOTE: recipe gtk4-4.14.4-r0: task do_unpack: Succeeded
NOTE: Running task 2185 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_patch)
NOTE: recipe gtk4-4.14.4-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2186 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe epiphany-46.3-r0: task do_unpack: Succeeded
NOTE: Running task 2187 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.3.bb:do_patch)
NOTE: recipe gtk4-4.14.4-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe epiphany-46.3-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-46.3-r0: task do_patch: Succeeded
NOTE: Running task 2190 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2191 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.3.bb:do_populate_lic)
NOTE: recipe epiphany-46.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-46.3-r0: task do_populate_lic: Started
NOTE: recipe epiphany-46.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.3.bb:do_populate_lic unihash changed to 49075074b374e1d5936fe40453a1937a38e0fc2387b103d9da38fafa71621319
NOTE: recipe epiphany-46.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Succeeded
NOTE: Running task 2192 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_patch)
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1520 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1521 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1522 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1523 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1524 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1525 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Succeeded
NOTE: Running task 2195 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_generate_toolchain_file)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1526 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1528 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1533 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1535 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1536 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/72.1.0/temp/log.do_packagedata_setscene.387298
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1537 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1539 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_package_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1542 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1543 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1544 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1545 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1546 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1547 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1548 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1552 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1554 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1556 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1557 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1559 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1561 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1562 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1563 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1566 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1568 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1569 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1570 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1571 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1572 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1573 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1574 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1575 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1576 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1577 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1579 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1580 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1581 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1582 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1583 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1584 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1586 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1588 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1589 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1592 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1593 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1595 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1596 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1597 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1600 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1602 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1603 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1605 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1608 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1610 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1613 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1614 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1615 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1616 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xz/5.4.6/temp/log.do_packagedata_setscene.459717
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1620 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1623 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_package_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1626 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1629 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1631 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1634 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1635 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1636 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1637 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1639 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1641 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1642 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1644 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1646 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1648 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1650 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1651 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1653 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1654 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1656 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1658 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1659 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1660 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1664 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1665 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1667 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1672 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1673 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1675 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1678 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1680 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1681 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1683 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1685 of 1687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_recipe_qa_setscene)
NOTE: Running task 2946 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 3394 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata)
NOTE: Running task 3423 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xz-5.4.6-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3836 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3858 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3890 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3925 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3957 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3990 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4032 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4033 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4034 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4035 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 4052 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4099 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata: Started
NOTE: Running task 4213 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_collect_spdx_deps)
NOTE: Running task 4224 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4225 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: Running task 4226 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4227 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 247db0620cdfc0d402fdf4ea01cca09079e69a6f4457d4e348a3dd1aaa699c91 to wss://hashserv.yoctoproject.org/ws ({'taskhash': '7480815ce32acecd6d7dc5e41650aef2b3dc33f9148d80d9b6152e915d247b74', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '247db0620cdfc0d402fdf4ea01cca09079e69a6f4457d4e348a3dd1aaa699c91'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 7480815ce32acecd6d7dc5e41650aef2b3dc33f9148d80d9b6152e915d247b74 -> 247db0620cdfc0d402fdf4ea01cca09079e69a6f4457d4e348a3dd1aaa699c91 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 4242 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4245 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_configure)
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4272 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Started
NOTE: Running task 4312 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_configure)
NOTE: Running task 4313 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Started
NOTE: Running task 4322 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_configure: Started
NOTE: Running task 4323 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: Running task 4328 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: Running task 4329 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4331 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: Running task 4332 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_configure)
NOTE: Running task 4333 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_configure: Started
NOTE: Running task 4335 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_configure: Started
NOTE: Running task 4336 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4337 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4338 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4339 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4340 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_configure)
NOTE: Running task 4341 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4342 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 4343 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 4344 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4352 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_collect_spdx_deps)
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 247db0620cdfc0d402fdf4ea01cca09079e69a6f4457d4e348a3dd1aaa699c91 to wss://hashserv.yoctoproject.org/ws ({'taskhash': '55ba15226193554ef13329b876b53c17de8d36a1781028300496abccc258664f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '247db0620cdfc0d402fdf4ea01cca09079e69a6f4457d4e348a3dd1aaa699c91'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 55ba15226193554ef13329b876b53c17de8d36a1781028300496abccc258664f -> 247db0620cdfc0d402fdf4ea01cca09079e69a6f4457d4e348a3dd1aaa699c91 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 4363 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 4368 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_install)
NOTE: recipe libwpe-1.16.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 4369 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_configure: Succeeded
NOTE: Running task 4370 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 4371 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 4372 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_package)
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4373 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_compile: Succeeded
NOTE: Running task 4374 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_install)
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4375 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Succeeded
NOTE: Running task 4376 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4377 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: Running task 4378 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Succeeded
NOTE: Running task 4379 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure_ptest_base)
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 4380 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4381 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Started
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4382 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4383 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_install: Succeeded
NOTE: Running task 4384 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_package)
NOTE: Running task 4385 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 4386 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot)
NOTE: Running task 4387 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 4388 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata unihash changed to ed1680a4583194a9274d0b507d5672f3e4721e3fbbf9ea5efacd4b1db934b8ac
NOTE: Setscene tasks completed
NOTE: Running task 4389 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_configure: Succeeded
NOTE: Running task 4390 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4391 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_collect_spdx_deps)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4392 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: Running task 4393 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to e2f1f438af25c72be1a8abfba6cb512f6c520a4d79870744a7ea737b9c4bf9da
NOTE: Setscene tasks completed
NOTE: Running task 4394 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 4395 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 4396 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 4397 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 4398 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 4399 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_package: Succeeded
NOTE: Running task 4400 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4401 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_compile)
NOTE: Running task 4402 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: Running task 4403 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_packagedata: Started
NOTE: Running task 4404 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 4405 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Succeeded
NOTE: Running task 4406 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile_ptest_base)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 4407 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 4408 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_package)
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Started
NOTE: Running task 4409 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4410 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4411 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_packagedata unihash changed to d3a2099906f1087efb263961dd9aafc5ea2e3a1af9fd7adc532348e29f04adbc
NOTE: recipe json-glib-1.8.0-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 4412 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_create_spdx)
NOTE: Running task 4413 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_package_write_ipk)
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Started
NOTE: Running task 4414 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_package_write_deb)
NOTE: Running task 4415 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 4416 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_package_write_ipk: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_package_write_deb: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_package_write_rpm: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4417 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Succeeded
NOTE: Running task 4418 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libsecret-0.21.4-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_install: Succeeded
NOTE: Running task 4419 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install_ptest_base)
NOTE: Running task 4420 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4421 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_populate_sysroot)
NOTE: Running task 4422 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_package)
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4423 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_package)
NOTE: Running task 4424 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_install: Succeeded
NOTE: Running task 4425 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_compile: Succeeded
NOTE: Running task 4426 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_install)
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 4427 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4428 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_package)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_install: Started
NOTE: Running task 4429 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4430 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_package_write_ipk unihash changed to 9d47fbaf267c331d8550f72d292e3a96f11bd8125537fe4e5462357d7116a3f0
NOTE: recipe libsecret-0.21.4-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_package_write_deb unihash changed to f02b5fd9f2e53474376142899a8008b5034ce1c3d2eb31551abbcd7e495f5101
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to 24d538408fe822e790de494a30f28314c37aebad15a56fb0dedb3255b33e70e3
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4431 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to f2622b60394e1814e188b29f3e3f5d9f967c25034ea942571d580b59b520354c
NOTE: Setscene tasks completed
NOTE: Running task 4432 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_ipk)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 4433 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: Running task 4434 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_deb)
NOTE: Running task 4435 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_rpm)
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4436 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_ipk: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_deb: Started
NOTE: Running task 4437 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe appstream-1.0.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_rpm: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata unihash changed to b86a32723d27772c2d5be3fd89759d0eccd361cb8ea55d3f156096bd71bb546b
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4438 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_populate_sysroot)
NOTE: Running task 4439 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_package)
NOTE: Running task 4440 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: Running task 4441 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to f9bc082d683b963f36694d2c71606c6d462665c718cc5a3b1806428138306955
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 4442 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Succeeded
NOTE: Running task 4443 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4444 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 4445 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 4446 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata unihash changed to 3300232b5713886384852dd4cffe930eee60bb9a1cacf35f721809a077e0e677
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-46.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_package_write_rpm unihash changed to 57815fb44ea311f9f0e0a6d8d14249a52121fd38b7c13018e47957b9511bdd1f
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 4447 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 4448 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4449 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure)
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Started
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_ipk unihash changed to b1f5524543872a4624d14b4bd6dedc8039eede89fdafe2f0259bf77f8164c5bf
NOTE: recipe appstream-1.0.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4450 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_compile)
NOTE: recipe appstream-1.0.3-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.4-r0: task do_package: Succeeded
NOTE: Running task 4451 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata)
NOTE: recipe json-glib-1.8.0-r0: task do_package: Succeeded
NOTE: Running task 4452 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata)
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 4453 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata unihash changed to 86b414b3c48918a4c35c57c346cdfce07f99afcfe43ad94a729180bc8fb52c0f
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata unihash changed to 9b8b65cb9c38f7657f77f75456227a39e0742521e9c820c0e8c816555865c9cf
NOTE: Setscene tasks completed
NOTE: Running task 4454 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_create_spdx)
NOTE: Running task 4455 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata unihash changed to 833762682e977c2d6ce52eb552b118f56dd434d6d05be26dc44590fcd3a043fa
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Started
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 4456 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 4457 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_compile)
NOTE: recipe enchant2-2.8.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package: Succeeded
NOTE: Running task 4458 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Succeeded
NOTE: Running task 4459 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_compile)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata unihash changed to 3567f76f52af5ec1daa6c174191cb1b56dd45fff4e2614b17757297a8ca4cdbb
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 4460 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 4461 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_install)
NOTE: recipe enchant2-2.8.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4462 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 4463 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 4464 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_package)
NOTE: recipe enchant2-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.1-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4465 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_install)
NOTE: recipe appstream-1.0.3-r0: task do_install: Started
NOTE: recipe enchant2-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_deb unihash changed to a203bb9f2cddb5b17be49d3ecd0a56e43e39925c85ab4d405a425d576797a8eb
NOTE: recipe appstream-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 4466 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_populate_sysroot)
NOTE: Running task 4467 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_package)
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.0.3-r0: task do_package: Started
NOTE: recipe enchant2-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 4468 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_packagedata)
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_packagedata unihash changed to f995672f13a000aae2eaabeeb99a48377c9bf383fb4be2d03a0b219c0039fc2f
NOTE: Setscene tasks completed
NOTE: Running task 4469 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_create_spdx)
NOTE: recipe enchant2-2.8.1-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 4470 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata)
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata unihash changed to b69d88746ba4bdb78db218ca6aa03b0260e2e22a44b44e430b328ebb44e737b7
NOTE: Setscene tasks completed
NOTE: Running task 4471 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_create_spdx)
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_compile: Succeeded
NOTE: Running task 4472 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_install: Started
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_rpm unihash changed to 6ad185434d49697211669c59676f02a067ce63f4ad76a5d9410b73243f7009cf
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_install: Succeeded
NOTE: Running task 4473 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_populate_sysroot)
NOTE: Running task 4474 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4475 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4476 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_package: Succeeded
NOTE: Running task 4477 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_configure: Succeeded
NOTE: Running task 4478 of 4580 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.5-r0: task do_packagedata: Failed
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 4478 tasks of which 4216 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815144409.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815144409.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_packagedata
Summary: There were 147 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:72.2.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:72.2.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:72.2.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:72.2.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:72.2.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:72.2.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:72.2.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:72.2.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
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
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-basedebug went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dsd went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.24.6-r0 to 0:1.24.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0-plugins-base/1.24.5/temp/log.do_packagedata.625330
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb:do_packagedata) failed with exit code '1'

--===============3552050686154818155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 68478 to 129737 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGSIZE changed from 79725 to 98935 (+24%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGSIZE changed from 76679 to 86421 (+13%)
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-kab"

--===============3552050686154818155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 5547496 to 5555840 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGSIZE changed from 88440 to 88598 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 88111 to 88263 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 88383 to 89102 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 122124 to 120541 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 81039 to 81183 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGSIZE changed from 104308 to 104481 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 88128 to 87060 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGSIZE changed from 86566 to 86717 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGSIZE changed from 90634 to 90795 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 68478 to 129737 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGSIZE changed from 89181 to 89343 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 135909 to 136127 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGSIZE changed from 85911 to 86066 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGSIZE changed from 70801 to 76497 (+8%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGSIZE changed from 79725 to 98935 (+24%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 87371 to 87539 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGSIZE changed from 88540 to 87740 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 87939 to 87219 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 112297 to 112434 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGSIZE changed from 85030 to 85168 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGSIZE changed from 76679 to 86421 (+13%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGSIZE changed from 112171 to 111273 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGSIZE changed from 84664 to 84805 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 85733 to 85729 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGSIZE changed from 109665 to 109813 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGSIZE changed from 79434 to 79576 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGSIZE changed from 79716 to 80094 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4443500 to 4450019 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 46.0 [default] to 46.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2053420 to 2056100 (+0%)
packages/core2-64-poky-linux/epiphany: PV changed from "46.0" to "46.3"
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-kab"
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/46/epiphany-46.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/46/epiphany-46.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PKGV changed from 46.0 [default] to 46.3 [default]

--===============3552050686154818155==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-46.0-46.3.patch"

RnJvbSBjODgxM2UyYWIxOTZkODQ3ODc1Y2M0NTI2OGEwNDc2NGI5YWY5N2ZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTQ6NDY6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0Ni4wIC0+IDQ2LjMKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80Ni4wLmJiID0+IGVwaXBoYW55XzQ2LjMuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L3tlcGlwaGFueV80Ni4wLmJiID0+IGVwaXBoYW55XzQ2LjMuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYuMy5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjMu
YmIKaW5kZXggOTA1MmZlMTcwYi4uZDlhZDM4ZDY5MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2VwaXBoYW55XzQ2LjMuYmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICIk
e0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9
IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiZjQzNDhmMmNmNTFjMDdjMGMxMDZkMTMwMTcyZDRkMjNmMmNkNDA2
ODc3MWUxZGUwMDdiNzU4Y2EyYWRlNTY2MCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
ImE5ZTFhZDIwNjQ0OTExN2ZjNWViZTRkMDE3N2MxZDdhMmZmNTAzZDZiNTUwMTkwNzJhMDY4ZmYy
YWIyNzg2NTYiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1Z2dpbmcKIFBBQ0tBR0VD
T05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9dHJ1ZSwtRGRldmVsb3Bl
cl9tb2RlPWZhbHNlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2Zp
bGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQt
ZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKaW5kZXggZTUwNTQ2Njc2NC4uZTEyOWQ1MDNl
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVs
cC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZDQ1Yzc1ZmU2OTFl
Mjc1ZDdhN2Q3ZTY0MWFjNjZiMTUzMzY5YTFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA0ZWM4Njg3MWY4YzJhODU0YWVjOWU2OTU1NTY2ZmE0MzdmZDVmMDlhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDMxIEphbiAyMDE4IDE1OjUwOjM4ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGhlbHAvbWVzb24uYnVpbGQ6IGRpc2FibGUgdGhlIHVzZSBvZiB5ZWxwCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKaW5kZXgg
YTI4MDBlYjYyZC4uYmE2NzRlNGFhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzI5
N2Y1Yjg5ZDdjOGU5OGFjOThlMWQ5YTc1MDZkZjZkYjZmYzAyNSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNjQxYzlkNWZjMGQ5ZjE2MTUxYTIwYTVkZjJmMGI0MDU5ZDExMzBhMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogRnJpLCAyNiBGZWIgMjAyMSAxMDoxNzo1MiAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBlbmNvZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMv
b3MtcmVsZWFzZSBpbnRvIHRoZQpAQCAtMTEsNyArMTEsNyBAQCBSUCAyMDIxLzIvMjYKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIv
bWVzb24uYnVpbGQKLWluZGV4IGU0MTZjYzcuLmVlNWY3YjEgMTAwNjQ0CitpbmRleCAyNjkxODI4
Li5jNDY2YWY2IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBA
QCAtMTUsNiArMTUsNyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKaW5kZXggMWI0NDA0YzhjYS4u
NTM4MzdmNDQ4YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVz
L21pZ3JhdG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjM4YTRjZWFlZWMwNWVmYjFiODIy
ZDUyYzQzNTkwZTdmZDUxODExMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmZjYzJi
M2MzNzUxYjJmYjYzNDc0Y2E3OGIyNGU0YjYzNzVkNjJhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPgogRGF0ZTogVGh1LCAyNSBGZWIgMjAyMSAxNDo1MjozMiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBlcGlwaGFueTogRml4IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZQotLSAKMi40NC4wCgo=

--===============3552050686154818155==--

