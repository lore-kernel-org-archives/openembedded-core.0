Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6FFC19F32
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8091.1739623332163588576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QAW98orw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1yNFMuL+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019509a17a60-96aae036-70af-40ab-9efe-a76c50686d05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=na+/KoaCzHkua0TrjMZGofEGITJ6qDzJgAYcD56PrXc=;
	b=QAW98orwukcWRAqkbrMVd6lNognB7bM6cwcJhL7k9q9MjwCPb4+iOttsLpaiqjxo
	MOK0819HDHV6YWWIotTsF+Sc8jJ5PNi9z76a5wdx0/zwznNssS/zzdTxdDmj8Gpn2yZ
	JJo+wrW+hSH4cjvS6VyWUmhVMmvxbwofB9tQxI3s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=na+/KoaCzHkua0TrjMZGofEGITJ6qDzJgAYcD56PrXc=;
	b=1yNFMuL+ZfHaTbKm6y3/aNp6+oQt+Ja3Ks6PHuCM+6HNU1KINqZZBJQ85jL/NB/o
	dqO3NvuDsr9yR/8Ru0otHaYfyRezvaoLbVXsRw0Im3S41fef/mlyw3kZcFpIvIZ0f6X
	A+oCGmJtY1Hz6YrhczmizjflBTuHwRAKBLq+oeYo=
Content-Type: multipart/mixed; boundary="===============4850472626314045976=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.73 SUCCEEDED
Message-ID: <0101019509a17a60-96aae036-70af-40ab-9efe-a76c50686d05-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211405

--===============4850472626314045976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ell* to *0.73* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.71-0.73.patch
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
From 05dbb4c74faef2fcc349e8045d68e6b51fc2f129 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 06:51:19 +0000
Subject: [PATCH] ell: upgrade 0.71 -> 0.73

