Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD2FC27C6D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1279.1715794338300107721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ROiJ7nxb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NoB2Alz0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f7d4fe6d1-46ad2f27-9e96-4d0a-915f-a4e3efa6f11e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jzf6Mp4T/3qyYOYyE6wz2U8NgrKVuGKQQdgz2aUS9HA=;
	b=ROiJ7nxbQbLVMPZtWG2CWddngYdebX9hDRxGCrIDYicO29qUkssYun/2q39Sz6eP
	f8CmP3HAcm8LFzhm9oKQF/M0+R1YU0VwoRxBRRrRs/SwIjMr5iVYTxGzTy+bAiT/E1Y
	smOLXM/24ga37O7aBg500w1BD3iyTFfKyea74lTI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jzf6Mp4T/3qyYOYyE6wz2U8NgrKVuGKQQdgz2aUS9HA=;
	b=NoB2Alz0ihFWN2b3ti41EAZZQnx3Xn1tSgD6jkY7zg5dSH22KzETbWHxMLpVkD6q
	K85+2TAikgDBZWzkzgbca6B80wC2TVnXgkSv1DBVWVBxLB2l1+Uv5n3l9vYLfhkSBw0
	DHLBS2ZrL341qqLMeLLa2qGqPA/cDEWSmq+STiA0=
Content-Type: multipart/mixed; boundary="===============4438121786927868505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.0.3 SUCCEEDED
Message-ID: <0101018f7d4fe6d1-46ad2f27-9e96-4d0a-915f-a4e3efa6f11e-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199371

--===============4438121786927868505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *appstream* to *1.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.0.2-1.0.3.patch
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
From b4570d04a5e2d8601e025fa340bf25ad5e88b53c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 16:05:57 +0000
Subject: [PATCH] appstream: upgrade 1.0.2 -> 1.0.3

---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 .../appstream/{appstream_1.0.2.bb => appstream_1.0.3.bb}    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.2.bb => appstream_1.0.3.bb} (93%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index bc811d67b0..7a21366d54 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From fe9ebb8c0fa7b84a9c5c667386b8fbb3baea2fad Mon Sep 17 00:00:00 2001
+From 418066f75a1b765d6cefff0e0b94120227833a47 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index fa171d5..79d5168 100644
+index 5f2eaa2..4a2483a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -185,10 +185,10 @@ endif
+@@ -191,10 +191,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream_1.0.2.bb b/meta/recipes-support/appstream/appstream_1.0.3.bb
similarity index 93%
rename from meta/recipes-support/appstream/appstream_1.0.2.bb
rename to meta/recipes-support/appstream/appstream_1.0.3.bb
index 7eb12a04c5..625e85a0ae 100644
--- a/meta/recipes-support/appstream/appstream_1.0.2.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.3.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
 	file://0001-remove-hardcoded-path.patch \
 "
-SRC_URI[sha256sum] = "1a5148ca97dcbf5eb6e9c380278bb0d20938569292ea8652df1b3cac8bd2736b"
+SRC_URI[sha256sum] = "5ab6f6cf644e7875a9508593962e56bb430f4e59ae0bf03be6be7029deb6baa4"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.44.0


--===============4438121786927868505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 57 recipes from the core2-64 sysroot...done.
Removing 58 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5a323ac7bb3d6208fcf3e9a746a6ad20e7cef832"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5a323ac7bb3d6208fcf3e9a746a6ad20e7cef832"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 367 Local 352 Mirrors 0 Missed 15 Current 302 (95% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 310 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 311 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 331 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 334 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 434 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 435 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 436 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_packagedata_setscene)
NOTE: recipe curl-8.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 761 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_write_config)
NOTE: recipe curl-8.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 859 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 897 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_write_config)
NOTE: recipe libxml2-2.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_write_config: Started
NOTE: Running setscene task 445 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 935 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_fetch)
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_write_config: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Started
NOTE: Running setscene task 452 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 459 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.18-r0: task do_fetch: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_recipe_qa_setscene)
NOTE: Running task 936 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 477 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 488 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 963 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 492 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxmlb-0.3.18-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_patch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 495 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: Running task 969 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 970 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_populate_lic)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 497 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_populate_lic: Started
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 501 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 509 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_populate_lic unihash changed to deaf1ef78748e4c7b900a7e3b6b4cc943db455b875b843ef8fc366e7947a666f
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_deploy_source_date_epoch unihash changed to 894d309d06c6e3a8eff88f5708e952dcba6e81ebceffae58de202c5908b1ff3a
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 504 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1140 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmlb-0.3.18-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 530 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 545 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 547 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 549 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 563 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 570 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 572 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 580 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 599 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 634 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 669 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1761 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1890 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1898 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_configure)
NOTE: recipe libxmlb-0.3.18-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.18-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1900 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_compile)
NOTE: recipe libxmlb-0.3.18-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_compile: Succeeded
NOTE: Running task 1901 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.18-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1902 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_install)
NOTE: recipe libxmlb-0.3.18-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_install: Succeeded
NOTE: Running task 1903 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_install_ptest_base)
NOTE: recipe libxmlb-0.3.18-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1904 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_package)
NOTE: Running task 1905 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.18-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1906 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_configure)
NOTE: recipe appstream-1.0.3-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.18-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1909 of 1922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_compile)
NOTE: recipe appstream-1.0.3-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.18-r0: task do_packagedata: Failed
NOTE: recipe appstream-1.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1909 tasks of which 1885 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515160504.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515160504.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb-src went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb-dbg went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb-ptest went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb-staticdev went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb-dev went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb-doc went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb-locale went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb-bin went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: QA Issue: Package version for package libxmlb went backwards which would break package feeds (from 0:0.3.19-r0 to 0:0.3.18-r0) [version-going-backwards]
ERROR: libxmlb-0.3.18-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxmlb/0.3.18/temp/log.do_packagedata.3698804
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.18.bb:do_packagedata) failed with exit code '1'

