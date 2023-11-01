Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0266C25B4C
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8642.1698848703090742029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cO0lLiHe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lot0wCNQ;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b45fe92-6cf7ba5a-3047-4850-804d-610f33e8e944-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7l+cqU6CrznhpgY2+brS55xpIHwm9NqZORkXa9HEwxM=;
	b=cO0lLiHeKEqTtc6+b+1ecGoE8IZ2vxrCUm2KF8ivpPsWiijLe11JRaqAcSIn0wZd
	1JDuScqePIHHMAGe/TaE+1WI1ZojHqAcHbY5Um5T5QwP8dKKeqYH6GO16scx3OoEfs7
	NEKEE7oY1neOZ3e2hwAkQ2tmfbq/MJmtrYw2mBus=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7l+cqU6CrznhpgY2+brS55xpIHwm9NqZORkXa9HEwxM=;
	b=lot0wCNQZJelyZnmE3mV0wL6l6N/W5tNLErwimzQ63jYv0xAsv4gVvjKvaUHSTjv
	4ZNdSQgv9Y/2tLmMxdZMamXnbtl2/kEDT5jUocn0S4QhRzCPirhYMhfzqr21vC+8M1j
	GKlXIimrM2ZacILL9gVldtjz4AJvw46UdzsC+HtA=
Content-Type: multipart/mixed; boundary="===============7818346932990598021=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus-wait: upgrading to
 64bc7c8fae61ded0c4e555aa775911f84c56e438 SUCCEEDED
Message-ID: <0101018b8b45fe92-6cf7ba5a-3047-4850-804d-610f33e8e944-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189923

--===============7818346932990598021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus-wait* to *64bc7c8fae61ded0c4e555aa775911f84c56e438* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dbus-wait-upgrade-to-latest-revision.patch
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
From 4d508ca3652005101c6235d75b6442e67ef1c5f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 05:50:19 +0000
Subject: [PATCH] dbus-wait: upgrade to latest revision

---
 meta/recipes-core/dbus-wait/dbus-wait_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 1cdf07d03d..39363b9b3a 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "dbus"
 
-SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
+SRCREV = "64bc7c8fae61ded0c4e555aa775911f84c56e438"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
-- 
2.39.2


--===============7818346932990598021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dbus-wait/dbus-wait-dbg: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-dev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-doc: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-locale: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-src: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-staticdev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae

--===============7818346932990598021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3e53ab6da45371231424b0bc56baf10b59a4869a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3e53ab6da45371231424b0bc56baf10b59a4869a"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 125 Local 9 Mirrors 0 Missed 116 Current 445 (7% match, 79% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 446 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running task 998 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa)
NOTE: Running task 1026 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa)
NOTE: Running task 1030 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa)
NOTE: Running task 1051 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa)
NOTE: Running task 1052 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa)
NOTE: Running task 1053 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa)
NOTE: Running task 1061 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa)
NOTE: Running task 1109 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa)
NOTE: Running task 1118 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_write_config)
NOTE: Running task 1119 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 1126 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa)
NOTE: Running task 1127 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa)
NOTE: Running task 1128 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa)
NOTE: Running task 1129 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa)
NOTE: Running task 1138 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa)
NOTE: Running task 1139 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa)
NOTE: Running task 1150 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa)
NOTE: Running task 1151 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa)
NOTE: Running task 1159 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa)
NOTE: Running task 1211 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_write_config: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_write_config: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/base-passwd/3.6.1/temp/log.do_packagedata_setscene.30885
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 567 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1217 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 1218 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 1219 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_fetch)
NOTE: Running task 1220 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 1221 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 1222 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_fetch)
NOTE: Running task 1223 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 1224 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_fetch)
NOTE: Running task 1225 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 1226 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1227 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_fetch)
NOTE: Running task 1228 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1229 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1230 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: Running task 1232 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1233 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_fetch)
NOTE: Running task 1234 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: Running task 1271 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_recipe_qa: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1335 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1336 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1337 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 1338 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 1340 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 1342 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1343 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_fetch: Succeeded
NOTE: Running task 1344 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_unpack)
NOTE: Running task 1345 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: Running task 1346 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_unpack)
NOTE: Running task 1347 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1348 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_unpack)
NOTE: Running task 1349 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1350 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1351 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1353 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_unpack)
NOTE: Running task 1354 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 1355 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1356 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 1357 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1358 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: Running task 1359 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1360 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Started
NOTE: Running task 1361 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1362 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: Running task 1363 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_fetch: Started
NOTE: Running task 1364 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1365 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_collect_spdx_deps)
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1366 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: Running task 1367 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1368 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1369 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: Running task 1370 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: recipe dbus-wait-0.1+git-r0: task do_fetch: Succeeded
NOTE: Running task 1371 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1372 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 1373 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 1374 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: Running task 1375 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 1376 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe xcb-proto-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1377 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_patch)
NOTE: Running task 1378 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1379 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1380 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libffi-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: Running task 1382 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1383 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xcb-proto-1.16.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 1400 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata)
NOTE: recipe xcb-proto-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 1402 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1403 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 1407 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1408 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1409 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1410 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1411 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1412 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: Running task 1413 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1414 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1415 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1416 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: Running task 1417 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1418 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1419 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe dbus-wait-0.1+git-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1420 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_patch)
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1421 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1422 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1423 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_patch)
NOTE: Running task 1424 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 458c0c6ac781fde126e5353fe378356c35d45f3d649603399a6021a03dfb4916
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1425 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: Running task 1429 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_configure)
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_patch: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_patch: Succeeded
NOTE: Running task 1430 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1431 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_populate_lic)
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1432 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_populate_lic: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1433 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe xcb-proto-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1434 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_configure)
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_populate_lic: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1435 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: Setscene tasks completed
NOTE: Running task 1437 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Succeeded
NOTE: Running task 1438 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_compile)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1439 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1440 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Succeeded
NOTE: Running task 1441 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2023.2-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1442 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_compile)
NOTE: recipe xorgproto-2023.2-r0: task do_install: Succeeded
NOTE: Running task 1443 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot)
NOTE: Running task 1444 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package)
NOTE: recipe util-macros-1_1.20.0-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_install)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_install: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1446 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_compile)
NOTE: recipe xcb-proto-1.16.0-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1447 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1448 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_package)
NOTE: recipe xcb-proto-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_install)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_package: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1450 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1451 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1452 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Running task 1455 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot)
NOTE: Running task 1456 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe xcb-proto-1.16.0-r0: task do_install: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1457 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1458 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_configure)
NOTE: Running task 1459 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1460 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_configure)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Succeeded
NOTE: Running task 1462 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1463 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_package: Succeeded
NOTE: Running task 1464 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1465 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 1466 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1467 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: Running task 1468 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_create_spdx)
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1470 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 1471 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1472 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: Running task 1473 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: recipe xtrans-1_1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1474 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1475 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1476 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1477 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1478 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1479 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1480 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1481 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1482 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1483 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1484 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1485 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1486 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_compile)
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_compile: Started
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_configure)
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1491 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.5.0-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 1493 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_package)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1494 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1495 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1496 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 1497 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1498 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1499 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_package: Succeeded
NOTE: Running task 1500 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1501 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1502 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1503 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1504 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1505 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_collect_spdx_deps)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1506 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1507 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 1508 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1509 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_install)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1510 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 1511 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1512 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1514 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1515 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_configure)
NOTE: recipe libxcb-1.16-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: Running task 1517 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1518 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1519 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1520 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1521 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.16-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_configure: Succeeded
NOTE: Running task 1522 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1524 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1526 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1527 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1529 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1530 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1531 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_configure: Succeeded
NOTE: Running task 1532 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_compile)
NOTE: recipe libxcb-1.16-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_install: Succeeded
NOTE: Running task 1534 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot)
NOTE: Running task 1535 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_package)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1536 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1537 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_configure: Started
NOTE: recipe libxcb-1.16-r0: task do_compile: Succeeded
NOTE: Running task 1538 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_install)
NOTE: recipe libxcb-1.16-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1540 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Succeeded
NOTE: Running task 1541 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx)
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1542 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 1543 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1544 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1545 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libxcb-1.16-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot)
NOTE: Running task 1547 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_package)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.16-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1548 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1549 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_configure)
NOTE: recipe libx11-1_1.8.7-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1550 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1551 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_package: Succeeded
NOTE: Running task 1552 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata)
NOTE: recipe libxcb-1.16-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata: Succeeded
NOTE: Running task 1553 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx: Succeeded
NOTE: Running task 1554 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_configure: Succeeded
NOTE: Running task 1555 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1556 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1557 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_compile)
NOTE: recipe libx11-1_1.8.7-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_compile: Succeeded
NOTE: Running task 1558 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_install: Succeeded
NOTE: Running task 1560 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1561 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot)
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_install)
NOTE: recipe libx11-1_1.8.7-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_install: Succeeded
NOTE: Running task 1564 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_package)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1567 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_package: Succeeded
NOTE: Running task 1570 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1571 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1572 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_configure: Succeeded
NOTE: Running task 1573 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1574 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile)
NOTE: recipe dbus-1.14.10-r0: task do_compile: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile: Succeeded
NOTE: Running task 1575 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1576 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install)
NOTE: recipe dbus-1.14.10-r0: task do_install: Started
NOTE: recipe dbus-1.14.10-r0: task do_install: Succeeded
NOTE: Running task 1577 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package)
NOTE: Running task 1579 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_package: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-wait-0.1+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_configure)
NOTE: recipe dbus-wait-0.1+git-r0: task do_configure: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_compile)
NOTE: recipe dbus-wait-0.1+git-r0: task do_compile: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_compile: Succeeded
NOTE: Running task 1583 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_install)
NOTE: recipe dbus-wait-0.1+git-r0: task do_install: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_install: Succeeded
NOTE: Running task 1584 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata)
NOTE: recipe dbus-wait-0.1+git-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1586 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_package)
NOTE: Running task 1587 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx)
NOTE: recipe dbus-wait-0.1+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_package: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 1588 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_collect_spdx_deps)
NOTE: recipe dbus-wait-0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_package: Succeeded
NOTE: Running task 1589 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_packagedata)
NOTE: recipe dbus-wait-0.1+git-r0: task do_packagedata: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_packagedata: Succeeded
NOTE: Running task 1590 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_create_spdx)
NOTE: Running task 1591 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_package_write_rpm)
NOTE: Running task 1592 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_package_qa)
NOTE: recipe dbus-wait-0.1+git-r0: task do_create_spdx: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_package_qa: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1593 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_create_runtime_spdx)
NOTE: recipe dbus-wait-0.1+git-r0: task do_package_qa: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_create_runtime_spdx: Started
NOTE: recipe dbus-wait-0.1+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-wait-0.1+git-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 1594 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus-wait/dbus-wait_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1594 tasks of which 1316 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-src went backwards which would break package feeds (from 0:3.6.2-r0 to 0:3.6.1-r0) [version-going-backwards]
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-dbg went backwards which would break package feeds (from 0:3.6.2-r0 to 0:3.6.1-r0) [version-going-backwards]
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-update went backwards which would break package feeds (from 0:3.6.2-r0 to 0:3.6.1-r0) [version-going-backwards]
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-staticdev went backwards which would break package feeds (from 0:3.6.2-r0 to 0:3.6.1-r0) [version-going-backwards]
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-dev went backwards which would break package feeds (from 0:3.6.2-r0 to 0:3.6.1-r0) [version-going-backwards]
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-doc went backwards which would break package feeds (from 0:3.6.2-r0 to 0:3.6.1-r0) [version-going-backwards]
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-locale went backwards which would break package feeds (from 0:3.6.2-r0 to 0:3.6.1-r0) [version-going-backwards]
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd went backwards which would break package feeds (from 0:3.6.2-r0 to 0:3.6.1-r0) [version-going-backwards]
ERROR: base-passwd-3.6.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7818346932990598021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dbus-wait/dbus-wait-dbg: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-dev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-doc: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-locale: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-src: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-staticdev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae

--===============7818346932990598021==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dbus-wait-upgrade-to-latest-revision.patch"

RnJvbSA0ZDUwOGNhMzY1MjAwNTEwMWM2MjM1ZDc1YjY0NDJlNjdlZjFjNWY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNTo1MDoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRi
dXMtd2FpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWNv
cmUvZGJ1cy13YWl0L2RidXMtd2FpdF9naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9kYnVzLXdhaXQvZGJ1cy13YWl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2RidXMtd2Fp
dC9kYnVzLXdhaXRfZ2l0LmJiCmluZGV4IDFjZGYwN2QwM2QuLjM5MzYzYjliM2EgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL2RidXMtd2FpdC9kYnVzLXdhaXRfZ2l0LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL2RidXMtd2FpdC9kYnVzLXdhaXRfZ2l0LmJiCkBAIC03LDcgKzcsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0
NDg2YTgwZmRhZjRhNDI2MyIKIAogREVQRU5EUyA9ICJkYnVzIgogCi1TUkNSRVYgPSAiNmNjNjA3
N2EzNmZlMjY0OGE1Zjk5M2ZlN2MxNmM5NjMyZjk0NjUxNyIKK1NSQ1JFViA9ICI2NGJjN2M4ZmFl
NjFkZWQwYzRlNTU1YWE3NzU5MTFmODRjNTZlNDM4IgogUFYgPSAiMC4xK2dpdCIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy8ke0JQTn07YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwcyIKLS0gCjIuMzkuMgoK

--===============7818346932990598021==--