---
 meta/recipes-core/ell/{ell_0.71.bb => ell_0.73.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.71.bb => ell_0.73.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.71.bb b/meta/recipes-core/ell/ell_0.73.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.71.bb
rename to meta/recipes-core/ell/ell_0.73.bb
index b9a0b595d4..c6691c7e54 100644
--- a/meta/recipes-core/ell/ell_0.71.bb
+++ b/meta/recipes-core/ell/ell_0.73.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "850f79cc993791f00232fd31cbaf3e8212edcef25ca0515f98c6d48dfb5952d7"
+SRC_URI[sha256sum] = "ae97f848b45a59be7741369880badfa8c08a55a24b21eae3468342cc012df11b"
-- 
2.44.1


--===============4850472626314045976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1870 targets, 49 skipped, 0 masked, 0 errors.
Removing 66 recipes from the core2-64 sysroot...done.
Removing 91 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:126109ad43f9f3e1b30068a259cc892615ddd1ae"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 411 Local 392 Mirrors 0 Missed 19 Current 237 (95% match, 97% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 302 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_populate_lic_setscene)
NOTE: Running setscene task 312 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 314 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 316 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 328 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.73-r0: task do_populate_lic_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 330 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_create_spdx_setscene)
NOTE: recipe ell-0.73-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 376 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 378 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 380 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 386 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libx11/1.8.10/temp/log.do_packagedata_setscene.2622922
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 388 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 390 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 406 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 407 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 411 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-9.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-9.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 418 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 420 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 421 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 422 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 686 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 688 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_write_config)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 703 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_fetch)
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 431 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 432 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 747 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_fetch: Started
NOTE: Running setscene task 435 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 437 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 440 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 790 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_unpack)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Started
NOTE: Running setscene task 445 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 446 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 448 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 450 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 806 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_write_config)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 814 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_recipe_qa)
NOTE: Running setscene task 454 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.73-r0: task do_recipe_qa: Started
NOTE: Running setscene task 466 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_write_config: Started
NOTE: Running setscene task 467 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 470 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 472 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-native-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-native-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ell-0.73-r0: task do_recipe_qa: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/openssl/3.4.0/temp/log.do_packagedata_setscene.2624353
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 496 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_package_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 498 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 504 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 507 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 508 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_package_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 511 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 518 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 535 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1008 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 540 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1019 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1030 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 543 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.73-r0: task do_fetch: Started
NOTE: recipe dbus-1.16.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.73-r0: task do_fetch: Succeeded
NOTE: Running task 1066 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 545 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.73-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_package_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 548 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.73-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1083 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_patch)
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.73-r0: task do_patch: Started
NOTE: recipe ell-0.73-r0: task do_patch: Succeeded
NOTE: Running task 1089 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.73-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ell-0.73-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-9.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-9.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe meson-native-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-build-native-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 602 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 648 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 618 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 625 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 648 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1542 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1659 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata)
NOTE: Running task 1698 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1779 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1780 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_configure)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure: Succeeded
NOTE: Running task 1781 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1782 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_compile)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1784 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_install)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install: Succeeded
NOTE: Running task 1785 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1786 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot)
NOTE: Running task 1787 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_package)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1788 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1789 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_configure)
NOTE: recipe dbus-1.16.0-r0: task do_configure: Started
NOTE: recipe dbus-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1790 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1791 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_compile)
NOTE: recipe dbus-1.16.0-r0: task do_compile: Started
NOTE: recipe dbus-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1793 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_install)
NOTE: recipe dbus-1.16.0-r0: task do_install: Started
NOTE: recipe dbus-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1794 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.16.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1795 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1796 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.73-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.73-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1797 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_configure)
NOTE: recipe ell-0.73-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_package: Succeeded
NOTE: Running task 1798 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata unihash changed to 7616eebd5b296c00e45f4976f163df80f196b3b95f81d8fc0b419ee126775555
NOTE: Setscene tasks completed
NOTE: Running task 1799 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_package)
NOTE: Running task 1800 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.16.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1801 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ell-0.73-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1802 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_compile)
NOTE: recipe ell-0.73-r0: task do_compile: Started
NOTE: recipe dbus-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1803 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_packagedata)
NOTE: recipe dbus-1.16.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_packagedata unihash changed to fe0cbbd9479d3a6f2d24ec424c9c52922168bab3f3ef8c3b2d0365b5ffc121e0
NOTE: Setscene tasks completed
NOTE: Running task 1804 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_create_spdx)
NOTE: recipe dbus-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1805 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.73-r0: task do_collect_spdx_deps: Started
NOTE: recipe ell-0.73-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ell-0.73-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1806 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_install)
NOTE: recipe ell-0.73-r0: task do_install: Started
NOTE: recipe ell-0.73-r0: task do_install: Succeeded
NOTE: Running task 1807 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_package)
NOTE: Running task 1808 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_populate_sysroot)
NOTE: recipe ell-0.73-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.73-r0: task do_package: Started
NOTE: recipe ell-0.73-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.73-r0: task do_package: Succeeded
NOTE: Running task 1809 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_packagedata)
NOTE: recipe ell-0.73-r0: task do_packagedata: Started
NOTE: recipe ell-0.73-r0: task do_packagedata: Succeeded
NOTE: Running task 1810 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_create_spdx)
NOTE: Running task 1811 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_package_write_ipk)
NOTE: Running task 1812 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_package_write_deb)
NOTE: Running task 1813 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_package_write_rpm)
NOTE: Running task 1814 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_package_qa)
NOTE: recipe ell-0.73-r0: task do_create_spdx: Started
NOTE: recipe ell-0.73-r0: task do_package_write_ipk: Started
NOTE: recipe ell-0.73-r0: task do_package_write_deb: Started
NOTE: recipe ell-0.73-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.73-r0: task do_package_qa: Started
NOTE: recipe ell-0.73-r0: task do_create_spdx: Succeeded
NOTE: Running task 1815 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_create_package_spdx)
NOTE: recipe ell-0.73-r0: task do_create_package_spdx: Started
NOTE: recipe ell-0.73-r0: task do_package_write_ipk: Succeeded
NOTE: recipe ell-0.73-r0: task do_package_qa: Succeeded
NOTE: recipe ell-0.73-r0: task do_create_package_spdx: Succeeded
NOTE: recipe ell-0.73-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.73-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1816 of 1816 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.73.bb:do_build)
NOTE: Tasks Summary: Attempted 1816 tasks of which 1762 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 25 ERROR messages, returning a non-zero exit code.
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.11-r0 to 1:1.8.10-r0) [version-going-backwards]
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.11-r0 to 1:1.8.10-r0) [version-going-backwards]
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.11-r0 to 1:1.8.10-r0) [version-going-backwards]
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.11-r0 to 1:1.8.10-r0) [version-going-backwards]
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.11-r0 to 1:1.8.10-r0) [version-going-backwards]
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.11-r0 to 1:1.8.10-r0) [version-going-backwards]
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.11-r0 to 1:1.8.10-r0) [version-going-backwards]
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.11-r0 to 1:1.8.10-r0) [version-going-backwards]
ERROR: libx11-1_1.8.10-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.4.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: openssl-3.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4850472626314045976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.71 [default] to 0.73 [default]
packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.71" to "0.73"
packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1735720 to 1762184 (+2%)
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.71 [default] to 0.73 [default]
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.71" to "0.73"
packages/core2-64-poky-linux/ell/ell-dev: PKGSIZE changed from 129125 to 129666 (+0%)
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.71 [default] to 0.73 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.71" to "0.73"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.71 [default] to 0.73 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.71" to "0.73"
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.71 [default] to 0.73 [default]
packages/core2-64-poky-linux/ell/ell-src: FILELIST: directory renamed /usr/src/debug/ell/0.71/linux -> /usr/src/debug/ell/0.73/linux, removed "/usr/src/debug/ell/0.71/ell/dhcp6-private.h /usr/src/debug/ell/0.71/ell/icmp6-private.h /usr/src/debug/ell/0.71/ell/ecc.h /usr/src/debug/ell/0.71/ell/dir.h /usr/src/debug/ell/0.71/ell/acd.h /usr/src/debug/ell/0.71/ell/key.h /usr/src/debug/ell/0.71/ell/log.h /usr/src/debug/ell/0.71/ell/acd.c /usr/src/debug/ell/0.71/ell/dir.c /usr/src/debug/ell/0.71/ell/ecc.c /usr/src/debug/ell/0.71/ell/key.c /usr/src/debug/ell/0.71/ell/log.c /usr/src/debug/ell/0.71/ell/net.c /usr/src/debug/ell/0.71/ell/pem.c /usr/src/debug/ell/0.71/ell/sysctl.h /usr/src/debug/ell/0.71/ell/tls.c /usr/src/debug/ell/0.71/ell/tls-extensions.c /usr/src/debug/ell/0.71/ell/genl.h /usr/src/debug/ell/0.71/ell/rtnl.h /usr/src/debug/ell/0.71/ell/dbus-client.h /usr/src/debug/ell/0.71/ell/strv.h /usr/src/debug/ell/0.71/ell/test.h /usr/src/debug/ell/0.71/ell/time.h /usr/src/debug/ell/0.71/el
 l/utf8.h /usr/src/debug/ell/0.71/ell/util.h /usr/src/debug/ell/0.71/ell/uuid.h /usr/src/debug/ell/0.71/ell/cert-crypto.c /usr/src/debug/ell/0.71/ell/dbus-client.c /usr/src/debug/ell/0.71/ell/dhcp-server.c /usr/src/debug/ell/0.71/ell/random.h /usr/src/debug/ell/0.71/ell/gvariant-private.h /usr/src/debug/ell/0.71/ell/random.c /usr/src/debug/ell/0.71/ell/uuid.c /usr/src/debug/ell/0.71/ell/dhcp.c /usr/src/debug/ell/0.71/ell/ecdh.c /usr/src/debug/ell/0.71/ell/file.c /usr/src/debug/ell/0.71/ell/path.c /usr/src/debug/ell/0.71/ell/rtnl.c /usr/src/debug/ell/0.71/ell/strv.c /usr/src/debug/ell/0.71/ell/test.c /usr/src/debug/ell/0.71/ell/time.c /usr/src/debug/ell/0.71/ell/io.h /usr/src/debug/ell/0.71/ell/io.c /usr/src/debug/ell/0.71/ell/hwdb.h /usr/src/debug/ell/0.71/ell/idle.h /usr/src/debug/ell/0.71/ell/main.h /usr/src/debug/ell/0.71/ell/cert.h /usr/src/debug/ell/0.71/ell/dbus.h /usr/src/debug/ell/0.71/ell/dbus-service.h /usr/src/debug/ell/0.71/ell/dhcp.h /usr/src/debug/ell/0.71/ell/ecdh.h /u
 sr/src/debug/ell/0.71/ell/utf8.c /usr/src/debug/ell/0.71/ell/util.c /usr/src/debug/ell/0.71/ell/genl.c /usr/src/debug/ell/0.71/ell/gpio.c /usr/src/debug/ell/0.71/ell/hwdb.c /usr/src/debug/ell/0.71/ell/idle.c /usr/src/debug/ell/0.71/ell/main.c /usr/src/debug/ell/0.71/ell/cert.c /usr/src/debug/ell/0.71/ell/dbus.c /usr/src/debug/ell/0.71/ell/dbus-message.c /usr/src/debug/ell/0.71/ell/dbus-service.c /usr/src/debug/ell/0.71/ell/timeout.c /usr/src/debug/ell/0.71/ell/timeout.h /usr/src/debug/ell/0.71/ell/ecc-private.h /usr/src/debug/ell/0.71/ell/pem-private.h /usr/src/debug/ell/0.71/ell/tls-private.h /usr/src/debug/ell/0.71/ell/net-private.h /usr/src/debug/ell/0.71/ell/net.h /usr/src/debug/ell/0.71/ell/tls.h /usr/src/debug/ell/0.71/ell/dhcp6-transport.c /usr/src/debug/ell/0.71/ell/ecc-external.c /usr/src/debug/ell/0.71/ell/queue.h /usr/src/debug/ell/0.71/ell/dbus-name-cache.c /usr/src/debug/ell/0.71/ell/queue.c /usr/src/debug/ell/0.71/ell/uintset.h /usr/src/debug/ell/0.71/ell/uintset.c /us
 r/src/debug/ell/0.71/ell/dhcp6.h /usr/src/debug/ell/0.71/ell/icmp6.h /usr/src/debug/ell/0.71/ell/dhcp6.c /usr/src/debug/ell/0.71/ell/icmp6.c /usr/src/debug/ell/0.71/ell/cipher.h /usr/src/debug/ell/0.71/ell/tester.h /usr/src/debug/ell/0.71/ell/hashmap.h /usr/src/debug/ell/0.71/ell/cipher.c /usr/src/debug/ell/0.71/ell/tester.c /usr/src/debug/ell/0.71/ell/hashmap.c /usr/src/debug/ell/0.71/ell/base64.h /usr/src/debug/ell/0.71/ell/base64.c /usr/src/debug/ell/0.71/ell/dbus-filter.c /usr/src/debug/ell/0.71/ell/dhcp6-lease.c /usr/src/debug/ell/0.71/ell/ringbuf.c /usr/src/debug/ell/0.71/ell/ringbuf.h /usr/src/debug/ell/0.71/ell/string.h /usr/src/debug/ell/0.71/ell/string.c /usr/src/debug/ell/0.71/ell/netconfig.c /usr/src/debug/ell/0.71/ell/main-private.h /usr/src/debug/ell/0.71/ell/asn1-private.h /usr/src/debug/ell/0.71/ell/cert-private.h /usr/src/debug/ell/0.71/ell/dbus-private.h /usr/src/debug/ell/0.71/ell/dhcp-private.h /usr/src/debug/ell/0.71/ell/netconfig.h /usr/src/debug/ell/0.71/ell/r
 tnl-private.h /usr/src/debug/ell/0.71/ell/time-private.h /usr/src/debug/ell/0.71/ell/netlink.h /usr/src/debug/ell/0.71/ell/tls-suites.c /usr/src/debug/ell/0.71/ell/netlink.c /usr/src/debug/ell/0.71/ell/gvariant-util.c /usr/src/debug/ell/0.71/ell/useful.h /usr/src/debug/ell/0.71/ell/dbus-util.c /usr/src/debug/ell/0.71/ell/dhcp-util.c /usr/src/debug/ell/0.71/ell/siphash.c /usr/src/debug/ell/0.71/ell/checksum.h /usr/src/debug/ell/0.71/ell/sysctl.c /usr/src/debug/ell/0.71/ell/checksum.c /usr/src/debug/ell/0.71/ell/signal.h /usr/src/debug/ell/0.71/ell/notifylist.h /usr/src/debug/ell/0.71/ell/signal.c /usr/src/debug/ell/0.71/ell/notifylist.c /usr/src/debug/ell/0.71/ell/dhcp-lease.c /usr/src/debug/ell/0.71/ell/tls-record.c /usr/src/debug/ell/0.71/ell/netlink-private.h /usr/src/debug/ell/0.71/ell/settings.c /usr/src/debug/ell/0.71/ell/settings.h /usr/src/debug/ell/0.71/ell/dhcp-transport.c", added "/usr/src/debug/ell/0.73/ell/dhcp6-private.h /usr/src/debug/ell/0.73/ell/icmp6-private.h /usr/
 src/debug/ell/0.73/ell/ecc.h /usr/src/debug/ell/0.73/ell/dir.h /usr/src/debug/ell/0.73/ell/acd.h /usr/src/debug/ell/0.73/ell/key.h /usr/src/debug/ell/0.73/ell/log.h /usr/src/debug/ell/0.73/ell/acd.c /usr/src/debug/ell/0.73/ell/dir.c /usr/src/debug/ell/0.73/ell/ecc.c /usr/src/debug/ell/0.73/ell/key.c /usr/src/debug/ell/0.73/ell/log.c /usr/src/debug/ell/0.73/ell/net.c /usr/src/debug/ell/0.73/ell/pem.c /usr/src/debug/ell/0.73/ell/sysctl.h /usr/src/debug/ell/0.73/ell/tls.c /usr/src/debug/ell/0.73/ell/tls-extensions.c /usr/src/debug/ell/0.73/ell/genl.h /usr/src/debug/ell/0.73/ell/rtnl.h /usr/src/debug/ell/0.73/ell/dbus-client.h /usr/src/debug/ell/0.73/ell/strv.h /usr/src/debug/ell/0.73/ell/test.h /usr/src/debug/ell/0.73/ell/time.h /usr/src/debug/ell/0.73/ell/utf8.h /usr/src/debug/ell/0.73/ell/util.h /usr/src/debug/ell/0.73/ell/uuid.h /usr/src/debug/ell/0.73/ell/cert-crypto.c /usr/src/debug/ell/0.73/ell/dbus-client.c /usr/src/debug/ell/0.73/ell/dhcp-server.c /usr/src/debug/ell/0.73/ell/ra
 ndom.h /usr/src/debug/ell/0.73/ell/gvariant-private.h /usr/src/debug/ell/0.73/ell/random.c /usr/src/debug/ell/0.73/ell/uuid.c /usr/src/debug/ell/0.73/ell/dhcp.c /usr/src/debug/ell/0.73/ell/ecdh.c /usr/src/debug/ell/0.73/ell/file.c /usr/src/debug/ell/0.73/ell/path.c /usr/src/debug/ell/0.73/ell/rtnl.c /usr/src/debug/ell/0.73/ell/strv.c /usr/src/debug/ell/0.73/ell/test.c /usr/src/debug/ell/0.73/ell/time.c /usr/src/debug/ell/0.73/ell/io.h /usr/src/debug/ell/0.73/ell/io.c /usr/src/debug/ell/0.73/ell/hwdb.h /usr/src/debug/ell/0.73/ell/idle.h /usr/src/debug/ell/0.73/ell/main.h /usr/src/debug/ell/0.73/ell/cert.h /usr/src/debug/ell/0.73/ell/dbus.h /usr/src/debug/ell/0.73/ell/dbus-service.h /usr/src/debug/ell/0.73/ell/dhcp.h /usr/src/debug/ell/0.73/ell/ecdh.h /usr/src/debug/ell/0.73/ell/utf8.c /usr/src/debug/ell/0.73/ell/util.c /usr/src/debug/ell/0.73/ell/genl.c /usr/src/debug/ell/0.73/ell/gpio.c /usr/src/debug/ell/0.73/ell/hwdb.c /usr/src/debug/ell/0.73/ell/idle.c /usr/src/debug/ell/0.73/ell
 /main.c /usr/src/debug/ell/0.73/ell/cert.c /usr/src/debug/ell/0.73/ell/dbus.c /usr/src/debug/ell/0.73/ell/dbus-message.c /usr/src/debug/ell/0.73/ell/dbus-service.c /usr/src/debug/ell/0.73/ell/timeout.c /usr/src/debug/ell/0.73/ell/timeout.h /usr/src/debug/ell/0.73/ell/ecc-private.h /usr/src/debug/ell/0.73/ell/pem-private.h /usr/src/debug/ell/0.73/ell/tls-private.h /usr/src/debug/ell/0.73/ell/net-private.h /usr/src/debug/ell/0.73/ell/net.h /usr/src/debug/ell/0.73/ell/tls.h /usr/src/debug/ell/0.73/ell/dhcp6-transport.c /usr/src/debug/ell/0.73/ell/ecc-external.c /usr/src/debug/ell/0.73/ell/queue.h /usr/src/debug/ell/0.73/ell/dbus-name-cache.c /usr/src/debug/ell/0.73/ell/queue.c /usr/src/debug/ell/0.73/ell/uintset.h /usr/src/debug/ell/0.73/ell/uintset.c /usr/src/debug/ell/0.73/ell/dhcp6.h /usr/src/debug/ell/0.73/ell/icmp6.h /usr/src/debug/ell/0.73/ell/dhcp6.c /usr/src/debug/ell/0.73/ell/icmp6.c /usr/src/debug/ell/0.73/ell/cipher.h /usr/src/debug/ell/0.73/ell/tester.h /usr/src/debug/ell/0
 .73/ell/hashmap.h /usr/src/debug/ell/0.73/ell/cipher.c /usr/src/debug/ell/0.73/ell/tester.c /usr/src/debug/ell/0.73/ell/hashmap.c /usr/src/debug/ell/0.73/ell/base64.h /usr/src/debug/ell/0.73/ell/base64.c /usr/src/debug/ell/0.73/ell/dbus-filter.c /usr/src/debug/ell/0.73/ell/dhcp6-lease.c /usr/src/debug/ell/0.73/ell/ringbuf.c /usr/src/debug/ell/0.73/ell/ringbuf.h /usr/src/debug/ell/0.73/ell/string.h /usr/src/debug/ell/0.73/ell/string.c /usr/src/debug/ell/0.73/ell/netconfig.c /usr/src/debug/ell/0.73/ell/main-private.h /usr/src/debug/ell/0.73/ell/asn1-private.h /usr/src/debug/ell/0.73/ell/cert-private.h /usr/src/debug/ell/0.73/ell/dbus-private.h /usr/src/debug/ell/0.73/ell/dhcp-private.h /usr/src/debug/ell/0.73/ell/netconfig.h /usr/src/debug/ell/0.73/ell/rtnl-private.h /usr/src/debug/ell/0.73/ell/test-private.h /usr/src/debug/ell/0.73/ell/time-private.h /usr/src/debug/ell/0.73/ell/netlink.h /usr/src/debug/ell/0.73/ell/tls-suites.c /usr/src/debug/ell/0.73/ell/netlink.c /usr/src/debug/ell
 /0.73/ell/gvariant-util.c /usr/src/debug/ell/0.73/ell/useful.h /usr/src/debug/ell/0.73/ell/dbus-util.c /usr/src/debug/ell/0.73/ell/dhcp-util.c /usr/src/debug/ell/0.73/ell/siphash.c /usr/src/debug/ell/0.73/ell/checksum.h /usr/src/debug/ell/0.73/ell/sysctl.c /usr/src/debug/ell/0.73/ell/test-dbus.c /usr/src/debug/ell/0.73/ell/checksum.c /usr/src/debug/ell/0.73/ell/signal.h /usr/src/debug/ell/0.73/ell/notifylist.h /usr/src/debug/ell/0.73/ell/signal.c /usr/src/debug/ell/0.73/ell/notifylist.c /usr/src/debug/ell/0.73/ell/dhcp-lease.c /usr/src/debug/ell/0.73/ell/tls-record.c /usr/src/debug/ell/0.73/ell/netlink-private.h /usr/src/debug/ell/0.73/ell/settings.c /usr/src/debug/ell/0.73/ell/settings.h /usr/src/debug/ell/0.73/ell/dhcp-transport.c"
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.71" to "0.73"
packages/core2-64-poky-linux/ell/ell-src: PKGSIZE changed from 1419081 to 1436231 (+1%)
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.71 [default] to 0.73 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.71" to "0.73"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.71 [default] to 0.73 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.71" to "0.73"
packages/core2-64-poky-linux/ell/ell: PKGSIZE changed from 550559 to 562847 (+2%)
packages/core2-64-poky-linux/ell: PKGV changed from 0.71 [default] to 0.73 [default]
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.71.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.73.tar.xz"
packages/core2-64-poky-linux/ell: PV changed from "0.71" to "0.73"

