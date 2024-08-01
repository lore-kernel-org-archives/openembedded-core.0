Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBA6C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.75502.1722536831466784948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G/LKwFCo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QvO7XpPQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101910f322754-23a1ede2-981d-4c5e-a253-bc5e26da0ec7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hgb3EGfkyiTtyR6mNyZYyPNjS2mbK415xEiow4pb9xI=;
	b=G/LKwFCoausUsRQyC/vQFmP/pNaVjr1yuxvIUWnc9ONG4BAoh18Mc/a5NIhRlSUY
	fxQV8zf/6odnlX105UEgTUjcd2CniCh7l4r30SoB7wR9W0uVypJoRo1lram0QS6lrP/
	T2EsU1M57Er9brjTwIF1wxw16yzEWPxMWEJd0xdc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hgb3EGfkyiTtyR6mNyZYyPNjS2mbK415xEiow4pb9xI=;
	b=QvO7XpPQHezHGDeSsnzqs1kaVNz/kEBzgkbp+7bc2fs5dcTN+nNjM38zaqzFL7NF
	6Hwd7Sq7vmbSBcIUI1OTZLweoxWzgYXW5YWAHQkFwqf5r8rXfhKjh1lWj0MUvAvPXeR
	YICkKcC7GiX+dOMOPgE+Vwspdr6jj1VqJNksLD0A=
Content-Type: multipart/mixed; boundary="===============8635601928096731560=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.16.0 FAILED
Message-ID: <010101910f322754-23a1ede2-981d-4c5e-a253-bc5e26da0ec7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202834

--===============8635601928096731560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.16.0* has Failed(do_compile).

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
From 9a0d171fae9c70a3df9cab783688f5dd52a38275 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 11:57:54 +0000
Subject: [PATCH] shadow: upgrade 4.15.1 -> 4.16.0

---
 ...commonio.c-fix-unexpected-open-failure-in-chroot-env.patch | 2 +-
 .../shadow/files/shadow-update-pam-conf.patch                 | 2 +-
 meta/recipes-extended/shadow/shadow.inc                       | 4 +++-
 .../shadow/{shadow_4.15.1.bb => shadow_4.16.0.bb}             | 0
 4 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.15.1.bb => shadow_4.16.0.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index cd99aad135..fc09bb540a 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f512071dd3a4c29d4bf048c5a89c4ba9160e37b1 Mon Sep 17 00:00:00 2001
+From ecc8d7364564a8e0f15b869cd2dd4b71f66569a1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 1eacb8a53f..cebb33fe29 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From 38882ab288fd4d2cc2e45dff222ae3412c8fe357 Mon Sep 17 00:00:00 2001
+From d200dfc977dbf2764a14701ece5bfada31c9b10d Mon Sep 17 00:00:00 2001
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


--===============8635601928096731560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1888 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-081643a8f7601d8a99e3cd0e2a7f1bc25d498ee1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:081643a8f7601d8a99e3cd0e2a7f1bc25d498ee1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 365 Local 336 Mirrors 0 Missed 29 Current 499 (92% match, 96% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 7 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 538 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_package_setscene)
NOTE: Running setscene task 621 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_setscene)
NOTE: Running setscene task 625 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 692 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 818 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 824 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_256-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 857 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_256-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_package_setscene: Started
NOTE: Running task 1510 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa)
NOTE: Running task 1657 of 2466 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa: Started
NOTE: Running task 1835 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_fetch)
NOTE: Running task 1858 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_fetch)
NOTE: recipe shadow-native-4.16.0-r0: task do_recipe_qa: Started
NOTE: Running task 2025 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Started
NOTE: Running task 2065 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_warn_musl)
NOTE: Running task 2066 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_write_config)
NOTE: recipe systemd-1_256-r0: task do_fetch: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa unihash changed to 08d3950e272e487af4d099400b6b7f3b9a06ec76e7b1db13545a1f993db8e586
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_256-r0: task do_warn_musl: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe systemd-1_256-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_256-r0: task do_write_config: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa unihash changed to 911c27f0f1fb805aa8ac30d3a770c18f869a6caa20f85fd9b6e8bbfd7e90b6ab
NOTE: recipe systemd-1_256-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_256-r0: task do_fetch: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2263 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: Running task 2264 of 2466 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: Running task 2265 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_unpack)
NOTE: Running task 2266 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_unpack)
NOTE: Running task 2267 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_fetch: Started
NOTE: recipe systemd-1_256-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 2295 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: recipe shadow-native-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 2296 of 2466 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: Running task 2297 of 2466 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Succeeded
NOTE: Running task 2298 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2302 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe systemd-1_256-r0: task do_unpack: Succeeded
NOTE: Running task 2303 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2304 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_lic)
NOTE: recipe systemd-1_256-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 863 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_lic: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2306 of 2466 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.16.0-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2343 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_256-r0: task do_patch: Succeeded
NOTE: Running task 2374 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch unihash changed to b8cb161d8436a4ae6c391385b2fbff188ebc379f7982abb937db6ab4ae2a592b
NOTE: recipe shadow-4.16.0-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_lic unihash changed to 4d146bc47eda2cbad643b3a75760745a3d5097c3008d2a5c6f6bc30f87e7d4d4
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2375 of 2466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_configure)
NOTE: recipe shadow-4.16.0-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 864 of 864 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-native-4.16.0-r0: task do_patch: Failed
NOTE: recipe shadow-4.16.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2424 tasks of which 2399 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801115724.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801115724.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.16.0-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/shadow-4.16.0'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.16.0/temp/log.do_patch.295875
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch) failed with exit code '1'

