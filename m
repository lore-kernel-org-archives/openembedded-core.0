Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7F0C02182
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11335.1735723942690104267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L/vi834v;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0VSTA+bd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101942135a4b2-232c8c8e-c6ce-4a39-af4b-7c3ef6d91516-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+BbHqHtpPlHsF37RwvWK/Av8K7UYUWHj+LxhCCsMcTA=;
	b=L/vi834vxXb/Vi6FqCNb5F0iWKHqI6l1kUKxvtGvT5hzk8YBa1Gj42b8dqS1mIqg
	+GDgfEpezx5/JnPggMuGiCg85GWexHYXe3OdvRelOcC2Ml0MZ0l/ECb2ewMjbQGKZZM
	coWIyN32aamfC1i1kfXEfppR0ZPHANivn+Zboeiw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+BbHqHtpPlHsF37RwvWK/Av8K7UYUWHj+LxhCCsMcTA=;
	b=0VSTA+bdu1SkFgtleRV2D7h0o5XHjVhnhlzt5k41FWq01n0bdq3sXS5NpmhQrndq
	EhuwzXF3acNxcBh5Y6rsd9s8DUtm/nM/qA06TCBz/hBHM1gOpvD+A5kUUHXFQf64NTh
	JLEzhgdZEoOp+oVN/5T5QB+Nzign4AjuhBmJl6do=
Content-Type: multipart/mixed; boundary="===============1414682085670057246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.17.1 FAILED
Message-ID: <010101942135a4b2-232c8c8e-c6ce-4a39-af4b-7c3ef6d91516-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209229

--===============1414682085670057246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.17.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.16.0-4.17.1.patch
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
From 770021427cb04189b43b0d5472d53f1133c9d53e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 08:05:20 +0000
Subject: [PATCH] shadow: upgrade 4.16.0 -> 4.17.1

---
 ...mmonio.c-fix-unexpected-open-failure-in-chroot-env.patch | 6 +++---
 .../shadow/files/shadow-update-pam-conf.patch               | 2 +-
 meta/recipes-extended/shadow/shadow.inc                     | 4 +++-
 .../shadow/{shadow_4.16.0.bb => shadow_4.17.1.bb}           | 0
 4 files changed, 7 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.16.0.bb => shadow_4.17.1.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index cd99aad135..c9809342d5 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f512071dd3a4c29d4bf048c5a89c4ba9160e37b1 Mon Sep 17 00:00:00 2001
+From 3c5f57f458f4e994de8bcfde1c46bfa9e5381b7d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 01a26c9..82b2868 100644
+index 4d83e83..9ee0e13 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -601,10 +601,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 1eacb8a53f..be9ab80ad6 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From 38882ab288fd4d2cc2e45dff222ae3412c8fe357 Mon Sep 17 00:00:00 2001
+From 3befd2ea1383455e9431033d6c4f78f0dd143e7a Mon Sep 17 00:00:00 2001
 From: Kang Kai <kai.kang@windriver.com>
 Date: Wed, 20 Jul 2011 19:18:14 +0800
 Subject: [PATCH] shadow: update pam related configure files
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 6ba5a9c7f1..3b54a41bb5 100644
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
-SRC_URI[sha256sum] = "1744f339e07a2b41056347ddd612839762ff565d7e9494fb049428002fa2e7e0"
+SRC_URI[sha256sum] = "51a946bbce141c5de14b6d47cab167206cd685d2307e917611dbc1be46c84a18"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.16.0.bb b/meta/recipes-extended/shadow/shadow_4.17.1.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.16.0.bb
rename to meta/recipes-extended/shadow/shadow_4.17.1.bb
-- 
2.44.1