--===============4850472626314045976==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.71-0.73.patch"

RnJvbSAwNWRiYjRjNzRmYWVmMmZjYzM0OWU4MDQ1ZDY4ZTZiNTFmYzJmMTI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDY6NTE6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGw6IHVwZ3JhZGUgMC43MSAtPiAwLjczCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC97ZWxs
XzAuNzEuYmIgPT4gZWxsXzAuNzMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC43MS5iYiA9PiBlbGxfMC43My5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9lbGwvZWxsXzAuNzEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNzMuYmIK
c2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2Vs
bF8wLjcxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNzMuYmIKaW5k
ZXggYjlhMGI1OTVkNC4uYzY2OTFjN2U1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZWxsL2VsbF8wLjcxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43My5iYgpA
QCAtMTUsNCArMTUsNCBAQCBERVBFTkRTID0gImRidXMiCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAogU1JDX1VSSSA9ICJodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjg1MGY3OWNjOTkzNzkxZjAwMjMyZmQzMWNiYWYzZTgyMTJlZGNlZjI1Y2EwNTE1Zjk4YzZk
NDhkZmI1OTUyZDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWU5N2Y4NDhiNDVhNTliZTc3NDEz
Njk4ODBiYWRmYThjMDhhNTVhMjRiMjFlYWUzNDY4MzQyY2MwMTJkZjExYiIKLS0gCjIuNDQuMQoK

--===============4850472626314045976==--

