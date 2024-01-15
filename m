Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F96AC47E49
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.88281.1705340029787030628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bjDSEt/4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=m8sJlk4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d0e2fce0b-6567cbb9-dca6-4ea6-86f1-d335b4146670-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XSqkfzCmf+g/56K1heRKrURsKjPecziIbTOT9Vqs7IM=;
	b=bjDSEt/4J48+jytJgv/Ybm6BDP0qE+irk0rjyDGr8HIlQGDciNO01AQ2VAdB68cG
	ISisnUY05usufJgX5/ZhpzbvjT/GAwvHdfiRnFyTcYelqpVpwOQY5QxS6W6F4+ee54j
	gsyaqdaoZGgkp95j2DcRZ7Swr0UGi/gs/pHDoBjE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XSqkfzCmf+g/56K1heRKrURsKjPecziIbTOT9Vqs7IM=;
	b=m8sJlk4jIQ/EnxfGzcwOAyjsm00/CP7Q3Ky8X7eSMf0obChvM2ThQFTCVAUCBU4t
	3Z76R/pD3INn6e0VZj9dXWhotFR46+WtM1jJYiemCh4p4aAT356Dcu1e14vFTtTEk+B
	vHzPjd/mY37tS75ygZUJGde01eLQcVEOKwB/0kVo=
Content-Type: multipart/mixed; boundary="===============2064087923001895357=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 45.2 SUCCEEDED
Message-ID: <0101018d0e2fce0b-6567cbb9-dca6-4ea6-86f1-d335b4146670-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193768

--===============2064087923001895357==
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
From 51345ede824a0a2b283cad810e657720cef6aa12 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 11:51:30 +0000
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
index a6c4f92c86..1486922211 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001
+From b28352a3e43b8fd57d8db6fb935f67ad2b30f010 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index b09c9b38d2..5d310389bc 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,12 +1,20 @@
-Don't encode the distro from /etc/os-release into the binaries.
+From 04b0868c20e871b71c36153448255d01fbef3dcf Mon Sep 17 00:00:00 2001
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
index a9a650a64a..44735b10b8 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,3 +1,8 @@
+From 4d6143b8938d2a4c11b409e84bf270bc5afcb386 Mon Sep 17 00:00:00 2001
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


