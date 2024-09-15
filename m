Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A969EC36008
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.115406.1726410841879955785
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Mr3/n7MJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uEFNHvav;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191f61adc6c-e39737f6-1a6b-4443-8c9d-6b4a8238883d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o9y/QOx6c9wVEhzX25Si1m7UCvSYSo06tfxnkpaSef0=;
	b=Mr3/n7MJx7lXTw++n+oacmb5Nt2aOsLo6VYy3Egk/7KA1+z884UjggHKPnJn9ryB
	1dqZWgzke64dbVfDDxHNfAwTd5C3+xWUK98dyLvGviymNk5+3+FBzSiz7YoYccpjvRs
	LGyJDgR/u3iYk+LFHanZ2wClqAEZyO3GN7W+PHUQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o9y/QOx6c9wVEhzX25Si1m7UCvSYSo06tfxnkpaSef0=;
	b=uEFNHvavq6NyCQgsda4S3KEyCNyVcS1XPuxPX11pn+PSeFK7DWlYmSc5MkogZgQ6
	JYehLvkNKmafijjJTKZWfvFtUtmYOnwzK5/MWd5vj6EIRHqd3jIbshet8CCGIKOxMjb
	eXE8JVLllPpc3QOY9cCxR0DP5FzKyRwWXqzn2Q4Q=
Content-Type: multipart/mixed; boundary="===============5454753980329531113=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.82.0 FAILED
Message-ID: <01010191f61adc6c-e39737f6-1a6b-4443-8c9d-6b4a8238883d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204566

--===============5454753980329531113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gobject-introspection* to *1.82.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.80.1-1.82.0.patch
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
From 5ef9780029273885f073bee280ba8004827357ea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 11:03:47 +0000
Subject: [PATCH] gobject-introspection: upgrade 1.80.1 -> 1.82.0

---
 ...01-Relocate-the-repository-directory-for-native-builds.patch | 2 +-
 ...-introspection_1.80.1.bb => gobject-introspection_1.82.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.80.1.bb => gobject-introspection_1.82.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 510bc426d1..c3581c32cb 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 4e1aa0ddbc43403ff24f644b4c4912b737290c41 Mon Sep 17 00:00:00 2001
+From f2ab0b3ced6ad297d76e0a010495c0d1a2d329e1 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb
index e161f3ca2d..15032520bb 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "a1df7c424e15bda1ab639c00e9051b9adf5cea1a9e512f8a603b53cd199bc6d8"
+SRC_URI[sha256sum] = "0f5a4c1908424bf26bc41e9361168c363685080fbdb87a196c891c8401ca2f09"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.44.0


--===============5454753980329531113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1868 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-1fcb8524d8c9e4971981c73559e9b1235612a657"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1fcb8524d8c9e4971981c73559e9b1235612a657"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 366 Local 334 Mirrors 0 Missed 32 Current 513 (91% match, 96% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 5 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 531 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 709 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 870 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 871 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1196 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa)
NOTE: Running task 1259 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa)
NOTE: Running task 1261 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_fetch)
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1302 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_write_config)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1365 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_write_config)
NOTE: Running task 1369 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_write_config)
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_fetch: Succeeded
NOTE: Running task 1565 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 879 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_write_config: Started
NOTE: Running task 1661 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1786 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1901 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_fetch)
NOTE: Running task 1904 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_fetch)
NOTE: Running task 1943 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 2093 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 2134 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 2136 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2262 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_unpack)
NOTE: Running task 2270 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_fetch: Succeeded
NOTE: Running task 2321 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: Running task 2334 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 2335 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: Running task 2395 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2396 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_unpack: Succeeded
NOTE: Running task 2397 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 2398 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: Running task 2399 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Succeeded
NOTE: Running task 2400 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_unpack: Succeeded
NOTE: Running task 2402 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_patch)
NOTE: Running task 2403 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Succeeded
NOTE: Running task 2405 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2406 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2407 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_lic: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2408 of 2482 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_patch: Succeeded
NOTE: Running task 2409 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2413 of 2482 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_configure)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.5.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:nat
 ive:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'bison-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'perl-native', 'pkgconfig-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gtk-doc-native', 'gdbm-native', 'libffi-native', 'libpcre2-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgtk_doc=false -Ddoctool=disabled...
