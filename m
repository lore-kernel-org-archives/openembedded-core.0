Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4AAC2BC81
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1241.1715794337734037318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hLHS+IBo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VllNvHHs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fe22f-3adc8122-d904-44d6-b1dd-4773cfcb9fbd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yZotDINmXcbiIZbNoOrx0WiMfnVOXkamM586SGbXij0=;
	b=hLHS+IBoOgS6EUdeJu8TK/33VVgBzCHc3SuaQlQML3r3mUP5IttjXiWpi4cZ0XL2
	UwKCadep+lzwozwKzGCB/yK37z+TRDpXmKGlVXYXYUZ10BR1nqRRY4gR+fm2JnScAHZ
	fNo1MbDbTmTsvgHXJ9q8hDuqwKfrjWZHPKf9tEVI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yZotDINmXcbiIZbNoOrx0WiMfnVOXkamM586SGbXij0=;
	b=VllNvHHs4AQBHbpbfCmPI7x95yLANASz7jBQMu2XzOO6fSOB4mLl0zOSb8BerL8E
	nUqU0CDkFFE1u2sL8ybYwM1lmNbpYSXxa8wxyR3qR25Ra6c/bEF5QmZqogPLA2sVmYv
	yfpwCh1lF9moYdyclcOTNcIvLAzl7RSNZIs2HrjE=
Content-Type: multipart/mixed; boundary="===============3561475502656137235=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.15.1 FAILED
Message-ID: <0101018f7d4fe22f-3adc8122-d904-44d6-b1dd-4773cfcb9fbd-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199350

--===============3561475502656137235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.15.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.15.0-4.15.1.patch
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
From ba3695c7344916bd3b9e69eb25d5d0b5d45097e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 12:24:19 +0000
Subject: [PATCH] shadow: upgrade 4.15.0 -> 4.15.1

