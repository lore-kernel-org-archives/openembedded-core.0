Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8ECC2FC13
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.798.1686887481587551444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JHbaQ57S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c2544113-f2e97704-1619-4424-8040-faa17d4674fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wn3z9X78mnY9/cGhDiQMKks7pXLFSWleeQ/VpzxC/n8=;
	b=JHbaQ57SRSsCMOepW2N1QzWEobzCOSW9lyZW7pY/rgkJkF74YG5H6ETHlve15VbQ
	azrJ3BpdLvFW6b4rgzGWJcloO+VyRioX0Y39/lbGRhJtWiV38g98ub1UqckA7rGPDXP
	sA/qklGz9wq8xHrA3GvS/TAp5U/RiKCaLPq8UUw8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wn3z9X78mnY9/cGhDiQMKks7pXLFSWleeQ/VpzxC/n8=;
	b=HuGaGtgfl6VfXQQlUCd7NYhkZjvqFAIL1imLJHJg6Thw5lIjfU6qUMl1B8cjZpEy
	np6ruUPnlolF84U6oHh50XZtPuq4Pb2xf6fROswau/aLSbRRlHID28zkBhF4/XHWz2+
	Hsui47VLeRDfp0To6mMpGou3442l7ANw1Yvy54Nc=
Content-Type: multipart/mixed; boundary="===============8480220145275641289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 253.5 SUCCEEDED
Message-ID: <01010188c2544113-f2e97704-1619-4424-8040-faa17d4674fa-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182896

--===============8480220145275641289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *253.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-253.3-253.5.patch
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
From b2fcdc42cabb61a8999e6b9f9e995cdf7d5c02f0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 07:45:41 +0000
Subject: [PATCH] systemd-boot: upgrade 253.3 -> 253.5

