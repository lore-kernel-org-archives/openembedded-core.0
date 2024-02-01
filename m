Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26D0C48BC4
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.2125.1706810408085222850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ylcb/iKh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ht4f0+W9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018d65d3f778-fdf21b40-fd38-4298-998e-cde661ae4871-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hBwASudRFA2GUVY9qvndJtmh8/VssTm4K6zSUwQLiEo=;
	b=Ylcb/iKhZCceLDQQhSfvMAEEkxPRzNJ55UdJmh+fu7XkXSX9CnQp6OdUichaJkP4
	fsRYjwqsfWXU1nu/VEC4O4kRzwdtoWE2GdvT8n/lPC9kiSKZtRmJ0NyaW3Z1JX/GHV0
	yG1aFCXTeuWPgAfh1zPYZrp0PoepyWJcS+gfERUU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hBwASudRFA2GUVY9qvndJtmh8/VssTm4K6zSUwQLiEo=;
	b=Ht4f0+W9QQ5+3Iu/YOwDW0mWoM7G6VFRotkzEP8hx2hvVX9Ea1XqdeAu45Huk6B9
	OefjBslqfZkLYYzoTFjdvhUNPBVEh6uonMN0fO4Cc9F8OyplGHwoovtd76BWQlIeHaV
	yRr/EDCf/QULwcmuWNt7JmgQvIHNsgRNKo8DIba4=
Content-Type: multipart/mixed; boundary="===============2001801404475591037=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 45.2 SUCCEEDED
Message-ID: <0101018d65d3f778-fdf21b40-fd38-4298-998e-cde661ae4871-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194702

--===============2001801404475591037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *45.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-45.1-45.2.patch
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
From 446161156f808bb5bc6931fdbf89b7c9e2d1ebeb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 12:30:29 +0000
Subject: [PATCH] epiphany: upgrade 45.1 -> 45.2

---
 .../{epiphany_45.1.bb => epiphany_45.2.bb}    |  2 +-
 ...-meson.build-disable-the-use-of-yelp.patch |  2 +-
 .../epiphany/files/distributor.patch          | 18 +++++++++++++-----
 .../epiphany/files/migrator.patch             | 19 ++++++++++++++-----
 4 files changed, 29 insertions(+), 12 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_45.1.bb => epiphany_45.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_45.1.bb b/meta/recipes-gnome/epiphany/epiphany_45.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_45.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_45.2.bb
index c8631e05e9..89ce9dc669 100644
--- a/meta/recipes-gnome/epiphany/epiphany_45.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_45.2.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "7c994ef34ecd60e915de331ee123c08938f9623cefada6d50b99e3c9c5ad8135"
+SRC_URI[archive.sha256sum] = "79c71460bffefccef5e67be3fb5fca657853e8216cb626399d2b950ce0320ddc"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index a6c4f92c86..4b735a6acb 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001
+From 910b7250350d19e5d72ce62571130accb682aa69 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index b09c9b38d2..504ee8223a 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,12 +1,20 @@
-Don't encode the distro from /etc/os-release into the binaries.
+From 5efe7d0ff238fd38bf19c93134e6beeec87b9199 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 26 Feb 2021 10:17:52 +0000
+Subject: [PATCH] Don't encode the distro from /etc/os-release into the
+ binaries.
 
 Upstream-Status: Pending
 RP 2021/2/26
 
-Index: epiphany-3.38.2/meson.build
-===================================================================
---- epiphany-3.38.2.orig/meson.build
-+++ epiphany-3.38.2/meson.build
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 61e2b39..ed3186c 100644
+--- a/meson.build
++++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
  else
    distributor_name = 'GNOME Web'
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index a9a650a64a..9171e0bbef 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,3 +1,8 @@
+From f9891e91a4fc3dd903d375573825ece80512fff4 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 25 Feb 2021 14:52:32 +0000
+Subject: [PATCH] epiphany: Fix reproducibility issue
+
 We don't want to encide BUILD_ROOT into target packages. This is used
 for build time tests but in our case those would be on target anyway
 do use the target paths.
@@ -5,11 +10,15 @@ do use the target paths.
 Upstream-Status: Pending
 RP 2021/2/25
 
-Index: epiphany-3.38.2/lib/ephy-profile-utils.c
-===================================================================
---- epiphany-3.38.2.orig/lib/ephy-profile-utils.c
-+++ epiphany-3.38.2/lib/ephy-profile-utils.c
-@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const c
+---
+ lib/ephy-profile-utils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/ephy-profile-utils.c b/lib/ephy-profile-utils.c
+index a2f6181..5218077 100644
+--- a/lib/ephy-profile-utils.c
++++ b/lib/ephy-profile-utils.c
+@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const char *profile_directory,
    argv[i++] = NULL;
  
  #if DEVELOPER_MODE
-- 
2.42.0


--===============2001801404475591037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 62073 to 76452 (+23%)