---
 ...copy_entry-use-temporary-stat-buffer.patch | 37 -------------------
 ...nexpected-open-failure-in-chroot-env.patch |  2 +-
 .../shadow/files/shadow-update-pam-conf.patch |  2 +-
 meta/recipes-extended/shadow/shadow.inc       |  5 ++-
 .../{shadow_4.15.0.bb => shadow_4.15.1.bb}    |  0
 5 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
 rename meta/recipes-extended/shadow/{shadow_4.15.0.bb => shadow_4.15.1.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch b/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
deleted file mode 100644
index 2e5503bfd4..0000000000
--- a/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From af4b8cb780587aa736692a3baa76b60474f19c5d Mon Sep 17 00:00:00 2001
-From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
-Date: Mon, 18 Mar 2024 12:14:21 +0100
-Subject: [PATCH] lib/copydir:copy_entry(): use temporary stat buffer
-
-There are no guarantees that fstatat() does not clobber the stat
-buffer on errors.
-
-Use a temporary buffer so that the following code sees correct
-attributes of the source entry.
-
-Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/974]
-
-Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
----
- lib/copydir.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/lib/copydir.c
-+++ b/lib/copydir.c
-@@ -400,6 +400,7 @@ static int copy_entry (const struct path
- {
- 	int err = 0;
- 	struct stat sb;
-+	struct stat tmp_sb;
- 	struct link_name *lp;
- 	struct timespec mt[2];
- 
-@@ -423,7 +424,7 @@ static int copy_entry (const struct path
- 	* If the destination already exists do nothing.
- 	* This is after the copy_dir above to still iterate into subdirectories.
- 	*/
--	if (fstatat(dst->dirfd, dst->name, &sb, AT_SYMLINK_NOFOLLOW) != -1) {
-+	if (fstatat(dst->dirfd, dst->name, &tmp_sb, AT_SYMLINK_NOFOLLOW) != -1) {
- 		return err;
- 	}
- 
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index cd99aad135..aa17e59a6c 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f512071dd3a4c29d4bf048c5a89c4ba9160e37b1 Mon Sep 17 00:00:00 2001
+From 90d6eb8713c7c77f1d3732beeb8367c95afa97b4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 1eacb8a53f..537fd12af7 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From 38882ab288fd4d2cc2e45dff222ae3412c8fe357 Mon Sep 17 00:00:00 2001
+From a94d8e8253273aede304ca7a151adcd8659ebc7f Mon Sep 17 00:00:00 2001
 From: Kang Kai <kai.kang@windriver.com>
 Date: Wed, 20 Jul 2011 19:18:14 +0800
 Subject: [PATCH] shadow: update pam related configure files
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 25930b64c1..ee2e6bc919 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -12,9 +12,10 @@ DEPENDS = "virtual/crypt"
 
 GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-           file://0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://login_defs_pam.sed \
+           file://shadow-update-pam-conf.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -25,7 +26,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "377fe0d7c1a0aa5e3514c08fdf5ddc70c9dcbb391678c2134445ed97326bcc26"
+SRC_URI[sha256sum] = "b34686b89b279887ffbf1f33128902ccc0fa1a998a3add44213bb12d7385b218"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.15.0.bb b/meta/recipes-extended/shadow/shadow_4.15.1.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.15.0.bb
rename to meta/recipes-extended/shadow/shadow_4.15.1.bb
-- 
2.44.0


--===============3561475502656137235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-571a888d5abf1421ce4621993faaa44bae9e60d7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:571a888d5abf1421ce4621993faaa44bae9e60d7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 457 Local 429 Mirrors 0 Missed 28 Current 358 (93% match, 96% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 385 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_setscene)
NOTE: Running setscene task 444 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_setscene)
NOTE: Running setscene task 448 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 498 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_255.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 648 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 650 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 662 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 664 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 666 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 671 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 815 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 815 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jinja2-native-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-native-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 724 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 815 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 746 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1109 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_fetch)
NOTE: Running task 1162 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_fetch)
NOTE: Running task 1264 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1277 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1333 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Started
NOTE: Running task 1381 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: Running task 1411 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_warn_musl)
NOTE: Running task 1412 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1445 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_unpack)
NOTE: recipe shadow-native-4.15.1-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_fetch: Started
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 761 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-native-4.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1508 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_unpack)
NOTE: Running task 1509 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_255.4-r0: task do_fetch: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Started
NOTE: recipe systemd-1_255.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_255.4-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_write_config: Started
NOTE: Running setscene task 768 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_255.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 769 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 770 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-native-4.15.1-r0: task do_unpack: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 771 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 772 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_fetch: Succeeded
NOTE: Running task 1514 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_unpack)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-native-4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 774 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1520 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_unpack)
NOTE: Running setscene task 776 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1521 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: Running setscene task 778 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1522 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-native-4.15.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 783 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_unpack: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe shadow-4.15.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_255.4-r0: task do_unpack: Started
NOTE: Running setscene task 785 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 791 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1528 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1c0125cf2439354bc5b9d2d86d0c011da603c250ea3e952ab1960cc5517f8e0e
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.15.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_unpack: Succeeded
NOTE: Running task 1570 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_patch)
NOTE: recipe shadow-native-4.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1571 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1577 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_patch: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 794 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 797 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch unihash changed to 4328d693b06a63c4b40934e484f699430e3647c52a8892adde4f2ec5f7cbb5f7
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 798 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 805 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1580 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_configure)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_unpack: Succeeded
NOTE: Running task 1606 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_patch: Started
NOTE: recipe systemd-1_255.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1975 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2256 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_patch: Failed
NOTE: recipe shadow-native-4.15.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2274 tasks of which 2251 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515122349.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515122349.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-4.15.1-r0 do_patch: Applying patch 'shadow-update-pam-conf.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shadow/4.15.1/shadow-4.15.1'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shadow/4.15.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch shadow-update-pam-conf.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shadow/4.15.1/temp/log.do_patch.3716817
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch) failed with exit code '1'

--===============3561475502656137235==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.15.0-4.15.1.patch"