--===============4438121786927868505==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.0.2-1.0.3.patch"

RnJvbSBiNDU3MGQwNGE1ZTJkODYwMWUwMjVmYTM0MGJmMjVhZDVlODhiNTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTY6MDU6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHBzdHJlYW06IHVwZ3JhZGUgMS4wLjIgLT4gMS4wLjMKCi0tLQogLi4uL2FwcHN0cmVhbS9hcHBz
dHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4u
L2FwcHN0cmVhbS97YXBwc3RyZWFtXzEuMC4yLmJiID0+IGFwcHN0cmVhbV8xLjAuMy5iYn0gICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0ve2FwcHN0cmVhbV8xLjAuMi5i
YiA9PiBhcHBzdHJlYW1fMS4wLjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJlbW92ZS1oYXJkY29kZWQtcGF0aC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1v
dmUtaGFyZGNvZGVkLXBhdGgucGF0Y2gKaW5kZXggYmM4MTFkNjdiMC4uN2EyMTM2NmQ1NCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJl
bW92ZS1oYXJkY29kZWQtcGF0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBz
dHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBmZTllYmI4YzBmYTdiODRhOWM1YzY2NzM4NmI4ZmJiM2JhZWEyZmFkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MTgwNjZmNzVhMWI3NjVkNmNlZmZmMGUwYjk0
MTIwMjI3ODMzYTQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFya3VzIFZvbGsg
PGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTogTW9uLCAxMiBEZWMgMjAyMiAxNTo0Mjo0MiArMDEw
MAogU3ViamVjdDogW1BBVENIXSByZW1vdmUgaGFyZGNvZGVkIHBhdGgKQEAgLTE0LDEwICsxNCwx
MCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLXNwZWNpZmljXQogIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQg
YS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBmYTE3MWQ1Li43OWQ1MTY4IDEwMDY0
NAoraW5kZXggNWYyZWFhMi4uNGEyNDgzYSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysg
Yi9tZXNvbi5idWlsZAotQEAgLTE4NSwxMCArMTg1LDEwIEBAIGVuZGlmCitAQCAtMTkxLDEwICsx
OTEsMTAgQEAgZW5kaWYKICBzdGVtbWVyX2luY19kaXJzID0gaW5jbHVkZV9kaXJlY3Rvcmllcygp
CiAgaWYgZ2V0X29wdGlvbignc3RlbW1pbmcnKQogICAgICBzdGVtbWVyX2xpYiA9IGNjLmZpbmRf
bGlicmFyeSgnc3RlbW1lcicsIHJlcXVpcmVkOiB0cnVlKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjAuMi5iYiBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4wLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjAu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8x
LjAuMy5iYgppbmRleCA3ZWIxMmEwNGM1Li42MjVlODVhMGFlIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMC4yLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4wLjMuYmIKQEAgLTI4LDcgKzI4LDcg
QEAgU1JDX1VSSSA9ICIgXAogCWh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zb2Z0d2FyZS9h
cHBzdHJlYW0vcmVsZWFzZXMvQXBwU3RyZWFtLSR7UFZ9LnRhci54eiBcCiAJZmlsZTovLzAwMDEt
cmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoIFwKICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIx
YTUxNDhjYTk3ZGNiZjVlYjZlOWMzODAyNzhiYjBkMjA5Mzg1NjkyOTJlYTg2NTJkZjFiM2NhYzhi
ZDI3MzZiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVhYjZmNmNmNjQ0ZTc4NzVhOTUwODU5Mzk2
MmU1NmJiNDMwZjRlNTlhZTBiZjAzYmU2YmU3MDI5ZGViNmJhYTQiCiAKIFMgPSAiJHtXT1JLRElS
fS9BcHBTdHJlYW0tJHtQVn0iCiAKLS0gCjIuNDQuMAoK