--===============1414682085670057246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ff3540d6756fd098144bfea8b0996a5170b590eb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 406 Local 375 Mirrors 0 Missed 31 Current 460 (92% match, 96% complete)
Removing 9 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 724 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_setscene)
NOTE: Running setscene task 746 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 751 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 755 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package_setscene)
NOTE: Running setscene task 813 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 837 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_256.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 851 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 854 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 855 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_256.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1377 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_recipe_qa)
NOTE: Running task 1466 of 2462 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_recipe_qa)
NOTE: Running task 1588 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.9.bb:do_fetch)
NOTE: Running task 1599 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa: Started
NOTE: Running task 1692 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: Running task 1718 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.9.bb:do_warn_musl)
NOTE: Running task 1719 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.9.bb:do_write_config)
NOTE: recipe shadow-native-4.17.1-r0: task do_recipe_qa: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe systemd-1_256.9-r0: task do_fetch: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_256.9-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_256.9-r0: task do_write_config: Started
NOTE: recipe systemd-1_256.9-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_256.9-r0: task do_write_config: Succeeded
NOTE: recipe shadow-native-4.17.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1821 of 2462 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_fetch)
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1823 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_fetch)
NOTE: recipe systemd-1_256.9-r0: task do_fetch: Succeeded
NOTE: Running task 1824 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.9.bb:do_unpack)
NOTE: recipe shadow-native-4.17.1-r0: task do_fetch: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.1-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.17.1-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 2462 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_unpack)
NOTE: Running task 1826 of 2462 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.17.1-r0: task do_fetch: Succeeded
NOTE: Running task 1827 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_unpack)
NOTE: recipe systemd-1_256.9-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.17.1-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.17.1-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1828 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe shadow-native-4.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1830 of 2462 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_patch)
NOTE: recipe shadow-native-4.17.1-r0: task do_patch: Started
NOTE: recipe systemd-1_256.9-r0: task do_unpack: Succeeded
NOTE: Running task 1831 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.9.bb:do_patch)
NOTE: recipe systemd-1_256.9-r0: task do_patch: Started
NOTE: recipe shadow-4.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1832 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_patch)
NOTE: recipe systemd-1_256.9-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_patch: Started
NOTE: recipe shadow-4.17.1-r0: task do_patch: Succeeded
NOTE: Running task 1834 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1835 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_populate_lic)
NOTE: recipe shadow-4.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.17.1-r0: task do_populate_lic: Started
NOTE: recipe shadow-4.17.1-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 862 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1841 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1842 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 863 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 866 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2142 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2399 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.17.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2418 of 2462 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_configure)
NOTE: recipe shadow-4.17.1-r0: task do_configure: Started
NOTE: recipe shadow-native-4.17.1-r0: task do_patch: Failed
NOTE: recipe shadow-4.17.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2418 tasks of which 2393 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250101080455.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250101080455.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.17.1/temp/log.do_patch.1892862
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.17.1-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.17.1/shadow-4.17.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.17.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.17.1/temp/log.do_patch.1892862
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_patch) failed with exit code '1'

--===============1414682085670057246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.16.0-4.17.1.patch"