RnJvbSBiYTM2OTVjNzM0NDkxNmJkM2I5ZTY5ZWIyNWQ1ZDBiNWQ0NTA5N2U4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTI6MjQ6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkb3c6IHVwZ3JhZGUgNC4xNS4wIC0+IDQuMTUuMQoKLS0tCiAuLi5jb3B5X2VudHJ5LXVzZS10
ZW1wb3Jhcnktc3RhdC1idWZmZXIucGF0Y2ggfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5u
ZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2ggfCAgMiArLQogLi4uL3No
YWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoIHwgIDIgKy0KIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYyAgICAgICB8ICA1ICsrLQogLi4uL3tzaGFk
b3dfNC4xNS4wLmJiID0+IHNoYWRvd180LjE1LjEuYmJ9ICAgIHwgIDAKIDUgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzLzAwMDEtbGliLWNvcHlkaXItY29weV9l
bnRyeS11c2UtdGVtcG9yYXJ5LXN0YXQtYnVmZmVyLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3NoYWRvdy97c2hhZG93XzQuMTUuMC5iYiA9PiBzaGFkb3dfNC4xNS4xLmJifSAo
MTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzLzAw
MDEtbGliLWNvcHlkaXItY29weV9lbnRyeS11c2UtdGVtcG9yYXJ5LXN0YXQtYnVmZmVyLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy8wMDAxLWxpYi1jb3B5ZGlyLWNv
cHlfZW50cnktdXNlLXRlbXBvcmFyeS1zdGF0LWJ1ZmZlci5wYXRjaApkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMmU1NTAzYmZkNC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc2hhZG93L2ZpbGVzLzAwMDEtbGliLWNvcHlkaXItY29weV9lbnRyeS11c2UtdGVt
cG9yYXJ5LXN0YXQtYnVmZmVyLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzcgKzAsMCBAQAot
RnJvbSBhZjRiOGNiNzgwNTg3YWE3MzY2OTJhM2JhYTc2YjYwNDc0ZjE5YzVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQotRnJvbTogRW5yaWNvIFNjaG9seiA8ZW5yaWNvLnNjaG9sekBzaWdtYS1j
aGVtbml0ei5kZT4KLURhdGU6IE1vbiwgMTggTWFyIDIwMjQgMTI6MTQ6MjEgKzAxMDAKLVN1Ympl
Y3Q6IFtQQVRDSF0gbGliL2NvcHlkaXI6Y29weV9lbnRyeSgpOiB1c2UgdGVtcG9yYXJ5IHN0YXQg
YnVmZmVyCi0KLVRoZXJlIGFyZSBubyBndWFyYW50ZWVzIHRoYXQgZnN0YXRhdCgpIGRvZXMgbm90
IGNsb2JiZXIgdGhlIHN0YXQKLWJ1ZmZlciBvbiBlcnJvcnMuCi0KLVVzZSBhIHRlbXBvcmFyeSBi
dWZmZXIgc28gdGhhdCB0aGUgZm9sbG93aW5nIGNvZGUgc2VlcyBjb3JyZWN0Ci1hdHRyaWJ1dGVz
IG9mIHRoZSBzb3VyY2UgZW50cnkuCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRw
czovL2dpdGh1Yi5jb20vc2hhZG93LW1haW50L3NoYWRvdy9wdWxsLzk3NF0KLQotU2lnbmVkLW9m
Zi1ieTogRW5yaWNvIFNjaG9seiA8ZW5yaWNvLnNjaG9sekBzaWdtYS1jaGVtbml0ei5kZT4KLS0t
LQotIGxpYi9jb3B5ZGlyLmMgfCAzICsrLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKLQotLS0tIGEvbGliL2NvcHlkaXIuYwotKysrIGIvbGliL2NvcHlk
aXIuYwotQEAgLTQwMCw2ICs0MDAsNyBAQCBzdGF0aWMgaW50IGNvcHlfZW50cnkgKGNvbnN0IHN0
cnVjdCBwYXRoCi0gewotIAlpbnQgZXJyID0gMDsKLSAJc3RydWN0IHN0YXQgc2I7Ci0rCXN0cnVj
dCBzdGF0IHRtcF9zYjsKLSAJc3RydWN0IGxpbmtfbmFtZSAqbHA7Ci0gCXN0cnVjdCB0aW1lc3Bl
YyBtdFsyXTsKLSAKLUBAIC00MjMsNyArNDI0LDcgQEAgc3RhdGljIGludCBjb3B5X2VudHJ5IChj
b25zdCBzdHJ1Y3QgcGF0aAotIAkqIElmIHRoZSBkZXN0aW5hdGlvbiBhbHJlYWR5IGV4aXN0cyBk
byBub3RoaW5nLgotIAkqIFRoaXMgaXMgYWZ0ZXIgdGhlIGNvcHlfZGlyIGFib3ZlIHRvIHN0aWxs
IGl0ZXJhdGUgaW50byBzdWJkaXJlY3Rvcmllcy4KLSAJKi8KLS0JaWYgKGZzdGF0YXQoZHN0LT5k
aXJmZCwgZHN0LT5uYW1lLCAmc2IsIEFUX1NZTUxJTktfTk9GT0xMT1cpICE9IC0xKSB7Ci0rCWlm
IChmc3RhdGF0KGRzdC0+ZGlyZmQsIGRzdC0+bmFtZSwgJnRtcF9zYiwgQVRfU1lNTElOS19OT0ZP
TExPVykgIT0gLTEpIHsKLSAJCXJldHVybiBlcnI7Ci0gCX0KLSAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1v
cGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9z
aGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hy
b290LWVudi5wYXRjaAppbmRleCBjZDk5YWFkMTM1Li5hYTE3ZTU5YTZjIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0
ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVy
ZS1pbi1jaHJvb3QtZW52LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNTEyMDcxZGQzYTRj
MjlkNGJmMDQ4YzVhODljNGJhOTE2MGUzN2IxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5MGQ2ZWI4NzEzYzdjNzdmMWQzNzMyYmVlYjgzNjdjOTVhZmE5N2I0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTog
VGh1LCAxNyBKdWwgMjAxNCAxNTo1MzozNCArMDgwMAogU3ViamVjdDogW1BBVENIXSBjb21tb25p
by5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNv
bmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRh
dGUtcGFtLWNvbmYucGF0Y2gKaW5kZXggMWVhY2I4YTUzZi4uNTM3ZmQxMmFmNyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1j
b25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93
LXVwZGF0ZS1wYW0tY29uZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzg4ODJhYjI4OGZk
NGQyY2MyZTQ1ZGZmMjIyYWUzNDEyYzhmZTM1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYTk0ZDhlODI1MzI3M2FlZGUzMDRjYTdhMTUxYWRjZDg2NTllYmM3ZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEthbmcgS2FpIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0
ZTogV2VkLCAyMCBKdWwgMjAxMSAxOToxODoxNCArMDgwMAogU3ViamVjdDogW1BBVENIXSBzaGFk
b3c6IHVwZGF0ZSBwYW0gcmVsYXRlZCBjb25maWd1cmUgZmlsZXMKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zaGFkb3cvc2hhZG93LmluYwppbmRleCAyNTkzMGI2NGMxLi5lZTJlNmJjOTE5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvdy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jCkBAIC0xMiw5ICsxMiwxMCBAQCBERVBF
TkRTID0gInZpcnR1YWwvY3J5cHQiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1
Yi5jb20vc2hhZG93LW1haW50L3NoYWRvdy9yZWxlYXNlcyIKIFNSQ19VUkkgPSAiJHtHSVRIVUJf
QkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiBcCi0gICAgICAgICAgIGZpbGU6
Ly8wMDAxLWxpYi1jb3B5ZGlyLWNvcHlfZW50cnktdXNlLXRlbXBvcmFyeS1zdGF0LWJ1ZmZlci5w
YXRjaCBcCiAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywg
J3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXAogICAgICAgICAgICBmaWxlOi8vdXNl
cmFkZCBcCisgICAgICAgICAgIGZpbGU6Ly9sb2dpbl9kZWZzX3BhbS5zZWQgXAorICAgICAgICAg
ICBmaWxlOi8vc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaCBcCiAgICAgICAgICAgICIKIAog
U1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCkBAIC0yNSw3ICsyNiw3IEBAIFNSQ19V
Ukk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgXAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
ID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4t
ZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjM3N2ZlMGQ3YzFhMGFhNWUzNTE0YzA4ZmRmNWRkYzcwYzlkY2JiMzkxNjc4YzIx
MzQ0NDVlZDk3MzI2YmNjMjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjM0Njg2Yjg5YjI3OTg4
N2ZmYmYxZjMzMTI4OTAyY2NjMGZhMWE5OThhM2FkZDQ0MjEzYmIxMmQ3Mzg1YjIxOCIKIAogIyBB
ZGRpdGlvbmFsIFBvbGljeSBmaWxlcyBmb3IgUEFNCiBQQU1fU1JDX1VSSSA9ICJmaWxlOi8vcGFt
LmQvY2hmbiBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRv
d180LjE1LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE1LjEu
YmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zaGFkb3cvc2hhZG93XzQuMTUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NoYWRvdy9zaGFkb3dfNC4xNS4xLmJiCi0tIAoyLjQ0LjAKCg==

--===============3561475502656137235==--