--===============2064087923001895357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1851 targets, 49 skipped, 0 masked, 0 errors.
Removing 150 recipes from the core2-64 sysroot...done.
Removing 154 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-5f9d3a7f27303ce9957b7c2ddbcaf7cdc6c875c8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5f9d3a7f27303ce9957b7c2ddbcaf7cdc6c875c8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1224 Local 1057 Mirrors 0 Missed 167 Current 467 (86% match, 90% complete)
Removing 4 stale sstate objects for arch allarch...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 472 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 511 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 516 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 531 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 536 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 542 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 544 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 546 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 564 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libhandy-1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: recipe libhandy-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_create_spdx_setscene)
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 583 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 592 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 599 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 606 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 613 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 623 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 628 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 645 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 647 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 649 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 650 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.71-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 662 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.71-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_package_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 671 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 675 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 691 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.71-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 695 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 702 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 714 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.71-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 723 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 724 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 726 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 727 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 730 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.71-r0: task do_package_setscene: Started
NOTE: Running setscene task 731 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 739 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 740 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 742 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 744 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 745 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 749 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 753 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 754 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 758 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 761 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 769 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 771 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.119-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 781 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 784 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 787 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.119-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 790 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 791 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 792 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 794 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 796 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 812 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 815 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 816 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 817 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 819 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 823 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 824 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.119-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 826 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 829 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 831 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 834 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.71-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 837 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 843 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.119-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 851 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.71-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 854 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.119-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 855 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.71-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 860 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 862 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 871 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 878 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.119-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 885 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.119-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 896 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 898 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 900 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.119-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 901 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 909 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 916 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 917 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 919 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwpe-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 920 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 923 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 929 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 930 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmlb-0.3.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 941 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 943 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 945 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 946 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 947 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 954 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 956 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 958 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 962 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 963 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 967 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 968 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libxmlb-0.3.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 974 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 975 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 976 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 977 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 978 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 980 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 985 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 987 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 989 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 991 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe enchant2-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 992 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 993 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 994 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 995 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 997 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 998 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1004 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1005 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1007 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1013 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1015 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1016 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1017 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1020 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1024 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1029 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1031 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1033 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1036 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1037 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1039 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1048 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1049 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1052 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1055 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1056 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1057 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1060 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1062 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1064 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1065 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1068 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1071 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1073 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1074 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1075 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1076 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1077 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1078 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1079 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1080 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1081 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1083 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1092 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1093 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1094 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1096 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1097 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1098 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1099 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1101 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1104 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1105 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1106 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1107 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1111 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1115 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1116 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1122 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1125 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1128 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1130 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1133 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1134 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vala/0.56.13/temp/log.do_packagedata_setscene.1330283
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1135 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_package_setscene)
NOTE: Running setscene task 1137 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1139 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1140 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1141 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1144 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1148 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1150 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1151 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1153 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.13-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1155 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1157 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1159 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1160 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1164 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1167 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1168 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1169 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1170 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1172 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1173 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1176 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1177 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 1178 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1179 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1180 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1181 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1183 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1184 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1185 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1187 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1188 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1190 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1192 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1194 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1195 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1197 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1200 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1201 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1203 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1205 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1209 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1212 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1215 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1217 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1218 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1220 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1224 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1227 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1229 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1232 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1235 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1237 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1242 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1243 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1244 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1245 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1247 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1249 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1254 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1255 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1257 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1258 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1263 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1264 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1268 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1269 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1270 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1272 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1276 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1278 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1279 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1280 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1373 of 1691 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.74.1.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.11.5/temp/log.do_packagedata_setscene.1332074
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1374 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1474 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1475 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1476 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1504 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cargo-native-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Started
NOTE: Running setscene task 1508 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1510 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1511 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1513 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1514 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1517 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1518 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1519 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1521 of 1691 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1524 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_setscene: Started
NOTE: recipe rust-native-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1526 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1530 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 892 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 928 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_fetch)
NOTE: Running task 932 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 934 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 976 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 978 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1040 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1041 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Started
NOTE: recipe pango-1.51.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1078 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: Running task 1082 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_write_config)
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_write_config)
NOTE: Running task 1089 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_fetch)
NOTE: Running task 1091 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_unpack)
NOTE: recipe pango-1.51.0-r0: task do_fetch: Succeeded
NOTE: Running task 1100 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1133 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1134 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1217 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1244 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe pango-1.51.0-r0: task do_unpack: Started
NOTE: Running task 1253 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: Running task 1267 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Started
NOTE: Running task 1268 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Succeeded
NOTE: Running task 1269 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe pango-1.51.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1292 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_write_config)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: Running task 1295 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe bluez5-5.71-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe bluez5-5.71-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1388 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_unpack)
NOTE: Running task 1390 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe mesa-2_23.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1410 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: Running task 1427 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_write_config: Started
NOTE: Running task 1469 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_write_config)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1482 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_patch)
NOTE: recipe bluez5-5.71-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 1513 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_23.3.2-r0: task do_unpack: Started
NOTE: Running task 1519 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1520 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe mesa-2_23.3.2-r0: task do_write_config: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_patch: Started
NOTE: Running task 1521 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Started
NOTE: Running task 1539 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 1565 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1566 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1573 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_fetch)
NOTE: Running task 1578 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe pango-1.51.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_patch: Started
NOTE: Running task 1584 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1587 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1588 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_fetch: Started
NOTE: Running task 1597 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe bluez5-5.71-r0: task do_unpack: Succeeded
NOTE: Running task 1614 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_fetch: Succeeded
NOTE: Running task 1617 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe rust-native-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running task 1628 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: Running task 1651 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_unpack)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_fetch)
NOTE: Running task 1664 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_patch)
NOTE: Running task 1665 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 1672 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 1676 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: recipe libxmlb-0.3.14-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1677 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_unpack: Started
NOTE: Running task 1680 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1686 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: Running task 1691 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_fetch)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1703 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running setscene task 1537 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1538 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1539 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1540 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1541 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Started
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 1705 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1706 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1709 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 1710 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1714 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 1715 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: Running task 1716 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_patch)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1542 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 1717 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_unpack: Succeeded
NOTE: Running task 1718 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1728 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: Running task 1730 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_fetch)
NOTE: Running task 1741 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1545 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_patch: Started
NOTE: Running task 1744 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_write_config)
NOTE: recipe libxmlb-0.3.14-r0: task do_write_config: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_fetch: Started
NOTE: Running task 1745 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: Running task 1748 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_unpack)
NOTE: recipe libwpe-1.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1749 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_write_config: Started
NOTE: Running task 1760 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 1776 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_write_config)
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1777 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_patch)
NOTE: recipe gtk4-4.12.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1779 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_patch)
NOTE: recipe libxmlb-0.3.14-r0: task do_patch: Succeeded
NOTE: Running task 1782 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_patch: Succeeded
NOTE: Running task 1788 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_write_config)
NOTE: Running task 1791 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe libwpe-1.14.1-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Succeeded
NOTE: Running task 1805 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: Running task 1815 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_write_config: Started
NOTE: Running setscene task 1547 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Started
NOTE: Running setscene task 1548 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1549 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1816 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_patch)
NOTE: Running task 1820 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_unpack: Succeeded
NOTE: Running task 1845 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_patch)
NOTE: Running task 1849 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1860 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: Running task 1872 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 1873 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: recipe libwpe-1.14.1-r0: task do_patch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Succeeded
NOTE: Running task 1874 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_fetch)
NOTE: recipe gtk4-4.12.4-r0: task do_write_config: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1881 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1552 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: Running setscene task 1553 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1554 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1555 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1556 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe enchant2-2.6.4-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1557 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: recipe enchant2-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1558 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1882 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1884 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.3.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: Running task 1890 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_patch: Succeeded
NOTE: Running task 1892 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1899 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_generate_toolchain_file)
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: Running task 1914 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_fetch)
NOTE: Running task 1917 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: Running setscene task 1562 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1564 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1930 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: recipe libwpe-1.14.1-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 1566 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1567 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1568 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.0.0-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1569 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 1570 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_fetch: Started
NOTE: Running setscene task 1571 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1572 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1573 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1575 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1576 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1577 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1578 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1580 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1581 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1583 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1585 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1587 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1589 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1591 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1592 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1594 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1597 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1599 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1600 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1602 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1604 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1606 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1607 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1609 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1610 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1611 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xz/5.4.4/temp/log.do_packagedata_setscene.1336131
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1612 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_package_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1615 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1616 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1617 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1622 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1624 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1625 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1627 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1630 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1632 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1635 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1637 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1640 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2415 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_patch)
NOTE: Running task 2426 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2437 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_patch)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2479 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: Running task 2480 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_unpack)
NOTE: Running task 2482 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: Running task 2483 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_unpack)
NOTE: Running task 2484 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_unpack)
NOTE: Running task 2493 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 2513 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_fetch)
NOTE: Running task 2514 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_fetch)
NOTE: Running task 2515 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: Running task 2516 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_fetch)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Started
NOTE: Running task 2522 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_fetch)
NOTE: recipe xz-5.4.4-r0: task do_package_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_patch: Started
NOTE: Running setscene task 1641 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe enchant2-2.6.4-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.1-r0: task do_unpack: Started
NOTE: recipe appstream-1.0.0-r0: task do_unpack: Started
NOTE: recipe libhandy-1.8.2-r0: task do_fetch: Started
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1642 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1643 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe enchant2-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1645 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_patch: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Succeeded
NOTE: Running task 2524 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2526 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_unpack)
NOTE: Running task 2527 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2533 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: Running task 2537 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: recipe libsecret-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 2541 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2549 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 2565 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2605 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_unpack)
NOTE: recipe enchant2-2.6.4-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: Running setscene task 1647 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: Running task 2611 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_patch)
NOTE: Running task 2612 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: Running task 2613 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1649 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libhandy-1.8.2-r0: task do_unpack: Started
NOTE: recipe enchant2-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 2614 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_unpack)
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2615 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_unpack)
NOTE: recipe libsecret-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1650 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1652 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Started
NOTE: Running task 2704 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: Running task 2708 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe appstream-1.0.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.1.0-r0: task do_unpack: Started
NOTE: Running task 2715 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_unpack: Succeeded
NOTE: Running task 2716 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: Running task 2723 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2724 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libsecret-0.21.1-r0: task do_write_config: Started
NOTE: Running task 2736 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_recipe_qa)
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_patch: Started
NOTE: Running task 2737 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1654 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running task 2747 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: Running task 2794 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_write_config)
NOTE: Running task 2795 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_write_config)
NOTE: Running task 2796 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe appstream-1.0.0-r0: task do_write_config: Started
NOTE: recipe epiphany-45.2-r0: task do_recipe_qa: Started
NOTE: recipe gcr-4.1.0-r0: task do_patch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2798 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_write_config)
NOTE: recipe appstream-1.0.0-r0: task do_write_config: Succeeded
NOTE: Running task 2799 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_write_config: Started
NOTE: Running task 2800 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_write_config)
NOTE: recipe gcr-4.1.0-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.2-r0: task do_write_config: Started
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Started
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2828 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1656 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1657 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2849 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_write_config)
NOTE: recipe epiphany-45.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: Running task 2850 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_fetch)
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_patch: Started
NOTE: Running setscene task 1659 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libadwaita-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_write_config: Started
NOTE: recipe gcr-4.1.0-r0: task do_write_config: Started
NOTE: Running task 2860 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_patch)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_patch: Started
NOTE: recipe gcr-4.1.0-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe epiphany-45.2-r0: task do_write_config: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libhandy-1.8.2-r0: task do_patch: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_patch: Started
NOTE: recipe epiphany-45.2-r0: task do_fetch: Succeeded
NOTE: Running task 3013 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1661 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1662 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1663 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1664 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1666 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-45.2-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1670 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1671 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1673 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe epiphany-45.2-r0: task do_unpack: Succeeded
NOTE: Running task 3022 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3023 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1678 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1680 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1681 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_patch: Succeeded
NOTE: Running task 3047 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3048 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 213696760b682e7a7c495f308f977c422ae8564dfd6b0a6352679ce4b182724f to hashserv.yocto.io:8686 ({'taskhash': 'e8f7d7832ae2d86fad1b9ebb6b6000244d2f57ce88fa925a951a94493a06373e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '213696760b682e7a7c495f308f977c422ae8564dfd6b0a6352679ce4b182724f'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed e8f7d7832ae2d86fad1b9ebb6b6000244d2f57ce88fa925a951a94493a06373e -> 213696760b682e7a7c495f308f977c422ae8564dfd6b0a6352679ce4b182724f as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe epiphany-45.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-45.2-r0: task do_populate_lic: Started
NOTE: recipe epiphany-45.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_populate_lic unihash changed to a34a158105b44d3fc5de398f9b2a01f1a3fb6c8fa8f20c4592a79d8460f4594b
NOTE: recipe epiphany-45.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1684 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1686 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 3061 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_patch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1687 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1689 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe webkitgtk-2.42.2-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3075 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1691 of 1691 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 3076 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_generate_toolchain_file)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe webkitgtk-2.42.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3451 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3464 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3469 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3487 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3505 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3532 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3627 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3640 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3786 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: Running task 3816 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3827 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata)
NOTE: recipe mesa-2_23.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3848 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3865 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3902 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3903 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe libxmlb-0.3.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3960 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3975 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3984 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3999 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: Running task 4018 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe xz-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4022 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4039 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4040 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4041 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: Running task 4042 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4047 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_configure: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4048 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_configure)
NOTE: Running task 4049 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4050 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4051 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4059 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4060 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure)
NOTE: Running task 4069 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_23.3.2-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: Running task 4070 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4071 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4073 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Started
NOTE: recipe enchant2-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4074 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_configure)
NOTE: recipe mesa-2_23.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4076 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe enchant2-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4077 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_configure)
NOTE: recipe enchant2-2.6.4-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4079 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_configure)
NOTE: recipe libsecret-0.21.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 4080 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4081 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 4082 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_configure: Succeeded
NOTE: Running task 4083 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Succeeded
NOTE: Running task 4084 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: Running task 4085 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 4086 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: recipe libxmlb-0.3.14-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4087 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4088 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile)
NOTE: recipe libxmlb-0.3.14-r0: task do_compile: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4089 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 4101 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 4102 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_compile)
NOTE: recipe libsecret-0.21.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4107 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Succeeded
NOTE: Running task 4108 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_compile)
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4109 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4111 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4112 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 4113 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_configure: Succeeded
NOTE: Running task 4114 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_configure_ptest_base)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4115 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4116 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: Running task 4117 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 4118 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4119 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4120 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4121 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 4122 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.14-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: Running task 4123 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_compile_ptest_base)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 4124 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.14-r0: task do_compile_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4125 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libxmlb-0.3.14-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 4126 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 4c240bca458b1a6275e63788ebeda6e3735ec170d96b15864adac250eb8e2247
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 4127 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: Running task 4128 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: Running task 4129 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install)
NOTE: Running task 4135 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Succeeded
NOTE: Running task 4136 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4137 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe mesa-2_23.3.2-r0: task do_configure: Succeeded
NOTE: Running task 4138 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: Running task 4139 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.14-r0: task do_install: Succeeded
NOTE: Running task 4140 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe mesa-2_23.3.2-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4141 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_install_ptest_base)
NOTE: recipe libxmlb-0.3.14-r0: task do_install_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4142 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_configure)
NOTE: recipe json-glib-1.8.0-r0: task do_install: Succeeded
NOTE: Running task 4143 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.14-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 4144 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: Running task 4145 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_install)
NOTE: Running task 4146 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4147 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_package)
NOTE: recipe libxmlb-0.3.14-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to 4cc7b5f50299033b37b60dc58d2171ad2cacc68db16ac2686c74c5c0c6d358fc
NOTE: Setscene tasks completed
NOTE: Running task 4148 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: Running task 4149 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: recipe libxmlb-0.3.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4150 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: recipe appstream-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 4158 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4165 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install_ptest_base)
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4176 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_package)
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_package: Started
NOTE: Running task 4177 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4178 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe appstream-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4179 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 4180 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: Running task 4181 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4182 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to b9b8f21ea09974dc7010b96f71606a53ff7195ea0f1cb11c76676fe8bd332088
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4183 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_compile)
NOTE: Running task 4199 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_package)
NOTE: Running task 4204 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4206 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4215 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 4216 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: Running task 4217 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 4218 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: Running task 4219 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4220 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_package: Succeeded
NOTE: Running task 4221 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_install: Succeeded
NOTE: Running task 4222 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 4223 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.14-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 4224 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 974700ede45f6ba24bbc5dbc93509279c8e8807fe2df3005723894d0ffb38044
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: Running task 4225 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libxmlb-0.3.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_packagedata unihash changed to f524942aad854aa6489c5746c6c3f03277a350a0d68f6d9a9144b12748a3f21b
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe appstream-1.0.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4226 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4227 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4228 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: Running task 4229 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe appstream-1.0.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4246 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 4247 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4248 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_populate_sysroot: Started
NOTE: Running task 4249 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata)
NOTE: recipe libsecret-0.21.1-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata: Started
NOTE: Running task 4250 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_packagedata)
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4269 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata unihash changed to 235be16ff058e1c8ce1bed2660000bdbc072f62a7a76de10b34becfe8b1e3588
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Running task 4270 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_packagedata unihash changed to 21d3719993a2f3f948cfdf9282b9f192e99bdec1e99de983df04c3b894bb1e13
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata unihash changed to 3af2118c3a0c5c314b3d3c2ca0351ff2ba3e0e1abbf69f85c42c66d4f7e5b89c
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 353a8cde85d2d6588c946c83dd20e56722a6458d8007a2eae7b5bf79867d6310
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_compile: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4271 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: Running task 4272 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_compile_ptest_base)
NOTE: Running task 4273 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: Running task 4274 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: Running task 4275 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: Running task 4276 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: Running task 4277 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_compile_ptest_base: Started
NOTE: Running task 4278 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: Running task 4279 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: Running task 4280 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4281 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_install)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_packagedata: Started
NOTE: Running task 4282 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: Running task 4284 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata unihash changed to d40286f7c4229a96b81fbfa8a6fde78072e9f63c061d4950811507eda6928064
NOTE: recipe bluez5-5.71-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.71-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4285 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4286 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_packagedata unihash changed to 0332d5a7bc63e4b130abad80846ee372262b4194529bcc6a35d60abcc3e255ce
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.71-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata unihash changed to 50b9995ca826c7a84118d34423444fc350146b7688aaf7a1793e2d843840fef8
NOTE: Setscene tasks completed
NOTE: Running task 4287 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: Running task 4292 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: Running task 4312 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: Running task 4313 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: Running task 4331 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_collect_spdx_deps)
NOTE: Running task 4342 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_collect_spdx_deps)
NOTE: Running task 4348 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4349 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4350 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4351 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe enchant2-2.6.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4352 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_install_ptest_base)
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxmlb-0.3.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4353 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 4354 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 4355 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 4356 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: Running task 4357 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: Running task 4358 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_install_ptest_base: Started
NOTE: Running task 4360 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4369 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: Running task 4370 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_create_spdx: Started
NOTE: recipe libsecret-0.21.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4371 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_package)
NOTE: Running task 4372 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4373 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: Running task 4374 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_create_spdx)
NOTE: Running task 4377 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4378 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_ipk)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: Running task 4379 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.71-r0: task do_create_spdx: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Started
NOTE: Running task 4380 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_deb)
NOTE: Running task 4381 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_rpm)
NOTE: Running task 4382 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_ipk)
NOTE: recipe appstream-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4383 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_deb)
NOTE: recipe appstream-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4384 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4385 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_deb: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.1-r0: task do_create_spdx: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4386 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe appstream-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 4387 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_install)
NOTE: recipe appstream-1.0.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_ipk unihash changed to 13fcab0eb9de5723940be4384f3b4c4e91d97646e0d9d72f0c98c730d9badb7e
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_deb unihash changed to 61ca4f6ea6ea96547d8f78e5db5c14ac779316279aa8cb45bee6124fab66fa5b
NOTE: recipe appstream-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 4388 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_populate_sysroot)
NOTE: Running task 4389 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_package)
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_populate_sysroot: Started
NOTE: Running task 4390 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe appstream-1.0.0-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata unihash changed to aa0b5e1224c5372d4bde3fd1f8b88cbb95386262e91141b17bc36c2bd7933044
NOTE: recipe appstream-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4391 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: Running task 4392 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 4393 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_compile)
NOTE: recipe enchant2-2.6.4-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_ipk unihash changed to 4fd8e8a53edbeb0e30ed814935a18e6d9d6c268c7567a23ec3f52c95b8d84d56
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_rpm unihash changed to 7529f68fb032aabfec4c62f210fd9e9d43021c050fd90664fb57ca22ee7b06d1
NOTE: recipe appstream-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 4394 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_packagedata)
NOTE: recipe appstream-1.0.0-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_packagedata unihash changed to 918a5157345f59a664f21bdc36f860f6e745787852c319d3f4156128bc23ba5a
NOTE: Setscene tasks completed
NOTE: Running task 4395 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_create_spdx)
NOTE: recipe appstream-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 4396 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe appstream-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 4397 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe enchant2-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 4398 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_package: Succeeded
NOTE: Running task 4399 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_packagedata)
NOTE: recipe enchant2-2.6.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_packagedata unihash changed to b32d4dd5e0b578421a7f9b2a2ca512ab029b168f0a0448aea028d337ab4f2dda
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: recipe enchant2-2.6.4-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata unihash changed to 6f0c733a6f5f59bc078c7b61f5c36a15f79ae58a0a0a5bb7d4ff5157bf9e5115
NOTE: Setscene tasks completed
NOTE: Running task 4400 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: Running task 4401 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_populate_sysroot)
NOTE: Running task 4402 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 4403 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_package)
NOTE: Running task 4404 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: Running task 4405 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_create_spdx)
NOTE: recipe enchant2-2.6.4-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.6.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe enchant2-2.6.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4406 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 4407 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 4408 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_packagedata)
NOTE: recipe enchant2-2.6.4-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to fd2dc21d0142947463a9e75881dfc0a95a469ced23bf6ebc6b7cda9c5c2e1fde
NOTE: recipe enchant2-2.6.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_packagedata unihash changed to 840737e7a2ef546bdc2d46cb95d43d303010f7aee61b4dfcb0fa91a2b1d2e2e8
NOTE: Running task 4409 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_deb: Succeeded
NOTE: Running task 4410 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_deb unihash changed to a7e73530bde374e4f3a6121d50cf630d5c5fcd55f17fa5154f0757d571c49076
NOTE: Setscene tasks completed
NOTE: recipe enchant2-2.6.4-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.6.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_rpm unihash changed to 634ca418f125e91a50216da34b578fc015aa801b4663982e64fcc5e3b8c81a51
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Succeeded
NOTE: Running task 4411 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_install)
NOTE: recipe harfbuzz-8.3.0-r0: task do_install: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_install: Succeeded
NOTE: Running task 4412 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_populate_sysroot)
NOTE: Running task 4413 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_package)
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_package: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4414 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4415 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure)
NOTE: recipe pango-1.51.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_package: Succeeded
NOTE: Running task 4416 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata unihash changed to 07fea3f48fab29c29c954ac22bd6b61ce972f0edb64d0bfa0ee2c1bacf293170
NOTE: Setscene tasks completed
NOTE: Running task 4417 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.3.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.51.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4418 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4419 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile)
NOTE: recipe pango-1.51.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4420 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_compile: Succeeded
NOTE: Running task 4421 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4422 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_install)
NOTE: recipe pango-1.51.0-r0: task do_install: Started
NOTE: recipe pango-1.51.0-r0: task do_install: Succeeded
NOTE: Running task 4423 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_install_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4424 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot)
NOTE: Running task 4425 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_package)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_package: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4426 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4427 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 4428 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe pango-1.51.0-r0: task do_package: Succeeded
NOTE: Running task 4429 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata)
NOTE: recipe pango-1.51.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata unihash changed to 08949b1772bac70f833ff00a2e89ceb97ec8a4d48199e92057ab4ae4d187773d
NOTE: Setscene tasks completed
NOTE: Running task 4430 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx)
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4431 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4432 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_compile: Succeeded
NOTE: Running task 4433 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_install)
NOTE: recipe mesa-2_23.3.2-r0: task do_install: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_install: Succeeded
NOTE: Running task 4434 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_populate_sysroot)
NOTE: Running task 4435 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_package)
NOTE: recipe mesa-2_23.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_package: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4436 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4437 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4438 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4439 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4440 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4441 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libwpe-1.14.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 4442 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_compile)
NOTE: recipe libwpe-1.14.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 4443 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_install)
NOTE: recipe libwpe-1.14.1-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 4444 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 4445 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libwpe-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 4446 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4447 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 4448 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4449 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4450 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_configure: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_package: Succeeded
NOTE: Running task 4451 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_packagedata)
NOTE: recipe mesa-2_23.3.2-r0: task do_packagedata: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_packagedata unihash changed to ce4c8d8f5b85635f51eed48ce21476b615ddc1f6ab06942b675d95a5a759ab39
NOTE: Setscene tasks completed
NOTE: Running task 4452 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: Running task 4453 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.2.bb:do_create_spdx)
NOTE: Running task 4454 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe mesa-2_23.3.2-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.14.1-r0: task do_package: Started
NOTE: recipe libwpe-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 4455 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_packagedata)
NOTE: recipe libwpe-1.14.1-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4456 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 4457 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libwpe-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_packagedata unihash changed to 1747f975d6299cf1578ad1a1b1ec047f5d941326de6aaf0a366c3b50c8dc6ab0
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to c2f52c3b22e2ba13f3d25eb3529da632624df08359a6c524a793a943de11f06c
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_configure: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4458 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 4459 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_compile)
NOTE: Running task 4460 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4461 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4462 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4463 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_configure)
NOTE: recipe mesa-2_23.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4464 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 4465 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Started
NOTE: Running task 4466 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4467 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.14.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4468 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 4469 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_create_spdx)
NOTE: Running task 4470 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.14.1-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to 55af2504360e414f25b6aa9c32663ce5f53165bee0becf7d88545412db71d0d5
NOTE: recipe libwpe-1.14.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4471 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: Running task 4472 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4473 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4474 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: Running task 4475 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 4476 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 4477 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 4478 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_package)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4479 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_compile)
NOTE: recipe gtk+3-3.24.38-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 4480 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata unihash changed to 396f0fe8c29d87a0ee2c7cd42f1fd0b172a0f762ccc4fdb87b5e57c688ad5065
NOTE: Setscene tasks completed
NOTE: Running task 4481 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_create_spdx)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_compile: Succeeded
NOTE: Running task 4482 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_install: Succeeded
NOTE: Running task 4483 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_populate_sysroot)
NOTE: Running task 4484 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 4485 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 4486 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 4487 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_package: Succeeded
NOTE: Running task 4488 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4489 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_packagedata unihash changed to 7eac94a2c58003afc486f589b34f2c2af1038386f4f8f77007cac3a5e49d6289
NOTE: Setscene tasks completed
NOTE: Running task 4490 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4491 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 4492 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata unihash changed to d496207b5dd01da801638d9702d54b4b9fcc49f67b595e3010e19d4cb5ab3e50
NOTE: Setscene tasks completed
NOTE: Running task 4493 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4494 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4495 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_compile: Succeeded
NOTE: Running task 4496 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_install)
NOTE: recipe gtk+3-3.24.38-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_install: Succeeded
NOTE: Running task 4497 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot)
NOTE: Running task 4498 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_package)
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4499 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4500 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4505 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4506 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.8.2-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.2-r0: task do_configure: Succeeded
NOTE: Running task 4507 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_compile)
NOTE: recipe libhandy-1.8.2-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 4508 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package: Succeeded
NOTE: Running task 4509 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata unihash changed to 4a54724b6462103aaf23763e5f75d90ef2e96b4e509f907c748f819f79e12fe4
NOTE: Setscene tasks completed
NOTE: Running task 4510 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_compile: Succeeded
NOTE: Running task 4516 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_install: Succeeded
NOTE: Running task 4517 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_populate_sysroot)
NOTE: Running task 4518 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 4519 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_collect_spdx_deps)
NOTE: Running task 4520 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4521 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.2-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4524 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_install)
NOTE: recipe libhandy-1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_install: Started
NOTE: recipe gtk4-4.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4525 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_configure)
NOTE: recipe gtk4-4.12.4-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.2-r0: task do_install: Succeeded
NOTE: Running task 4526 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_package)
NOTE: Running task 4527 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_populate_sysroot)
NOTE: recipe libhandy-1.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.8.2-r0: task do_package: Started
NOTE: recipe libhandy-1.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4528 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 4529 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: Running task 4530 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.8.2-r0: task do_package: Succeeded
NOTE: Running task 4531 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.8.2-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_packagedata unihash changed to 45b07068e62548221933f0795e39e281139bd223a83d369146cf284051b49a79
NOTE: Setscene tasks completed
NOTE: Running task 4532 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_create_spdx)
NOTE: recipe libhandy-1.8.2-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_configure: Succeeded
NOTE: Running task 4533 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_compile)
NOTE: recipe gtk4-4.12.4-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 4534 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata unihash changed to e2461aa94ca6195c77ef271a01f8bb24b1c7d42cf86ae8d755be91cdf10a74e4
NOTE: Setscene tasks completed
NOTE: Running task 4535 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_create_spdx)
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_package: Succeeded
NOTE: Running task 4536 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_packagedata unihash changed to 2677018fdc634e1c46deda3683621195d24c22927eef0f99b49e11769c0420ae
NOTE: Setscene tasks completed
NOTE: Running task 4537 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 4538 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4539 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_install)
NOTE: recipe gtk4-4.12.4-r0: task do_install: Started
NOTE: recipe gtk4-4.12.4-r0: task do_install: Succeeded
NOTE: Running task 4540 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_populate_sysroot)
NOTE: Running task 4541 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_package)
NOTE: recipe gtk4-4.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.12.4-r0: task do_package: Started
NOTE: recipe gtk4-4.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4542 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4543 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4544 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4545 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-4.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4546 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_configure)
NOTE: recipe libadwaita-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4547 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_configure)
NOTE: Running task 4548 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_configure)
NOTE: recipe libportal-0.7.1-r0: task do_configure: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_configure: Started
NOTE: recipe gcr-4.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4549 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_configure)
NOTE: recipe gcr-4.1.0-r0: task do_configure: Started
NOTE: recipe libportal-0.7.1-r0: task do_configure: Succeeded
NOTE: Running task 4550 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_compile)
NOTE: recipe libportal-0.7.1-r0: task do_compile: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 4551 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_compile)
NOTE: recipe gcr-4.1.0-r0: task do_configure: Succeeded
NOTE: Running task 4552 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_compile)
NOTE: recipe libadwaita-1.4.2-r0: task do_compile: Started
NOTE: recipe gcr-4.1.0-r0: task do_compile: Started
NOTE: recipe gtk4-4.12.4-r0: task do_package: Succeeded
NOTE: Running task 4553 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_packagedata)
NOTE: recipe gtk4-4.12.4-r0: task do_packagedata: Started
NOTE: recipe gcr-4.1.0-r0: task do_compile: Succeeded
NOTE: Running task 4554 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_install)
NOTE: recipe gtk4-4.12.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_packagedata unihash changed to 5f5b08b0c5e5c417b52ab3e56da20aa77497e97cb295d545bdb05fc774a9645f
NOTE: recipe gcr-4.1.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 4555 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_create_spdx)
NOTE: recipe gtk4-4.12.4-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.1.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4556 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_package)
NOTE: Running task 4557 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_populate_sysroot)
NOTE: recipe gcr-4.1.0-r0: task do_package: Started
NOTE: recipe gcr-4.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4558 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_install)
NOTE: recipe libportal-0.7.1-r0: task do_install: Started
NOTE: recipe gcr-4.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_install: Succeeded
NOTE: Running task 4559 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_package)
NOTE: Running task 4560 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot)
NOTE: recipe libportal-0.7.1-r0: task do_package: Started
NOTE: recipe libportal-0.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.12.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4561 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_collect_spdx_deps)
NOTE: Running task 4562 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_collect_spdx_deps)
NOTE: Running task 4563 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_collect_spdx_deps)
NOTE: recipe webkitgtk-2.42.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4564 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.4.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcr-4.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4565 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_install)
NOTE: recipe libadwaita-1.4.2-r0: task do_install: Started
NOTE: recipe libportal-0.7.1-r0: task do_package: Succeeded
NOTE: Running task 4566 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_packagedata)
NOTE: recipe libportal-0.7.1-r0: task do_packagedata: Started
NOTE: recipe libportal-0.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_packagedata unihash changed to bcd1d7be71280222e236dfdc47d37cb1a15d97e983abdf06bd01f6af5bd6d524
NOTE: Setscene tasks completed
NOTE: Running task 4567 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_create_spdx)
NOTE: recipe libadwaita-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 4568 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_package)
NOTE: Running task 4569 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_populate_sysroot)
NOTE: recipe libportal-0.7.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_package: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-4.1.0-r0: task do_package: Succeeded
NOTE: Running task 4570 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_packagedata)
NOTE: recipe gcr-4.1.0-r0: task do_packagedata: Started
NOTE: recipe libportal-0.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-4.1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_packagedata unihash changed to a7962d05ba5e9f50d98024756ea4f8b998949b016e3a6987fcfb93a62b96c6f8
NOTE: Setscene tasks completed
NOTE: Running task 4571 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_create_spdx)
NOTE: recipe gcr-4.1.0-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 4572 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_packagedata)
NOTE: recipe libadwaita-1.4.2-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_packagedata unihash changed to d148d8de4eba5721b7acb64a078179ca8f15be8a2cd0dd6152cadd16b89f5382
NOTE: Setscene tasks completed
NOTE: Running task 4573 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb:do_create_spdx)
NOTE: recipe libadwaita-1.4.2-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4574 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_compile)
NOTE: recipe webkitgtk-2.42.2-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_compile
NOTE: recipe webkitgtk-2.42.2-r0: task do_compile: Succeeded
NOTE: Running task 4575 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_install)
NOTE: recipe webkitgtk-2.42.2-r0: task do_install: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_install: Succeeded
NOTE: Running task 4576 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_package)
NOTE: Running task 4577 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.42.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4578 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-45.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-45.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4579 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_configure)
NOTE: recipe epiphany-45.2-r0: task do_configure: Started
NOTE: recipe epiphany-45.2-r0: task do_configure: Succeeded
NOTE: Running task 4580 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_compile)
NOTE: recipe epiphany-45.2-r0: task do_compile: Started
NOTE: recipe epiphany-45.2-r0: task do_compile: Succeeded
NOTE: Running task 4581 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_install)
NOTE: recipe epiphany-45.2-r0: task do_install: Started
NOTE: recipe epiphany-45.2-r0: task do_install: Succeeded
NOTE: Running task 4582 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_populate_sysroot)
NOTE: recipe epiphany-45.2-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-45.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_package: Succeeded
NOTE: Running task 4583 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_packagedata)
NOTE: recipe webkitgtk-2.42.2-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_packagedata unihash changed to 48c662c0ebf629465c49a21239e12c216262b64db309fac0e48116c757084e81
NOTE: Setscene tasks completed
NOTE: Running task 4584 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_package)
NOTE: Running task 4585 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_create_spdx)
NOTE: recipe epiphany-45.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_create_spdx: Started
NOTE: recipe epiphany-45.2-r0: task do_package: Succeeded
NOTE: Running task 4586 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_packagedata)
NOTE: recipe epiphany-45.2-r0: task do_packagedata: Started
NOTE: recipe epiphany-45.2-r0: task do_packagedata: Succeeded
NOTE: Running task 4587 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_package_write_ipk)
NOTE: Running task 4588 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_package_write_deb)
NOTE: Running task 4589 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_package_write_rpm)
NOTE: recipe epiphany-45.2-r0: task do_package_write_ipk: Started
NOTE: Running task 4590 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_package_qa)
NOTE: recipe epiphany-45.2-r0: task do_package_write_deb: Started
NOTE: recipe epiphany-45.2-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-45.2-r0: task do_package_qa: Started
NOTE: recipe epiphany-45.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4591 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-45.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-45.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4592 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_create_spdx)
NOTE: recipe epiphany-45.2-r0: task do_create_spdx: Started
NOTE: recipe epiphany-45.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe epiphany-45.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4593 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_create_runtime_spdx)
NOTE: recipe epiphany-45.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe epiphany-45.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 4594 of 4594 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.2.bb:do_build)
NOTE: Tasks Summary: Attempted 4594 tasks of which 4066 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 50 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2064087923001895357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 62073 to 76452 (+23%)