RnJvbSA3NzAwMjE0MjdjYjA0MTg5YjQzYjBkNTQ3MmQ1M2YxMTMzYzlkNTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwODowNToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRvdzogdXBncmFkZSA0LjE2LjAgLT4gNC4xNy4xCgotLS0KIC4uLm1tb25pby5jLWZpeC11bmV4
cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIHwgNiArKystLS0KIC4uLi9z
aGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaCAgICAgICAgICAgICAgIHwg
MiArLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jICAgICAgICAgICAg
ICAgICAgICAgfCA0ICsrKy0KIC4uLi9zaGFkb3cve3NoYWRvd180LjE2LjAuYmIgPT4gc2hhZG93
XzQuMTcuMS5iYn0gICAgICAgICAgIHwgMAogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy97
c2hhZG93XzQuMTYuMC5iYiA9PiBzaGFkb3dfNC4xNy4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhw
ZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJl
LWluLWNocm9vdC1lbnYucGF0Y2gKaW5kZXggY2Q5OWFhZDEzNS4uYzk4MDkzNDJkNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11
bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVu
LWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjUxMjA3
MWRkM2E0YzI5ZDRiZjA0OGM1YTg5YzRiYTkxNjBlMzdiMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gM2M1ZjU3ZjQ1OGY0ZTk5NGRlOGJjZmRlMWM0NmJmYTllNTM4MWI3ZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4K
IERhdGU6IFRodSwgMTcgSnVsIDIwMTQgMTU6NTM6MzQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
Y29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudgpAQCAt
MjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVy
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL2xpYi9jb21tb25pby5jIGIvbGliL2NvbW1vbmlvLmMKLWluZGV4IDAx
YTI2YzkuLjgyYjI4NjggMTAwNjQ0CitpbmRleCA0ZDgzZTgzLi45ZWUwZTEzIDEwMDY0NAogLS0t
IGEvbGliL2NvbW1vbmlvLmMKICsrKyBiL2xpYi9jb21tb25pby5jCi1AQCAtNjAxLDEwICs2MDEs
MTggQEAgaW50IGNvbW1vbmlvX29wZW4gKHN0cnVjdCBjb21tb25pb19kYiAqZGIsIGludCBtb2Rl
KQorQEAgLTYwNCwxMCArNjA0LDE4IEBAIGludCBjb21tb25pb19vcGVuIChzdHJ1Y3QgY29tbW9u
aW9fZGIgKmRiLCBpbnQgbW9kZSkKICAJZGItPmN1cnNvciA9IE5VTEw7CiAgCWRiLT5jaGFuZ2Vk
ID0gZmFsc2U7CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2Zp
bGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKaW5kZXggMWVhY2I4YTUz
Zi4uYmU5YWI4MGFkNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9m
aWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gMzg4ODJhYjI4OGZkNGQyY2MyZTQ1ZGZmMjIyYWUzNDEyYzhmZTM1NyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2JlZmQyZWExMzgzNDU1ZTk0MzEwMzNkNmM0Zjc4
ZjBkZDE0M2U3YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthbmcgS2FpIDxrYWku
a2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyMCBKdWwgMjAxMSAxOToxODoxNCArMDgw
MAogU3ViamVjdDogW1BBVENIXSBzaGFkb3c6IHVwZGF0ZSBwYW0gcmVsYXRlZCBjb25maWd1cmUg
ZmlsZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93Lmlu
YyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYwppbmRleCA2YmE1YTlj
N2YxLi4zYjU0YTQxYmI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93
L3NoYWRvdy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5j
CkBAIC0xNCw2ICsxNCw4IEBAIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20v
c2hhZG93LW1haW50L3NoYWRvdy9yZWxlYXNlcyIKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9V
Ukl9L2Rvd25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBk
KX0gXAogICAgICAgICAgICBmaWxlOi8vdXNlcmFkZCBcCisgICAgICAgICAgIGZpbGU6Ly9sb2dp
bl9kZWZzX3BhbS5zZWQgXAorICAgICAgICAgICBmaWxlOi8vY29tbW9uaW8uYy1maXgtdW5leHBl
Y3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCBcCiAgICAgICAgICAgICIKIAog
U1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCkBAIC0yNCw3ICsyNiw3IEBAIFNSQ19V
Ukk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgXAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
ID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4t
ZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjE3NDRmMzM5ZTA3YTJiNDEwNTYzNDdkZGQ2MTI4Mzk3NjJmZjU2NWQ3ZTk0OTRm
YjA0OTQyODAwMmZhMmU3ZTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTFhOTQ2YmJjZTE0MWM1
ZGUxNGI2ZDQ3Y2FiMTY3MjA2Y2Q2ODVkMjMwN2U5MTc2MTFkYmMxYmU0NmM4NGExOCIKIAogIyBB
ZGRpdGlvbmFsIFBvbGljeSBmaWxlcyBmb3IgUEFNCiBQQU1fU1JDX1VSSSA9ICJmaWxlOi8vcGFt
LmQvY2hmbiBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRv
d180LjE2LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE3LjEu
YmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zaGFkb3cvc2hhZG93XzQuMTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NoYWRvdy9zaGFkb3dfNC4xNy4xLmJiCi0tIAoyLjQ0LjEKCg==

--===============1414682085670057246==--