--===============8635601928096731560==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.15.1-4.16.0.patch"

RnJvbSA5YTBkMTcxZmFlOWM3MGEzZGY5Y2FiNzgzNjg4ZjVkZDUyYTM4Mjc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMTo1Nzo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRvdzogdXBncmFkZSA0LjE1LjEgLT4gNC4xNi4wCgotLS0KIC4uLmNvbW1vbmlvLmMtZml4LXVu
ZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2ggfCAyICstCiAuLi4vc2hh
ZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggICAgICAgICAgICAgICAgIHwg
MiArLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDQgKysrLQogLi4uL3NoYWRvdy97c2hhZG93XzQuMTUuMS5iYiA9PiBzaGFk
b3dfNC4xNi4wLmJifSAgICAgICAgICAgICB8IDAKIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFk
b3cve3NoYWRvd180LjE1LjEuYmIgPT4gc2hhZG93XzQuMTYuMC5iYn0gKDEwMCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11
bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFp
bHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoCmluZGV4IGNkOTlhYWQxMzUuLmZjMDliYjU0MGEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1m
aXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQt
b3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY1
MTIwNzFkZDNhNGMyOWQ0YmYwNDhjNWE4OWM0YmE5MTYwZTM3YjEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGVjYzhkNzM2NDU2NGE4ZTBmMTViODY5Y2QyZGQ0YjcxZjY2NTY5YTEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBUaHUsIDE3IEp1bCAyMDE0IDE1OjUzOjM0ICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGNvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVw
ZGF0ZS1wYW0tY29uZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMv
c2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaAppbmRleCAxZWFjYjhhNTNmLi5jZWJiMzNmZTI5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11
cGRhdGUtcGFtLWNvbmYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9m
aWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAz
ODg4MmFiMjg4ZmQ0ZDJjYzJlNDVkZmYyMjJhZTM0MTJjOGZlMzU3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBkMjAwZGZjOTc3ZGJmMjc2NGExNDcwMWVjZTViZmFkYTMxYzliMTBkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FuZyBLYWkgPGthaS5rYW5nQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBXZWQsIDIwIEp1bCAyMDExIDE5OjE4OjE0ICswODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHNoYWRvdzogdXBkYXRlIHBhbSByZWxhdGVkIGNvbmZpZ3VyZSBmaWxlcwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jCmluZGV4IDM5OTEwMDZiNDMuLjQ2NGFkOGRl
NjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYwor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvdy5pbmMKQEAgLTE0LDYgKzE0
LDggQEAgR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9zaGFkb3ctbWFpbnQv
c2hhZG93L3JlbGVhc2VzIgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
JHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BB
Q0tBR0VDT05GSUcnLCAncGFtJywgJyR7UEFNX1NSQ19VUkl9JywgJycsIGQpfSBcCiAgICAgICAg
ICAgIGZpbGU6Ly91c2VyYWRkIFwKKyAgICAgICAgICAgZmlsZTovL2xvZ2luX2RlZnNfcGFtLnNl
ZCBcCisgICAgICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFp
bHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJOmFwcGVu
ZDpjbGFzcy10YXJnZXQgPSAiIFwKQEAgLTI0LDcgKzI2LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xh
c3MtdGFyZ2V0ID0gIiBcCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIFwKICAgICAg
ICAgICAgZmlsZTovL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNo
cm9vdC1lbnYucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjM0
Njg2Yjg5YjI3OTg4N2ZmYmYxZjMzMTI4OTAyY2NjMGZhMWE5OThhM2FkZDQ0MjEzYmIxMmQ3Mzg1
YjIxOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxNzQ0ZjMzOWUwN2EyYjQxMDU2MzQ3ZGRkNjEy
ODM5NzYyZmY1NjVkN2U5NDk0ZmIwNDk0MjgwMDJmYTJlN2UwIgogCiAjIEFkZGl0aW9uYWwgUG9s
aWN5IGZpbGVzIGZvciBQQU0KIFBBTV9TUkNfVVJJID0gImZpbGU6Ly9wYW0uZC9jaGZuIFwKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTUuMS5iYiBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTYuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFk
b3dfNC4xNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRv
d180LjE2LjAuYmIKLS0gCjIuNDQuMAoK

--===============8635601928096731560==--

