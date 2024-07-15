Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E27FC54730
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1308.1721071147010283716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=i/0/YT7F;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=inQzz5ke;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010190b7d5992d-510c9a86-26c4-4d70-87cd-3c113acdba93-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Gq3Cx1EBrvtlBu+hShglPq6bjnWxLZPGE3vMYBYpXio=;
	b=i/0/YT7F7ZE5EMSYKNenntPpTJx7V+IEd8NnB+R224TBOIKKLVpZBNSIS2a653it
	YYy6XxA/h81gtRgeeDIKax4gCQk2Hq+yvHySl+s29/yFn7n7VitzeiCt4Mb+c1dQ5NC
	oA6C7AEUEqPgTGn56KTGkTc4wxLe+lPmwTHTVHyU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Gq3Cx1EBrvtlBu+hShglPq6bjnWxLZPGE3vMYBYpXio=;
	b=inQzz5key5Noiv78j6/ZvswITGqucUP1h6VLOK2OxzHjLnJKnUy4Hps9k8GRBI64
	uKn+1locO6AFiutHjnI3VoFOCW07oVyrNRxyH4c0TPctgW3O3NAGPjsvW9AvXEY3ig+
	JRlSm3xtnqhemIK21RJ6ihh7RGsw6Pn0r9pEfllk=
Content-Type: multipart/mixed; boundary="===============8505012171011078721=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.16.0 FAILED
Message-ID: <01010190b7d5992d-510c9a86-26c4-4d70-87cd-3c113acdba93-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202004

--===============8505012171011078721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.16.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.15.1-4.16.0.patch
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
From bd1f620bc94eb3efc464a0a27f9ad82d574e705f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 12:25:42 +0000
Subject: [PATCH] shadow: upgrade 4.15.1 -> 4.16.0

---
 ...commonio.c-fix-unexpected-open-failure-in-chroot-env.patch | 2 +-
 .../shadow/files/shadow-update-pam-conf.patch                 | 2 +-
 meta/recipes-extended/shadow/shadow.inc                       | 4 +++-
 .../shadow/{shadow_4.15.1.bb => shadow_4.16.0.bb}             | 0
 4 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.15.1.bb => shadow_4.16.0.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index cd99aad135..f7fdb450e0 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f512071dd3a4c29d4bf048c5a89c4ba9160e37b1 Mon Sep 17 00:00:00 2001
+From 54cbc0a5d0ec726f92058110ecaad35c6eaafe1c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 1eacb8a53f..54e2caf54a 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From 38882ab288fd4d2cc2e45dff222ae3412c8fe357 Mon Sep 17 00:00:00 2001
+From b2316c3634d030f02b9ad95cc4ce028d4dc89fce Mon Sep 17 00:00:00 2001
 From: Kang Kai <kai.kang@windriver.com>
 Date: Wed, 20 Jul 2011 19:18:14 +0800
 Subject: [PATCH] shadow: update pam related configure files
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 3991006b43..464ad8de68 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,6 +14,8 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://login_defs_pam.sed \
+           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +26,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "b34686b89b279887ffbf1f33128902ccc0fa1a998a3add44213bb12d7385b218"
+SRC_URI[sha256sum] = "1744f339e07a2b41056347ddd612839762ff565d7e9494fb049428002fa2e7e0"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.15.1.bb b/meta/recipes-extended/shadow/shadow_4.16.0.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.15.1.bb
rename to meta/recipes-extended/shadow/shadow_4.16.0.bb
-- 
2.44.0


--===============8505012171011078721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-56b9f4098a9e8e8a640f9c7360adecaeda6d4b6f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:56b9f4098a9e8e8a640f9c7360adecaeda6d4b6f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 444 Local 414 Mirrors 0 Missed 30 Current 414 (93% match, 96% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 445 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_package_setscene)
NOTE: Running setscene task 521 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_setscene)
NOTE: Running setscene task 525 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 687 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_256-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 702 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 705 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 706 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_256-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 712 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 723 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 725 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_256-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_package_setscene: Started
NOTE: recipe systemd-1_256-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 792 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1203 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa)
NOTE: Running task 1293 of 2453 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa: Started
NOTE: Running task 1440 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_fetch)
NOTE: Running task 1456 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_fetch)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1504 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1564 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe shadow-native-4.16.0-r0: task do_recipe_qa: Started
NOTE: Running task 1596 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_warn_musl)
NOTE: Running task 1597 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_write_config)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Started
NOTE: Running setscene task 808 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_256-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1710 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe systemd-1_256-r0: task do_write_config: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Succeeded
NOTE: Running task 1711 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_unpack)
NOTE: recipe systemd-1_256-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_256-r0: task do_warn_musl: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.16.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe systemd-1_256-r0: task do_write_config: Succeeded
NOTE: Running task 1717 of 2453 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 814 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 818 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1718 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: recipe systemd-1_256-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_unpack)
NOTE: recipe shadow-native-4.16.0-r0: task do_fetch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1720 of 2453 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75c95e86caf00cb415d492020921f35210eb741b56f44dddcbdffc96e3cfa514
NOTE: Running task 1721 of 2453 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_256-r0: task do_unpack: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-native-4.16.0-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-native-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1727 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_patch)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1733 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1796 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_256-r0: task do_unpack: Succeeded
NOTE: Running task 1799 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_patch)
NOTE: recipe shadow-native-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1800 of 2453 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: Running setscene task 838 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_256-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1805 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1806 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_lic)
NOTE: recipe systemd-1_256-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_lic: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 839 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 842 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 845 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 858 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2125 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2393 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2453 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_configure)
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_configure: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_patch: Failed
NOTE: recipe shadow-4.16.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2411 tasks of which 2385 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715122514.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715122514.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.16.0-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/shadow-4.16.0'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/temp/log.do_patch.1968097
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch) failed with exit code '1'