--===============2001801404475591037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 157 recipes from the core2-64 sysroot...done.
Removing 181 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3d5481eb8970380d377654db1f645331130072db"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3d5481eb8970380d377654db1f645331130072db"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1214 Local 1014 Mirrors 0 Missed 200 Current 481 (83% match, 88% complete)
Removing 6 stale sstate objects for arch qemux86_64...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 486 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 518 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 552 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.30.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 553 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 554 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 555 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 556 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 557 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.30.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe libhandy-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 574 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 579 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libhandy-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe gcr-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 589 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 592 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 609 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 610 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 619 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 628 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 639 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 640 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 656 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 672 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 680 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 681 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 691 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 698 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/orc/0.4.34/temp/log.do_packagedata_setscene.4174200
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 714 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 739 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 741 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 749 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 751 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 754 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 755 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 758 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 760 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 762 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 764 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_package_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 781 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 782 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 784 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 785 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 790 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 791 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 797 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 799 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 802 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 803 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 807 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 813 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 814 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_package_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 816 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 819 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 822 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 824 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 830 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 841 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 843 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 847 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 855 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 858 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 861 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 862 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 865 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 872 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 879 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 893 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 898 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 900 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 902 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 904 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 906 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 908 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 910 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 912 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 914 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 918 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 930 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 937 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 940 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 941 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 943 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 947 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxmlb-0.3.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 951 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 953 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 954 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 956 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 957 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 959 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 965 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 966 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 971 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 974 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 976 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 982 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 984 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 988 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 989 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 991 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 994 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 995 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 999 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1000 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1003 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1005 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1007 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe enchant2-2.6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1009 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1012 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1013 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1014 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1015 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe enchant2-2.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1019 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1020 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1021 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1024 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe enchant2-2.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1025 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1034 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1036 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1037 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1039 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1040 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1042 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1043 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1045 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1046 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1048 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1049 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1053 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1055 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1057 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1062 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1066 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1068 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1071 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1075 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1077 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1088 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1089 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1091 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1092 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1093 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1095 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1098 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1101 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1103 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1104 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1105 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1106 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1107 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1108 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1110 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1111 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1112 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1113 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1114 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1116 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1117 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1118 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1119 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1122 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1127 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1128 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1131 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1132 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1133 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1136 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1138 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1139 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1141 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1148 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1149 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1151 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1153 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1154 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1155 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1157 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1159 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1160 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1162 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1164 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1165 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1166 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1174 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1177 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1179 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1182 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1185 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1187 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1191 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1195 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1197 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1198 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1200 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1202 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1204 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1206 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1207 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1209 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1210 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1211 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1213 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1216 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1217 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1218 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1219 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1222 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.58.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.58.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1225 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1226 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1228 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1229 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1232 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1234 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.58.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1235 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1237 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1238 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1239 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.58.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1243 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1244 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1255 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1256 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.58.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1320 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1331 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1389 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1391 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1394 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1399 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1400 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1401 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1402 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1403 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe shadow-native-4.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1404 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cargo-native-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.58.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1407 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1408 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1409 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1410 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-native-4.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1412 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1415 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.58.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1416 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1419 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1422 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.58.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1486 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.58.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1493 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: recipe cargo-native-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1494 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1497 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1499 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1502 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1503 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1504 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1509 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1510 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1511 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1512 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1515 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1516 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1518 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1519 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1521 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1522 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1524 of 1695 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1525 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1526 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1529 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1530 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1533 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 1534 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1536 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1537 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1538 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1539 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1540 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1541 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1543 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1544 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1545 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1546 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1547 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1548 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1550 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1551 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1555 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1557 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1559 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1561 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1564 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1566 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1567 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1569 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1572 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1575 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1577 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1586 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1588 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1009 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_fetch)
NOTE: Running task 1020 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: Running task 1060 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1101 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1117 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: Running task 1124 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Started
NOTE: Running task 1158 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_fetch)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 1164 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_fetch)
NOTE: Running task 1169 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 1187 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Started
NOTE: Running task 1203 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1205 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1208 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1225 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1239 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe rust-native-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Started
NOTE: Running task 1269 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Started
NOTE: Running task 1287 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe pango-1.51.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1311 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Started
NOTE: recipe pango-1.51.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1323 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1328 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_write_config)
NOTE: Running task 1331 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_write_config)
NOTE: Running task 1334 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: Running task 1336 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1337 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1338 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_patch)
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe pango-1.51.0-r0: task do_unpack: Started
NOTE: Running task 1343 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Started
NOTE: recipe pango-1.51.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Succeeded
NOTE: Running task 1370 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_write_config: Succeeded
NOTE: Running task 1397 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1398 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_patch: Started
NOTE: Running task 1417 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1419 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 1420 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1421 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: Running task 1423 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: Running task 1424 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Started
NOTE: Running task 1447 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_unpack: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: Running task 1480 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1500 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe pango-1.51.0-r0: task do_unpack: Succeeded
NOTE: Running task 1541 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_patch)
NOTE: Running task 1556 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1567 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_fetch)
NOTE: Running task 1568 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.17-r0: task do_fetch: Started
NOTE: recipe libical-3.0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1594 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 1595 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_unpack)
NOTE: Running task 1596 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1620 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 1665 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe bluez5-5.72-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1695 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe bluez5-5.72-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.3.3-r0: task do_fetch: Started
NOTE: Running task 1715 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1731 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_23.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1747 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: Running task 1750 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe pango-1.51.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 1777 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe bluez5-5.72-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe mesa-2_23.3.3-r0: task do_unpack: Started
NOTE: Running task 1870 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1590 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1591 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1592 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1593 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1594 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.3.3-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.3.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1595 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 1596 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running task 1926 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe vala-0.56.13-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1597 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1927 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_patch)
NOTE: recipe bluez5-5.72-r0: task do_unpack: Succeeded
NOTE: Running task 1928 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1930 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_generate_toolchain_file)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1600 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 1949 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_patch: Started
NOTE: Running task 1954 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_patch: Started
NOTE: recipe libical-3.0.17-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.13-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2015 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libical-3.0.17-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running setscene task 1602 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Started
NOTE: Running task 2023 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Succeeded
NOTE: Running task 2049 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_fetch)
NOTE: Running task 2050 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_unpack)
NOTE: Running task 2067 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2103 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2109 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2110 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_fetch)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1603 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1605 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Started
NOTE: Running task 2111 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2112 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2113 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2116 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_fetch: Succeeded
NOTE: Running task 2122 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 2128 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2132 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2141 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_write_config)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Succeeded
NOTE: Running task 2142 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_patch)
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2143 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_patch)
NOTE: recipe libxmlb-0.3.15-r0: task do_unpack: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2153 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_fetch)
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1608 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2170 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2171 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 2174 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_fetch)
NOTE: recipe cairo-1.18.0-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2175 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Succeeded
NOTE: Running task 2177 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_patch)
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Succeeded
NOTE: Running task 2179 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 2183 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe cairo-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1610 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1611 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.12.5-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1612 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 1613 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1615 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.12.5-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: Running setscene task 1616 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1617 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_write_config: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1618 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1619 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1620 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxmlb-0.3.15-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running setscene task 1621 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2191 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2192 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_patch)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2200 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running setscene task 1624 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2208 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: Running setscene task 1627 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.15-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1628 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1629 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2209 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_patch: Started
NOTE: Running task 2211 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1633 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1635 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: Running task 2230 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_fetch: Started
NOTE: Running task 2239 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2248 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_write_config)
NOTE: recipe libwpe-1.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 2255 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_unpack)
NOTE: Running task 2257 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2267 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1638 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_unpack: Succeeded
NOTE: Running task 2280 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_write_config: Started
NOTE: Running task 2287 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libxmlb-0.3.15-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.5-r0: task do_unpack: Started
NOTE: Running task 2289 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_write_config)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: Running task 2302 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_write_config)
NOTE: Running task 2305 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe mesa-2_23.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2306 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_patch)
NOTE: recipe libwpe-1.14.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2319 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2331 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_patch)
NOTE: Running task 2340 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_write_config: Started
NOTE: recipe libwpe-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2341 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_patch)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1640 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1641 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1643 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.3.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Succeeded
NOTE: Running task 2349 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Started
NOTE: Running task 2391 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: Running task 2394 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: Running task 2418 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Succeeded
NOTE: Running task 2420 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: recipe libwpe-1.14.1-r0: task do_patch: Started
NOTE: Running task 2421 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_write_config: Started
NOTE: recipe libwpe-1.14.1-r0: task do_patch: Succeeded
NOTE: Running task 2422 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.5-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2425 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: recipe libsecret-0.21.2-r0: task do_fetch: Started
NOTE: recipe enchant2-2.6.5-r0: task do_fetch: Started
NOTE: Running task 2426 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_fetch)
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.6.5-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 2446 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_generate_toolchain_file)
NOTE: Running task 2463 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_fetch)
NOTE: Running task 2466 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 2475 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: Running task 2481 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_unpack)
NOTE: Running task 2482 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: Running task 2483 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_unpack)
NOTE: recipe appstream-1.0.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2484 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: recipe appstream-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2486 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_23.3.3-r0: task do_patch: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_fetch: Started
NOTE: Running task 2488 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe libwpe-1.14.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2489 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: Running setscene task 1645 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: recipe enchant2-2.6.5-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1646 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1647 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.14.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 1649 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.2-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: Running task 2515 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_fetch)
NOTE: recipe appstream-1.0.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: Running task 2516 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.6.5-r0: task do_unpack: Succeeded
NOTE: Running task 2517 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: Running task 2518 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2519 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2520 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: Running task 2521 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_patch)
NOTE: recipe gcr-4.1.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2522 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: recipe gcr-4.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2523 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: recipe enchant2-2.6.5-r0: task do_patch: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2530 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_fetch)
NOTE: recipe libsecret-0.21.2-r0: task do_patch: Started
NOTE: Running setscene task 1651 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: Running setscene task 1653 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2531 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_fetch)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Started
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Started
NOTE: Running task 2532 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_unpack)
NOTE: recipe appstream-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2534 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: Running task 2542 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe enchant2-2.6.5-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: Running setscene task 1655 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1656 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2546 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_unpack)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_fetch: Started
NOTE: recipe libhandy-1.8.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2569 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: recipe libadwaita-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_unpack: Started
NOTE: Running task 2608 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Succeeded
NOTE: Running task 2609 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2611 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_unpack)
NOTE: Running task 2613 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_unpack)
NOTE: recipe libhandy-1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_unpack: Started
NOTE: Running task 2614 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1658 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running task 2714 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_write_config)
NOTE: Running task 2716 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: Running task 2719 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: Running task 2723 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_write_config)
NOTE: recipe gcr-4.1.0-r0: task do_unpack: Started
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_unpack: Succeeded
NOTE: Running task 2724 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_patch)
NOTE: recipe libhandy-1.8.2-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_write_config: Started
NOTE: Running task 2725 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.0.0-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2735 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_recipe_qa)
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_patch: Started
NOTE: Running setscene task 1660 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1661 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2736 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_patch)
NOTE: Running task 2746 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe appstream-1.0.0-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_patch: Succeeded
NOTE: Running task 2792 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_write_config)
NOTE: Running task 2793 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1663 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: Running task 2795 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_write_config)
NOTE: recipe epiphany-45.2-r0: task do_recipe_qa: Started
NOTE: recipe gcr-4.1.0-r0: task do_patch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_write_config: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-4.1.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_write_config: Started
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Started
NOTE: Running task 2798 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2799 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_patch)
NOTE: Running task 2800 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libadwaita-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_write_config: Succeeded
NOTE: Running task 2801 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_patch)
NOTE: recipe epiphany-45.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2802 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_write_config)
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 2803 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_fetch)
NOTE: recipe gcr-4.1.0-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2809 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2852 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_write_config)
NOTE: recipe libhandy-1.8.2-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2875 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_patch)
NOTE: Running setscene task 1665 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1666 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1667 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libhandy-1.8.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_write_config: Started
NOTE: recipe epiphany-45.2-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_patch: Started
NOTE: recipe libportal-0.7.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2881 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running setscene task 1668 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe epiphany-45.2-r0: task do_fetch: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1670 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 2882 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_unpack)
NOTE: recipe libadwaita-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.5-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2886 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_patch)
NOTE: recipe libadwaita-1.4.2-r0: task do_write_config: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe epiphany-45.2-r0: task do_write_config: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe epiphany-45.2-r0: task do_unpack: Started
NOTE: recipe libhandy-1.8.2-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.5-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_write_config: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 3023 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.12.5-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Running task 3025 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1674 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1675 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1677 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe epiphany-45.2-r0: task do_unpack: Succeeded
NOTE: Running task 3028 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1682 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1683 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1685 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-45.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 3034 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe epiphany-45.2-r0: task do_patch: Succeeded
NOTE: Running task 3053 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3054 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_populate_lic)
NOTE: recipe epiphany-45.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_populate_lic: Started
NOTE: recipe epiphany-45.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_deploy_source_date_epoch unihash changed to 497383e7be4d58fd8ecafa5b972b22c23e760b33c7201f58d9adea45fb09a5b0
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_populate_lic unihash changed to a34a158105b44d3fc5de398f9b2a01f1a3fb6c8fa8f20c4592a79d8460f4594b
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1688 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1690 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1691 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1693 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 3067 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_patch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1695 of 1695 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe webkitgtk-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 3370 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3382 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3444 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3478 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3537 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3548 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3612 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3858 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_23.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3859 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_configure)
NOTE: Running task 3868 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3879 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: Running task 3880 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: Running task 3946 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3974 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: Running task 3975 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: Running task 3992 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3994 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4007 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4016 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: Running task 4017 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: Running task 4018 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4027 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_generate_toolchain_file)
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: Running task 4028 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_23.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4029 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 4040 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_configure: Started
NOTE: Running task 4049 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: Running task 4051 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: Running task 4052 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: Running task 4053 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_23.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4054 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_configure)
NOTE: recipe mesa-2_23.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4133 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: Running task 4137 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4157 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: Running task 4168 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe mesa-2_23.3.3-r0: task do_configure: Started
NOTE: Running task 4170 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.6.5-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4181 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4182 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 4183 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4184 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: Running task 4185 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_configure: Succeeded
NOTE: Running task 4186 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 4187 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot)
NOTE: Running task 4188 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: Running task 4189 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to 4cc7b5f50299033b37b60dc58d2171ad2cacc68db16ac2686c74c5c0c6d358fc
NOTE: Setscene tasks completed
NOTE: Running task 4190 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4191 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 4192 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 4193 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 4194 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: Running task 4195 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: Running task 4196 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4197 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: recipe mesa-2_23.3.3-r0: task do_configure: Succeeded
NOTE: Running task 4198 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.3.bb:do_compile)
NOTE: recipe mesa-2_23.3.3-r0: task do_compile: Started
NOTE: recipe vala-0.56.13-r0: task do_configure: Succeeded
NOTE: Running task 4199 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_compile)
NOTE: recipe vala-0.56.13-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 4200 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 4201 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to f1d902c43434618410def9bdb23a8fbb602a26dda503c8feb988f7a02020f7f6
NOTE: Setscene tasks completed
NOTE: recipe fontconfig-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 4202 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_compile)
NOTE: recipe fontconfig-2.15.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 4203 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 4204 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 974700ede45f6ba24bbc5dbc93509279c8e8807fe2df3005723894d0ffb38044
NOTE: Setscene tasks completed
NOTE: Running task 4205 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 4206 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 4207 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 4208 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_install)
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 4209 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe fontconfig-2.15.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata unihash changed to aa0b5e1224c5372d4bde3fd1f8b88cbb95386262e91141b17bc36c2bd7933044
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4210 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: Running task 4211 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe enchant2-2.6.5-r0: task do_configure: Succeeded
NOTE: Running task 4212 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_compile)
NOTE: recipe enchant2-2.6.5-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 4213 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot)
NOTE: Running task 4214 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_package)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 4215 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 4216 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure: Succeeded
NOTE: Running task 4217 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure_ptest_base)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4218 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4219 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4220 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile)
NOTE: recipe cairo-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4221 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4222 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe cairo-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4223 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4224 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe cairo-1.18.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe enchant2-2.6.5-r0: task do_compile: Succeeded
NOTE: Running task 4225 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_install)
NOTE: recipe enchant2-2.6.5-r0: task do_install: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_compile: Succeeded
NOTE: Running task 4226 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata)
NOTE: Running task 4227 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_install)
NOTE: recipe enchant2-2.6.5-r0: task do_install: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata: Started
NOTE: Running task 4228 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_populate_sysroot)
NOTE: Running task 4229 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_package)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_install: Started
NOTE: recipe enchant2-2.6.5-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.6.5-r0: task do_package: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata unihash changed to a6513e1c9ef3a0fd840f8f57bc608a56f298802e4dc322c2bc2ea8d49aca8aaf
NOTE: recipe enchant2-2.6.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4230 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot)
NOTE: Running task 4231 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_package)
NOTE: Running task 4232 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: Running task 4233 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to 33e74c7cb6c25d1d0b0d80d6c78cba05b7516614490a669e7158d69b09a54162
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4234 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4235 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4236 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4237 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4238 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4239 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4240 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4241 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.6.5-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4242 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4243 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4244 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4245 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxmlb-0.3.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4246 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_configure)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4247 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4248 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: Running task 4249 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4250 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure)
NOTE: Running task 4251 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Started
NOTE: Running task 4252 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_configure)
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 4253 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_packagedata)
NOTE: recipe enchant2-2.6.5-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.6.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_packagedata unihash changed to 4c6d417ba3182c36ae4e1f553d962fafa629c27554334eb0d6c81e05a0c1414d
NOTE: Setscene tasks completed
NOTE: Running task 4254 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4255 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.5.bb:do_create_spdx)
NOTE: recipe enchant2-2.6.5-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_package: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_compile: Succeeded
NOTE: Running task 4256 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata)
NOTE: Running task 4257 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile_ptest_base)
NOTE: recipe enchant2-2.6.5-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4258 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install)
NOTE: recipe cairo-1.18.0-r0: task do_configure: Succeeded
NOTE: Running task 4259 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata unihash changed to 573a71ff91b9225f1aa5772236da4cdb2a90786e4cdba630206d5a2685edec47
NOTE: recipe cairo-1.18.0-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4260 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: Running task 4261 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx)
NOTE: Running task 4262 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4263 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure_ptest_base)
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4264 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4265 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4266 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4267 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_compile)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_compile: Started
NOTE: Running task 4268 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: Running task 4269 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4270 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_compile: Succeeded
NOTE: Running task 4271 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4272 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: Running task 4273 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4274 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4275 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4276 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: Running task 4277 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4278 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4279 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_install: Succeeded
NOTE: Running task 4280 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package)
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4281 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4282 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 4283 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4284 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4285 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 4286 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_configure_ptest_base)
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4287 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 4288 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4289 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_compile: Succeeded
NOTE: Running task 4290 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_install)
NOTE: recipe cairo-1.18.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package: Succeeded
NOTE: Running task 4291 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 4292 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 4293 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_compile: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_install: Succeeded
NOTE: Running task 4294 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: Running task 4295 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_compile_ptest_base)
NOTE: Running task 4296 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4297 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_package)
NOTE: Running task 4298 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: Running task 4299 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libxmlb-0.3.15-r0: task do_compile_ptest_base: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_packagedata: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.0-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_packagedata unihash changed to 0332d5a7bc63e4b130abad80846ee372262b4194529bcc6a35d60abcc3e255ce
NOTE: recipe libxmlb-0.3.15-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: Running task 4300 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 4301 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_install)
NOTE: Running task 4302 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 4303 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_ipk)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 4c240bca458b1a6275e63788ebeda6e3735ec170d96b15864adac250eb8e2247
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_ipk: Started
NOTE: Setscene tasks completed
NOTE: Running task 4304 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: Running task 4305 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 4306 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install_ptest_base)
NOTE: Running task 4307 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_install: Succeeded
NOTE: Running task 4308 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4309 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4310 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 4311 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_install: Succeeded
NOTE: Running task 4312 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_package)
NOTE: Running task 4313 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install_ptest_base)
NOTE: recipe libxmlb-0.3.15-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 4314 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_package: Started
NOTE: Running task 4315 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4316 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: Running task 4317 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: Running task 4318 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4319 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_populate_sysroot: Started
NOTE: Running task 4320 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4321 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: Running task 4322 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe dbus-1.14.10-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4323 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_ipk unihash changed to 13fcab0eb9de5723940be4384f3b4c4e91d97646e0d9d72f0c98c730d9badb7e
NOTE: Running task 4324 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4325 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_package)
NOTE: Running task 4326 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: Running task 4327 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_deb)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4328 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_deb: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 4329 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_rpm)
NOTE: Running task 4330 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe cairo-1.18.0-r0: task do_package: Succeeded
NOTE: Running task 4331 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_rpm: Started
NOTE: Running task 4332 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 4333 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_deb unihash changed to 61ca4f6ea6ea96547d8f78e5db5c14ac779316279aa8cb45bee6124fab66fa5b
NOTE: Running task 4334 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to b9b8f21ea09974dc7010b96f71606a53ff7195ea0f1cb11c76676fe8bd332088
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata unihash changed to 1cd7693ca4eb1e099428454c1a4c52609ceb7173eb7bc9e12d47520c553316cf
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4335 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: Running task 4336 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: Running task 4337 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx)
NOTE: Running task 4338 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 4339 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_package: Succeeded
NOTE: Running task 4340 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 4341 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: Running task 4342 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 353a8cde85d2d6588c946c83dd20e56722a6458d8007a2eae7b5bf79867d6310
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata unihash changed to d40286f7c4229a96b81fbfa8a6fde78072e9f63c061d4950811507eda6928064
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_packagedata unihash changed to 0de6c7264e69773b305917ef3abb20df456f2b7d6a8e16e861faa031954da856
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_package: Succeeded
NOTE: Running task 4343 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 4344 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_rpm unihash changed to 545aeb5e7471a20ec5d80aa821e222e06ac6abac2fb7a08a57930cff72d8d9bf
NOTE: Setscene tasks completed
NOTE: Running task 4345 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4346 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata)
NOTE: Running task 4347 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: Running task 4348 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata unihash changed to 50b9995ca826c7a84118d34423444fc350146b7688aaf7a1793e2d843840fef8
NOTE: recipe libxmlb-0.3.15-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4349 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: Running task 4350 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.10-r0: task do_package: Succeeded
NOTE: Running task 4351 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata)
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4352 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_compile)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata unihash changed to 5c7a995013aace2651004042257ac9f2f30785e9064688b54729d7e8a353e9e5
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4353 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_compile)
NOTE: Running task 4354 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: Running task 4355 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx)
NOTE: Running task 4356 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_ipk)
NOTE: Running task 4357 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_deb)
NOTE: Running task 4358 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.13-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_ipk: Started
NOTE: Running task 4359 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_install)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.56.13-r0: task do_install: Started
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata unihash changed to 89bf4a107253e1a5fec2f7c6977eb5ce25676e4a1a62947421bc99e9fb5af113
NOTE: Setscene tasks completed
NOTE: Running task 4360 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4361 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4362 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_install: Succeeded
NOTE: Running task 4363 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot)
NOTE: Running task 4364 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_package)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 4365 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4366 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4367 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4368 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4369 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_configure)
NOTE: recipe libsecret-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4370 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_configure)
NOTE: recipe libical-3.0.17-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.2-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata unihash changed to 6f0c733a6f5f59bc078c7b61f5c36a15f79ae58a0a0a5bb7d4ff5157bf9e5115
NOTE: recipe appstream-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4371 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_install)
NOTE: Running task 4372 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_configure)
NOTE: Running task 4373 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe appstream-1.0.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4374 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 4375 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 4376 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: Running task 4377 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot)
NOTE: Running task 4378 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_package)
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Started
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4379 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.13-r0: task do_package: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4380 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 4381 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_compile)
NOTE: recipe libsecret-0.21.2-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 4382 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 4383 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to fd2dc21d0142947463a9e75881dfc0a95a469ced23bf6ebc6b7cda9c5c2e1fde
NOTE: recipe appstream-1.0.0-r0: task do_compile: Started
NOTE: Running task 4384 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.17-r0: task do_configure: Succeeded
NOTE: Running task 4385 of 4609 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_compile)
NOTE: recipe libical-3.0.17-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_compile: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_23.3.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 4385 tasks of which 3960 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201122623.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201122623.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata
Summary: There were 19 ERROR messages, returning a non-zero exit code.
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package orc-src went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package orc-dbg went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package orc-examples went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package orc-staticdev went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package orc-dev went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package orc-doc went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package orc-locale went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package orc went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package liborc-0.4 went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: QA Issue: Package version for package liborc-test-0.4 went backwards which would break package feeds (from 0:0.4.36-r0 to 0:0.4.34-r0) [version-going-backwards]
ERROR: orc-0.4.34-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vala/0.56.13/temp/log.do_packagedata.167704
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata) failed with exit code '1'