---
 .../systemd/{systemd-boot_253.3.bb => systemd-boot_253.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_253.3.bb => systemd-boot_253.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_253.3.bb b/meta/recipes-core/systemd/systemd-boot_253.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_253.3.bb
rename to meta/recipes-core/systemd/systemd-boot_253.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index d50f2c9cba..87636ac452 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "ed18c2ab79e8b94182d5dcf31d58457763f3e3e1"
+SRCREV = "991158e8b9a6f6907ae4ea11fc61163da7936b04"
 SRCBRANCH = "v253-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
-- 
2.39.2


--===============8480220145275641289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (896 cached, 2 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2c856c93723dcf5316e4a48bcda5b58e901cdf95"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 7 Mirrors 0 Missed 20 Current 315 (25% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 317 of 342 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 342 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 964 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_fetch)
NOTE: Running task 981 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_fetch)
NOTE: Running task 1015 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 1060 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcrypt/4.4.33-r0/temp/log.do_packagedata_setscene.2764826
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 341 of 342 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package_setscene)
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_write_config: Started
NOTE: recipe systemd-boot-253.5-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_write_config: Succeeded
NOTE: Running task 1101 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_unpack)
NOTE: Running task 1102 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_unpack)
NOTE: Running task 1103 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1104 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: Running task 1105 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_unpack: Started
NOTE: Running task 1106 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: Running task 1107 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_collect_spdx_deps)
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Succeeded
NOTE: Running task 1108 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_patch)
NOTE: Running task 1109 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_collect_spdx_deps)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 1110 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1112 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1113 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1136 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata)
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 1147 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: Running task 1148 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_compile)
NOTE: Running task 1149 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe systemd-boot-253.5-r0: task do_unpack: Succeeded
NOTE: Running task 1150 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_patch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: Running task 1164 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe systemd-boot-253.5-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1166 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_populate_lic)
NOTE: recipe systemd-boot-253.5-r0: task do_populate_lic: Started
NOTE: recipe systemd-boot-253.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-253.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_populate_lic unihash changed to 234d387b1332d864b0622b23d5ac5c94bf50b16cc695f3d01c77c50052064d9a
NOTE: recipe systemd-boot-253.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_install)
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_package)
NOTE: Running task 1169 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_populate_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 1171 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_create_spdx)
NOTE: Running task 1172 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1173 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_create_spdx: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-253.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1174 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_configure)
NOTE: recipe systemd-boot-253.5-r0: task do_configure: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Succeeded
NOTE: Running task 1175 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1176 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_create_spdx)
NOTE: recipe gnu-efi-3.0.15-r0: task do_create_spdx: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 1177 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_collect_spdx_deps)
NOTE: recipe systemd-boot-253.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-boot-253.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_configure: Succeeded
NOTE: Running task 1178 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_compile)
NOTE: recipe systemd-boot-253.5-r0: task do_compile: Started
NOTE: recipe systemd-boot-253.5-r0: task do_compile: Succeeded
NOTE: Running task 1179 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_install)
NOTE: Running task 1180 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_deploy)
NOTE: recipe systemd-boot-253.5-r0: task do_deploy: Started
NOTE: recipe systemd-boot-253.5-r0: task do_install: Started
NOTE: recipe systemd-boot-253.5-r0: task do_deploy: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_install: Succeeded
NOTE: Running task 1181 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_package)
NOTE: Running task 1182 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_populate_sysroot)
NOTE: recipe systemd-boot-253.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-boot-253.5-r0: task do_package: Started
NOTE: recipe systemd-boot-253.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_package: Succeeded
NOTE: Running task 1183 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_packagedata)
NOTE: recipe systemd-boot-253.5-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-253.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1184 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_create_spdx)
NOTE: Running task 1185 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_package_write_rpm)
NOTE: Running task 1186 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_package_qa)
NOTE: recipe systemd-boot-253.5-r0: task do_create_spdx: Started
NOTE: recipe systemd-boot-253.5-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-253.5-r0: task do_package_qa: Started
NOTE: recipe systemd-boot-253.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 1187 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_create_runtime_spdx)
NOTE: recipe systemd-boot-253.5-r0: task do_package_qa: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe systemd-boot-253.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1188 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1188 tasks of which 1141 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8480220145275641289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PKGV changed from 253.3 [default] to 253.5 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "253.3" to "253.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 253.3 [default] to 253.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "253.3" to "253.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 253.3 [default] to 253.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "253.3" to "253.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 253.3 [default] to 253.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "253.3" to "253.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 253.3 [default] to 253.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "253.3" to "253.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 253.3 [default] to 253.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "253.3" to "253.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 253.3 [default] to 253.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "253.3" to "253.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 253.3 [default] to 253.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGSIZE changed from 96256 to 96768 (+1%)
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "253.3" to "253.5"