--===============2064087923001895357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 6308784 to 6308752 (-0%)
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
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 81504 to 82021 (+1%)
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
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 62073 to 76452 (+23%)
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
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4546916 to 4546884 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2091848 to 2092064 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany: PV changed from "45.1" to "45.2"
packages/core2-64-poky-linux/epiphany: PKGV changed from 45.1 [default] to 45.2 [default]
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/45/epiphany-45.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/45/epiphany-45.2.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"

--===============2064087923001895357==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-45.1-45.2.patch"

RnJvbSA1MTM0NWVkZTgyNGEwYTJiMjgzY2FkODEwZTY1NzcyMGNlZjZhYTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTE6NTE6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0NS4xIC0+IDQ1LjIKCi0tLQogLi4uL3tlcGlwaGFueV80NS4xLmJi
ID0+IGVwaXBoYW55XzQ1LjIuYmJ9ICAgIHwgIDIgKy0KIC4uLi1tZXNvbi5idWlsZC1kaXNhYmxl
LXRoZS11c2Utb2YteWVscC5wYXRjaCB8ICAyICstCiAuLi4vZXBpcGhhbnkvZmlsZXMvZGlzdHJp
YnV0b3IucGF0Y2ggICAgICAgICAgfCAxOCArKysrKysrKysrKysrLS0tLS0KIC4uLi9lcGlwaGFu
eS9maWxlcy9taWdyYXRvci5wYXRjaCAgICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrLS0t
LS0KIDQgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80NS4xLmJiID0+IGVw
aXBoYW55XzQ1LjIuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2VwaXBoYW55XzQ1LjEuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBp
cGhhbnlfNDUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ1LjIuYmIKaW5kZXggYzg2MzFlMDVlOS4uODljZTlk
YzY2OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ1
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ1LjIuYmIK
QEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8k
e0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmls
ZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNo
IFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiN2M5OTRlZjM0
ZWNkNjBlOTE1ZGUzMzFlZTEyM2MwODkzOGY5NjIzY2VmYWRhNmQ1MGI5OWUzYzljNWFkODEzNSIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjc5YzcxNDYwYmZmZWZjY2VmNWU2N2JlM2Zi
NWZjYTY1Nzg1M2U4MjE2Y2I2MjYzOTlkMmI5NTBjZTAzMjBkZGMiCiAKICMgRGV2ZWxvcGVyIG1v
ZGUgZW5hYmxlcyBkZWJ1Z2dpbmcKIFBBQ0tBR0VDT05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1E
ZGV2ZWxvcGVyX21vZGU9dHJ1ZSwtRGRldmVsb3Blcl9tb2RlPWZhbHNlIgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1k
aXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFu
eS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0
Y2gKaW5kZXggYTZjNGY5MmM4Ni4uMTQ4NjkyMjIxMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11
c2Utb2YteWVscC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMv
MDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA3N2M5Zjg3ZGMyYjNhZDA4NTRhNjc4ZTIzNGUyMmRmYjMxOTAyYjgy
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMjgzNTJhM2U0M2I4ZmQ1N2Q4ZGI2ZmI5
MzVmNjdhZDJiMzBmMDEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMxIEphbiAyMDE4
IDE1OjUwOjM4ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGhlbHAvbWVzb24uYnVpbGQ6IGRpc2Fi
bGUgdGhlIHVzZSBvZiB5ZWxwCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKaW5kZXggYjA5YzliMzhkMi4uNWQzMTAzODliYyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5w
YXRjaApAQCAtMSwxMiArMSwyMCBAQAotRG9uJ3QgZW5jb2RlIHRoZSBkaXN0cm8gZnJvbSAvZXRj
L29zLXJlbGVhc2UgaW50byB0aGUgYmluYXJpZXMuCitGcm9tIDA0YjA4NjhjMjBlODcxYjcxYzM2
MTUzNDQ4MjU1ZDAxZmJlZjNkY2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IEZy
aSwgMjYgRmViIDIwMjEgMTA6MTc6NTIgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gRG9uJ3QgZW5j
b2RlIHRoZSBkaXN0cm8gZnJvbSAvZXRjL29zLXJlbGVhc2UgaW50byB0aGUKKyBiaW5hcmllcy4K
IAogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiBSUCAyMDIxLzIvMjYKIAotSW5kZXg6IGVwaXBo
YW55LTMuMzguMi9tZXNvbi5idWlsZAotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIGVwaXBoYW55LTMuMzguMi5v
cmlnL21lc29uLmJ1aWxkCi0rKysgZXBpcGhhbnktMy4zOC4yL21lc29uLmJ1aWxkCistLS0KKyBt
ZXNvbi5idWlsZCB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZm
IC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAoraW5kZXggNjFlMmIzOS4uZWQzMTg2
YyAxMDA2NDQKKy0tLSBhL21lc29uLmJ1aWxkCisrKysgYi9tZXNvbi5idWlsZAogQEAgLTE1LDYg
KzE1LDcgQEAgaWYgci5yZXR1cm5jb2RlKCkgPT0gMAogIGVsc2UKICAgIGRpc3RyaWJ1dG9yX25h
bWUgPSAnR05PTUUgV2ViJwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2ZpbGVzL21pZ3JhdG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVz
L21pZ3JhdG9yLnBhdGNoCmluZGV4IGE5YTY1MGE2NGEuLjQ0NzM1YjEwYjggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKQEAgLTEsMyAr
MSw4IEBACitGcm9tIDRkNjE0M2I4OTM4ZDJhNGMxMWI0MDllODRiZjI3MGJjNWFmY2IzODYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IFRodSwgMjUgRmViIDIwMjEgMTQ6NTI6MzIg
KzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gZXBpcGhhbnk6IEZpeCByZXByb2R1Y2liaWxpdHkgaXNz
dWUKKwogV2UgZG9uJ3Qgd2FudCB0byBlbmNpZGUgQlVJTERfUk9PVCBpbnRvIHRhcmdldCBwYWNr
YWdlcy4gVGhpcyBpcyB1c2VkCiBmb3IgYnVpbGQgdGltZSB0ZXN0cyBidXQgaW4gb3VyIGNhc2Ug
dGhvc2Ugd291bGQgYmUgb24gdGFyZ2V0IGFueXdheQogZG8gdXNlIHRoZSB0YXJnZXQgcGF0aHMu
CkBAIC01LDExICsxMCwxNSBAQCBkbyB1c2UgdGhlIHRhcmdldCBwYXRocy4KIFVwc3RyZWFtLVN0
YXR1czogUGVuZGluZwogUlAgMjAyMS8yLzI1CiAKLUluZGV4OiBlcGlwaGFueS0zLjM4LjIvbGli
L2VwaHktcHJvZmlsZS11dGlscy5jCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gZXBpcGhhbnktMy4zOC4yLm9y
aWcvbGliL2VwaHktcHJvZmlsZS11dGlscy5jCi0rKysgZXBpcGhhbnktMy4zOC4yL2xpYi9lcGh5
LXByb2ZpbGUtdXRpbHMuYwotQEAgLTEzMCwxMCArMTMwLDEwIEBAIGVwaHlfcHJvZmlsZV91dGls
c19kb19taWdyYXRpb24gKGNvbnN0IGMKKy0tLQorIGxpYi9lcGh5LXByb2ZpbGUtdXRpbHMuYyB8
IDQgKystLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CisKK2RpZmYgLS1naXQgYS9saWIvZXBoeS1wcm9maWxlLXV0aWxzLmMgYi9saWIvZXBoeS1wcm9m
aWxlLXV0aWxzLmMKK2luZGV4IGEyZjYxODEuLjUyMTgwNzcgMTAwNjQ0CistLS0gYS9saWIvZXBo
eS1wcm9maWxlLXV0aWxzLmMKKysrKyBiL2xpYi9lcGh5LXByb2ZpbGUtdXRpbHMuYworQEAgLTEz
MCwxMCArMTMwLDEwIEBAIGVwaHlfcHJvZmlsZV91dGlsc19kb19taWdyYXRpb24gKGNvbnN0IGNo
YXIgKnByb2ZpbGVfZGlyZWN0b3J5LAogICAgYXJndltpKytdID0gTlVMTDsKICAKICAjaWYgREVW
RUxPUEVSX01PREUKLS0gCjIuNDIuMAoK

--===============2064087923001895357==--