--===============2001801404475591037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 6308784 to 6308752 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 81504 to 82021 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 62073 to 76452 (+23%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4546916 to 4546884 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2091848 to 2092064 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/45/epiphany-45.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/45/epiphany-45.2.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PKGV changed from 45.1 [default] to 45.2 [default]

--===============2001801404475591037==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-45.1-45.2.patch"

RnJvbSA0NDYxNjExNTZmODA4YmI1YmM2OTMxZmRiZjg5YjdjOWUyZDFlYmViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMjozMDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQ1LjEgLT4gNDUuMgoKLS0tCiAuLi4ve2VwaXBoYW55XzQ1LjEuYmIg
PT4gZXBpcGhhbnlfNDUuMi5iYn0gICAgfCAgMiArLQogLi4uLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoIHwgIDIgKy0KIC4uLi9lcGlwaGFueS9maWxlcy9kaXN0cmli
dXRvci5wYXRjaCAgICAgICAgICB8IDE4ICsrKysrKysrKysrKystLS0tLQogLi4uL2VwaXBoYW55
L2ZpbGVzL21pZ3JhdG9yLnBhdGNoICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrKystLS0t
LQogNCBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkve2VwaXBoYW55XzQ1LjEuYmIgPT4gZXBp
cGhhbnlfNDUuMi5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZXBpcGhhbnlfNDUuMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlw
aGFueV80NS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80NS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUuMi5iYgppbmRleCBjODYzMWUwNWU5Li44OWNlOWRj
NjY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUuMi5iYgpA
QCAtMzEsNyArMzEsNyBAQCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7
QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAxKX0vJHtHTgogICAgICAgICAgICBmaWxl
Oi8vbWlncmF0b3IucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2gg
XAogICAgICAgICAgICAiCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI3Yzk5NGVmMzRl
Y2Q2MGU5MTVkZTMzMWVlMTIzYzA4OTM4Zjk2MjNjZWZhZGE2ZDUwYjk5ZTNjOWM1YWQ4MTM1Igor
U1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNzljNzE0NjBiZmZlZmNjZWY1ZTY3YmUzZmI1
ZmNhNjU3ODUzZTgyMTZjYjYyNjM5OWQyYjk1MGNlMDMyMGRkYyIKIAogIyBEZXZlbG9wZXIgbW9k
ZSBlbmFibGVzIGRlYnVnZ2luZwogUEFDS0FHRUNPTkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURk
ZXZlbG9wZXJfbW9kZT10cnVlLC1EZGV2ZWxvcGVyX21vZGU9ZmFsc2UiCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRp
c2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRj
aAppbmRleCBhNmM0ZjkyYzg2Li40YjczNWE2YWNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVz
ZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8w
MDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDc3YzlmODdkYzJiM2FkMDg1NGE2NzhlMjM0ZTIyZGZiMzE5MDJiODIg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkxMGI3MjUwMzUwZDE5ZTVkNzJjZTYyNTcx
MTMwYWNjYjY4MmFhNjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMzEgSmFuIDIwMTgg
MTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gaGVscC9tZXNvbi5idWlsZDogZGlzYWJs
ZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFu
eS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9m
aWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCBiMDljOWIzOGQyLi41MDRlZTgyMjNhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBh
dGNoCkBAIC0xLDEyICsxLDIwIEBACi1Eb24ndCBlbmNvZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMv
b3MtcmVsZWFzZSBpbnRvIHRoZSBiaW5hcmllcy4KK0Zyb20gNWVmZTdkMGZmMjM4ZmQzOGJmMTlj
OTMxMzRlNmJlZWVjODdiOTE5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJpY2hh
cmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgorRGF0ZTogRnJp
LCAyNiBGZWIgMjAyMSAxMDoxNzo1MiArMDAwMAorU3ViamVjdDogW1BBVENIXSBEb24ndCBlbmNv
ZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMvb3MtcmVsZWFzZSBpbnRvIHRoZQorIGJpbmFyaWVzLgog
CiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIFJQIDIwMjEvMi8yNgogCi1JbmRleDogZXBpcGhh
bnktMy4zOC4yL21lc29uLmJ1aWxkCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gZXBpcGhhbnktMy4zOC4yLm9y
aWcvbWVzb24uYnVpbGQKLSsrKyBlcGlwaGFueS0zLjM4LjIvbWVzb24uYnVpbGQKKy0tLQorIG1l
c29uLmJ1aWxkIHwgMSArCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCisKK2RpZmYg
LS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCitpbmRleCA2MWUyYjM5Li5lZDMxODZj
IDEwMDY0NAorLS0tIGEvbWVzb24uYnVpbGQKKysrKyBiL21lc29uLmJ1aWxkCiBAQCAtMTUsNiAr
MTUsNyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCiAgZWxzZQogICAgZGlzdHJpYnV0b3JfbmFt
ZSA9ICdHTk9NRSBXZWInCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMv
bWlncmF0b3IucGF0Y2gKaW5kZXggYTlhNjUwYTY0YS4uOTE3MWUwYmJlZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaApAQCAtMSwzICsx
LDggQEAKK0Zyb20gZjk4OTFlOTFhNGZjM2RkOTAzZDM3NTU3MzgyNWVjZTgwNTEyZmZmNCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgorRGF0ZTogVGh1LCAyNSBGZWIgMjAyMSAxNDo1MjozMiAr
MDAwMAorU3ViamVjdDogW1BBVENIXSBlcGlwaGFueTogRml4IHJlcHJvZHVjaWJpbGl0eSBpc3N1
ZQorCiBXZSBkb24ndCB3YW50IHRvIGVuY2lkZSBCVUlMRF9ST09UIGludG8gdGFyZ2V0IHBhY2th
Z2VzLiBUaGlzIGlzIHVzZWQKIGZvciBidWlsZCB0aW1lIHRlc3RzIGJ1dCBpbiBvdXIgY2FzZSB0
aG9zZSB3b3VsZCBiZSBvbiB0YXJnZXQgYW55d2F5CiBkbyB1c2UgdGhlIHRhcmdldCBwYXRocy4K
QEAgLTUsMTEgKzEwLDE1IEBAIGRvIHVzZSB0aGUgdGFyZ2V0IHBhdGhzLgogVXBzdHJlYW0tU3Rh
dHVzOiBQZW5kaW5nCiBSUCAyMDIxLzIvMjUKIAotSW5kZXg6IGVwaXBoYW55LTMuMzguMi9saWIv
ZXBoeS1wcm9maWxlLXV0aWxzLmMKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBlcGlwaGFueS0zLjM4LjIub3Jp
Zy9saWIvZXBoeS1wcm9maWxlLXV0aWxzLmMKLSsrKyBlcGlwaGFueS0zLjM4LjIvbGliL2VwaHkt
cHJvZmlsZS11dGlscy5jCi1AQCAtMTMwLDEwICsxMzAsMTAgQEAgZXBoeV9wcm9maWxlX3V0aWxz
X2RvX21pZ3JhdGlvbiAoY29uc3QgYworLS0tCisgbGliL2VwaHktcHJvZmlsZS11dGlscy5jIHwg
NCArKy0tCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
KworZGlmZiAtLWdpdCBhL2xpYi9lcGh5LXByb2ZpbGUtdXRpbHMuYyBiL2xpYi9lcGh5LXByb2Zp
bGUtdXRpbHMuYworaW5kZXggYTJmNjE4MS4uNTIxODA3NyAxMDA2NDQKKy0tLSBhL2xpYi9lcGh5
LXByb2ZpbGUtdXRpbHMuYworKysrIGIvbGliL2VwaHktcHJvZmlsZS11dGlscy5jCitAQCAtMTMw
LDEwICsxMzAsMTAgQEAgZXBoeV9wcm9maWxlX3V0aWxzX2RvX21pZ3JhdGlvbiAoY29uc3QgY2hh
ciAqcHJvZmlsZV9kaXJlY3RvcnksCiAgICBhcmd2W2krK10gPSBOVUxMOwogIAogICNpZiBERVZF
TE9QRVJfTU9ERQotLSAKMi40Mi4wCgo=

--===============2001801404475591037==--