--===============8505012171011078721==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.15.1-4.16.0.patch"

RnJvbSBiZDFmNjIwYmM5NGViM2VmYzQ2NGEwYTI3ZjlhZDgyZDU3NGU3MDVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTI6MjU6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkb3c6IHVwZ3JhZGUgNC4xNS4xIC0+IDQuMTYuMAoKLS0tCiAuLi5jb21tb25pby5jLWZpeC11
bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIHwgMiArLQogLi4uL3No
YWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoICAgICAgICAgICAgICAgICB8
IDIgKy0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYyAgICAgICAgICAg
ICAgICAgICAgICAgfCA0ICsrKy0KIC4uLi9zaGFkb3cve3NoYWRvd180LjE1LjEuYmIgPT4gc2hh
ZG93XzQuMTYuMC5iYn0gICAgICAgICAgICAgfCAwCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hh
ZG93L3tzaGFkb3dfNC4xNS4xLmJiID0+IHNoYWRvd180LjE2LjAuYmJ9ICgxMDAlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgt
dW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZh
aWx1cmUtaW4tY2hyb290LWVudi5wYXRjaAppbmRleCBjZDk5YWFkMTM1Li5mN2ZkYjQ1MGUwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMt
Zml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVk
LW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBm
NTEyMDcxZGQzYTRjMjlkNGJmMDQ4YzVhODljNGJhOTE2MGUzN2IxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA1NGNiYzBhNWQwZWM3MjZmOTIwNTgxMTBlY2FhZDM1YzZlYWFmZTFjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogVGh1LCAxNyBKdWwgMjAxNCAxNTo1MzozNCArMDgwMAogU3ViamVjdDogW1BB
VENIXSBjb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11
cGRhdGUtcGFtLWNvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVz
L3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKaW5kZXggMWVhY2I4YTUzZi4uNTRlMmNhZjU0
YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9zaGFkb3ct
dXBkYXRlLXBhbS1jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cv
ZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
Mzg4ODJhYjI4OGZkNGQyY2MyZTQ1ZGZmMjIyYWUzNDEyYzhmZTM1NyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYjIzMTZjMzYzNGQwMzBmMDJiOWFkOTVjYzRjZTAyOGQ0ZGM4OWZjZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthbmcgS2FpIDxrYWkua2FuZ0B3aW5kcml2
ZXIuY29tPgogRGF0ZTogV2VkLCAyMCBKdWwgMjAxMSAxOToxODoxNCArMDgwMAogU3ViamVjdDog
W1BBVENIXSBzaGFkb3c6IHVwZGF0ZSBwYW0gcmVsYXRlZCBjb25maWd1cmUgZmlsZXMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYwppbmRleCAzOTkxMDA2YjQzLi40NjRhZDhk
ZTY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvdy5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jCkBAIC0xNCw2ICsx
NCw4IEBAIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2hhZG93LW1haW50
L3NoYWRvdy9yZWxlYXNlcyIKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2Fk
LyR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQ
QUNLQUdFQ09ORklHJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXAogICAgICAg
ICAgICBmaWxlOi8vdXNlcmFkZCBcCisgICAgICAgICAgIGZpbGU6Ly9sb2dpbl9kZWZzX3BhbS5z
ZWQgXAorICAgICAgICAgICBmaWxlOi8vY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZh
aWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSTphcHBl
bmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCkBAIC0yNCw3ICsyNiw3IEBAIFNSQ19VUkk6YXBwZW5kOmNs
YXNzLXRhcmdldCA9ICIgXAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAg
ICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1j
aHJvb3QtZW52LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImIz
NDY4NmI4OWIyNzk4ODdmZmJmMWYzMzEyODkwMmNjYzBmYTFhOTk4YTNhZGQ0NDIxM2JiMTJkNzM4
NWIyMTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTc0NGYzMzllMDdhMmI0MTA1NjM0N2RkZDYx
MjgzOTc2MmZmNTY1ZDdlOTQ5NGZiMDQ5NDI4MDAyZmEyZTdlMCIKIAogIyBBZGRpdGlvbmFsIFBv
bGljeSBmaWxlcyBmb3IgUEFNCiBQQU1fU1JDX1VSSSA9ICJmaWxlOi8vcGFtLmQvY2hmbiBcCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE1LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE2LjAuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hh
ZG93XzQuMTUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFk
b3dfNC4xNi4wLmJiCi0tIAoyLjQ0LjAKCg==

--===============8505012171011078721==--