| The Meson build system
| Version: 1.5.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/gobject-introspection-1.82.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/build
| Build type: native build
| Project name: gobject-introspection
| Project version: 1.82.0
| C compiler for the host machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the host machine: gcc ld.bfd 2.42.0.20240216
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/recipe-sysroot-native/usr/bin/python3-native/python3)
| Program python3 (setuptools) found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/recipe-sysroot-native/usr/bin/python3-native/python3) modules: setuptools
| Compiler for C supports arguments -Warray-bounds: YES
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wduplicated-branches: YES
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wimplicit-function-declaration: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wjump-misses-init: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wnull-dereference: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpacked: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wrestrict: YES
| Compiler for C supports arguments -Wreturn-type: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wsign-compare: YES
| Compiler for C supports arguments -Wstrict-aliasing: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wunused-but-set-variable: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Checking for size of "char" : 1
| Checking for size of "short" : 2
| Checking for size of "int" : 4
| Checking for size of "long" : 8
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Dependency glib-2.0 found: NO. Found 2.80.4 but need: '>=2.82.0'
| Found CMake: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/recipe-sysroot-native/usr/bin/cmake (3.30.2)
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../gobject-introspection-1.82.0/meson.build:140:11: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/temp/run.do_configure.2524117:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/temp/run.do_configure.2524117, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/temp/run.do_configure.2524117, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/temp/run.do_configure.2524117, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/temp/run.do_configure.2524117, line 190
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2413 tasks of which 2379 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915110329.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915110329.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_configure
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/temp/log.do_configure.2524117
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gobject-introspection-native-1.82.0-r0 do_configure: meson failed
ERROR: gobject-introspection-native-1.82.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/temp/run.do_configure.2524117' failed with exit code 1
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.82.0/temp/log.do_configure.2524117
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_configure) failed with exit code '1'

--===============5454753980329531113==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.80.1-1.82.0.patch"

RnJvbSA1ZWY5NzgwMDI5MjczODg1ZjA3M2JlZTI4MGJhODAwNDgyNzM1N2VhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTE6MDM6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
b2JqZWN0LWludHJvc3BlY3Rpb246IHVwZ3JhZGUgMS44MC4xIC0+IDEuODIuMAoKLS0tCiAuLi4w
MS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0
Y2ggfCAyICstCiAuLi4taW50cm9zcGVjdGlvbl8xLjgwLjEuYmIgPT4gZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uXzEuODIuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRy
b3NwZWN0aW9uL3tnb2JqZWN0LWludHJvc3BlY3Rpb25fMS44MC4xLmJiID0+IGdvYmplY3QtaW50
cm9zcGVjdGlvbl8xLjgyLjAuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb24vMDAwMS1SZWxv
Y2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVj
dGlvbi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1
aWxkcy5wYXRjaAppbmRleCA1MTBiYzQyNmQxLi5jMzU4MWMzMmNiIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3QtaW50cm9zcGVjdGlv
bi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9yeS1mb3ItbmF0aXZlLWJ1aWxk
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dv
YmplY3QtaW50cm9zcGVjdGlvbi8wMDAxLVJlbG9jYXRlLXRoZS1yZXBvc2l0b3J5LWRpcmVjdG9y
eS1mb3ItbmF0aXZlLWJ1aWxkcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGUxYWEwZGRi
YzQzNDAzZmYyNGY2NDRiNGM0OTEyYjczNzI5MGM0MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZjJhYjBiM2NlZDZhZDI5N2Q3NmUwYTAxMDQ5NWMwZDFhMmQzMjllMSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFNhc2NoYSBTaWxiZSA8eC15bzE3QHNlLXNpbGJlLmRlPgog
RGF0ZTogRnJpLCA4IEp1biAyMDE4IDEzOjU1OjEwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJl
bG9jYXRlIHRoZSByZXBvc2l0b3J5IGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWlu
dHJvc3BlY3Rpb25fMS44MC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9z
cGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS44Mi4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24v
Z29iamVjdC1pbnRyb3NwZWN0aW9uXzEuODAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS44Mi4wLmJi
CmluZGV4IGUxNjFmM2NhMmQuLjE1MDMyNTIwYmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
bm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uXzEuODAuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3Qt
aW50cm9zcGVjdGlvbl8xLjgyLjAuYmIKQEAgLTE2LDcgKzE2LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YzQzNGU4MTI4YTY4YmVkZDU5YjgwYjJhYzFlYjFjNGEg
XAogU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtCUE59LyR7QG9lLnV0aWxzLnRyaW1fdmVy
c2lvbigiJHtQVn0iLCAyKX0vJHtCUE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImExZGY3YzQyNGUxNWJkYTFhYjYzOWMwMGU5MDUxYjlhZGY1
Y2VhMWE5ZTUxMmY4YTYwM2I1M2NkMTk5YmM2ZDgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGY1
YTRjMTkwODQyNGJmMjZiYzQxZTkzNjExNjhjMzYzNjg1MDgwZmJkYjg3YTE5NmM4OTFjODQwMWNh
MmYwOSIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vMDAwMS1SZWxv
Y2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2giCiAK
LS0gCjIuNDQuMAoK

--===============5454753980329531113==--