--===============8480220145275641289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2c856c93723dcf5316e4a48bcda5b58e901cdf95"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 7 Mirrors 0 Missed 20 Current 315 (25% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 317 of 342 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 342 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running task 964 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_fetch)
NOTE: Running task 981 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_fetch)
NOTE: Running task 1015 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1060 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_write_config)
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: Running task 1102 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-253.5-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Succeeded
NOTE: Running task 1103 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_unpack)
NOTE: Running task 1104 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-253.5-r0: task do_write_config: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxcrypt/4.4.33-r0/temp/log.do_packagedata_setscene.2772806
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 341 of 342 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package_setscene)
NOTE: recipe libxcrypt-4.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_write_config: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Succeeded
NOTE: Running task 1105 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_patch)
NOTE: Running task 1106 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_unpack)
NOTE: Running task 1107 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: Running task 1108 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_collect_spdx_deps)
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1109 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_collect_spdx_deps)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Started
NOTE: recipe systemd-boot-253.5-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 1110 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe gnu-efi-3.0.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1112 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1113 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 1114 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package_setscene: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Succeeded
NOTE: Running task 1137 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata)
NOTE: Running task 1143 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_compile)
NOTE: Running task 1149 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe systemd-boot-253.5-r0: task do_unpack: Succeeded
NOTE: Running task 1150 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: Running task 1151 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe systemd-boot-253.5-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1166 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_populate_lic)
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_install)
NOTE: recipe systemd-boot-253.5-r0: task do_populate_lic: Started
NOTE: recipe systemd-boot-253.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Started
NOTE: recipe systemd-boot-253.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_populate_lic unihash changed to 234d387b1332d864b0622b23d5ac5c94bf50b16cc695f3d01c77c50052064d9a
NOTE: recipe systemd-boot-253.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_package)
NOTE: Running task 1169 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_populate_sysroot)
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1170 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 1171 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe systemd-boot-253.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 1172 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_create_spdx)
NOTE: Running task 1173 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe systemd-bootconf-1.00-r0: task do_create_spdx: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-253.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1174 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_configure)
NOTE: recipe systemd-boot-253.5-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Succeeded
NOTE: Running task 1175 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 1176 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_create_spdx)
NOTE: recipe gnu-efi-3.0.15-r0: task do_create_spdx: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 1177 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_collect_spdx_deps)
NOTE: recipe systemd-boot-253.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-boot-253.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_configure: Succeeded
NOTE: Running task 1178 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_compile)
NOTE: recipe systemd-boot-253.5-r0: task do_compile: Started
NOTE: recipe systemd-boot-253.5-r0: task do_compile: Succeeded
NOTE: Running task 1179 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_install)
NOTE: Running task 1180 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_deploy)
NOTE: recipe systemd-boot-253.5-r0: task do_deploy: Started
NOTE: recipe systemd-boot-253.5-r0: task do_install: Started
NOTE: recipe systemd-boot-253.5-r0: task do_deploy: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_install: Succeeded
NOTE: Running task 1181 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_package)
NOTE: Running task 1182 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_populate_sysroot)
NOTE: recipe systemd-boot-253.5-r0: task do_package: Started
NOTE: recipe systemd-boot-253.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-boot-253.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_package: Succeeded
NOTE: Running task 1183 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_packagedata)
NOTE: recipe systemd-boot-253.5-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-253.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1184 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_create_spdx)
NOTE: Running task 1185 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_package_write_rpm)
NOTE: Running task 1186 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_package_qa)
NOTE: recipe systemd-boot-253.5-r0: task do_create_spdx: Started
NOTE: recipe systemd-boot-253.5-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-253.5-r0: task do_package_qa: Started
NOTE: recipe systemd-boot-253.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 1187 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_create_runtime_spdx)
NOTE: recipe systemd-boot-253.5-r0: task do_package_qa: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe systemd-boot-253.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-boot-253.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 1188 of 1188 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_253.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1188 tasks of which 1141 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.35-r0 to 0:4.4.33-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.33-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8480220145275641289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============8480220145275641289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-253.3-253.5.patch"

RnJvbSBiMmZjZGM0MmNhYmI2MWE4OTk5ZTZiOWY5ZTk5NWNkZjdkNWMwMmYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDc6NDU6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjUzLjMgLT4gMjUzLjUKCi0tLQogLi4uL3N5c3RlbWQve3N5
c3RlbWQtYm9vdF8yNTMuMy5iYiA9PiBzeXN0ZW1kLWJvb3RfMjUzLjUuYmJ9ICAgIHwgMAogbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTMuMy5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjUzLjUuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1My4zLmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjUzLjUuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1My4zLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTMuNS5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggZDUwZjJjOWNiYS4uODc2
MzZhYzQ1MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNCw3ICsx
NCw3IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQTC0yLjEtb25seSIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2Fi
YWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4x
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gImVkMThj
MmFiNzllOGI5NDE4MmQ1ZGNmMzFkNTg0NTc3NjNmM2UzZTEiCitTUkNSRVYgPSAiOTkxMTU4ZThi
OWE2ZjY5MDdhZTRlYTExZmM2MTE2M2RhNzkzNmIwNCIKIFNSQ0JSQU5DSCA9ICJ2MjUzLXN0YWJs
ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IFwKICAgICAgICAgICAgZmlsZTov
LzAwMjYtc3JjLWJvb3QtZWZpLWVmaS1zdHJpbmcuYy1kZWZpbmUtd2NoYXJfdC1mcm9tLV9fV0NI
QS5wYXRjaCBcCi0tIAoyLjM5LjIKCg==

--===============8480220145275641289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============8480220145275641289==--