--===============4438121786927868505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/appstream/appstream-dbg: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-dbg: PKGSIZE changed from 2382552 to 2385472 (+0%)
packages/core2-64-poky-linux/appstream/appstream-dbg: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-dbg: FILELIST: removed "/usr/lib/.debug/libappstream.so.1.0.2", added "/usr/lib/.debug/libappstream.so.1.0.3"
packages/core2-64-poky-linux/appstream/appstream-dev: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-dev: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-doc: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-doc: PKGSIZE changed from 2113109 to 2626434 (+24%)
packages/core2-64-poky-linux/appstream/appstream-doc: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-doc: FILELIST: added "/usr/share/doc/appstream/html/re01.html /usr/share/doc/appstream/html/re02.html"
packages/core2-64-poky-linux/appstream/appstream-locale-ain: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ain: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ar: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ar: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-bn-bd: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-bn-bd: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-bn: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-bn: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ca: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ca: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ckb: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ckb: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-cs: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-cs: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-da: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-da: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-de: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-de: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PKGSIZE changed from 90861 to 91484 (+1%)
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-eo: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-eo: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-es: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-es: PKGSIZE changed from 113784 to 115933 (+2%)
packages/core2-64-poky-linux/appstream/appstream-locale-es: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-et: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-et: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-eu: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-eu: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-fi: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-fi: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-fr: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-fr: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-gd: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-gd: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-gl: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-gl: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-he: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-he: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hi: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-hi: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hr: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-hr: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hu: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-hu: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-id: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-id: PKGSIZE changed from 93044 to 93351 (+0%)
packages/core2-64-poky-linux/appstream/appstream-locale-id: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-it: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-it: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ja: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ja: PKGSIZE changed from 32231 to 63060 (+96%)
packages/core2-64-poky-linux/appstream/appstream-locale-ja: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ka: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ka: PKGSIZE changed from 35454 to 35605 (+0%)
packages/core2-64-poky-linux/appstream/appstream-locale-ka: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ko: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ko: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-lt: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-lt: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-nb: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-nb: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PKGSIZE changed from 56142 to 59031 (+5%)
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-oc: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-oc: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pl: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-pl: PKGSIZE changed from 108389 to 116059 (+7%)
packages/core2-64-poky-linux/appstream/appstream-locale-pl: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PKGSIZE changed from 100553 to 114242 (+14%)
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PKGSIZE changed from 88182 to 114501 (+30%)
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ro: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ro: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-rom: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-rom: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ru: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-ru: PKGSIZE changed from 139100 to 139146 (+0%)
packages/core2-64-poky-linux/appstream/appstream-locale-ru: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sk: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-sk: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sl: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-sl: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sr+latin: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-sr+latin: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sr: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-sr: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sv: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-sv: PKGSIZE changed from 109601 to 110519 (+1%)
packages/core2-64-poky-linux/appstream/appstream-locale-sv: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-tr: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-tr: PKGSIZE changed from 112595 to 113543 (+1%)
packages/core2-64-poky-linux/appstream/appstream-locale-tr: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-uk: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-uk: PKGSIZE changed from 142020 to 151453 (+7%)
packages/core2-64-poky-linux/appstream/appstream-locale-uk: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PKGSIZE changed from 80046 to 101756 (+27%)
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-zh-tw: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-locale-zh-tw: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-src: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-src: PKGSIZE changed from 1838392 to 1846197 (+0%)
packages/core2-64-poky-linux/appstream/appstream-src: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream-staticdev: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream-staticdev: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream/appstream: PKGSIZE changed from 1019473 to 1025009 (+1%)
packages/core2-64-poky-linux/appstream/appstream: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.0.2", added "/usr/lib/libappstream.so.1.0.3"
packages/core2-64-poky-linux/appstream: PV changed from "1.0.2" to "1.0.3"
packages/core2-64-poky-linux/appstream: SRC_URI changed from "https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.2.tar.xz file://0001-remove-hardcoded-path.patch" to "https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.3.tar.xz file://0001-remove-hardcoded-path.patch"
packages/core2-64-poky-linux/appstream: PKGV changed from 1.0.2 [default] to 1.0.3 [default]
packages/core2-64-poky-linux/appstream: PACKAGES: added "appstream-locale-ia"
Changes to packages/core2-64-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.2 to libappstream.so.1.0.3
  /usr/lib/libappstream.so.1.0.2 moved to /usr/lib/libappstream.so.1.0.3
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.2 to libappstream.so.1.0.3
  /usr/lib/libappstream.so.1.0.2 moved to /usr/lib/libappstream.so.1.0.3

--===============4438121786927868505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/appstream/appstream-doc: PKGSIZE changed from 2113109 to 2626434 (+24%)
packages/core2-64-poky-linux/appstream/appstream-doc: FILELIST: added "/usr/share/doc/appstream/html/re02.html /usr/share/doc/appstream/html/re01.html"
packages/core2-64-poky-linux/appstream/appstream-locale-ja: PKGSIZE changed from 32231 to 63060 (+96%)
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PKGSIZE changed from 100553 to 114242 (+14%)
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PKGSIZE changed from 88182 to 114501 (+30%)
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PKGSIZE changed from 80046 to 101756 (+27%)
packages/core2-64-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.0.2", added "/usr/lib/libappstream.so.1.0.3"
packages/core2-64-poky-linux/appstream: PACKAGES: added "appstream-locale-ia"
Changes to packages/core2-64-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.2 to libappstream.so.1.0.3
  /usr/lib/libappstream.so.1.0.2 moved to /usr/lib/libappstream.so.1.0.3
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.2 to libappstream.so.1.0.3
  /usr/lib/libappstream.so.1.0.2 moved to /usr/lib/libappstream.so.1.0.3

--===============4438121786927868505==--

