Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8B3C3DA45
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.174029.1692224343998168276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Gmhyrhiv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aFAa3UmP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a006e4be0-79b12fe8-9b54-4269-a32b-d4eacfc5841f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cNJNSoIoV5HVwG+1X7VYNgcGBq0Xqu7oz0KtOJI87Ow=;
	b=Gmhyrhiv1YUzdK3God8B8gSzjPOUGzG6D4iUVRySmVae9MBZoGNo77wifXkjBrdB
	f0wf5t3eVSd8CEZ3+S7ilax0XUB/dHILTjl5gTgnyTlnRw/XbYiWw8q2zhgTx1PIc/s
	2HC9RZJ/sTxoUqocKA67vvFQb+N/cvQEuvq0Nsug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cNJNSoIoV5HVwG+1X7VYNgcGBq0Xqu7oz0KtOJI87Ow=;
	b=aFAa3UmPyDzFvpSkPPCRpmji3bDrqUdHNVBFV4pMBmcyW92JXeFXc1S0yEl7NXTs
	0obfJ84gv5dGAC3yADNpcW5Zk06V4di5IBQg+Vxhuemmh47BfYnSxWJOdutQAuO5ZqC
	jWGuJmMCQCz/jxCSiLBGVNxXYJ1OnwCsPMTlyqQE=
Content-Type: multipart/mixed; boundary="===============6985229904686159137=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] seatd: upgrading to 0.8.0 SUCCEEDED
Message-ID: <0101018a006e4be0-79b12fe8-9b54-4269-a32b-d4eacfc5841f-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186169

--===============6985229904686159137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *seatd* to *0.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-seatd-upgrade-0.7.0-0.8.0.patch
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
From 0bf26ec21b318dc1d74a61e25c245b0fd56d941c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 02:22:16 +0000
Subject: [PATCH] seatd: upgrade 0.7.0 -> 0.8.0

---
 meta/recipes-core/seatd/{seatd_0.7.0.bb => seatd_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.7.0.bb => seatd_0.8.0.bb} (96%)

diff --git a/meta/recipes-core/seatd/seatd_0.7.0.bb b/meta/recipes-core/seatd/seatd_0.8.0.bb
similarity index 96%
rename from meta/recipes-core/seatd/seatd_0.7.0.bb
rename to meta/recipes-core/seatd/seatd_0.8.0.bb
index 59ef6ad9c1..14c5b1b7ae 100644
--- a/meta/recipes-core/seatd/seatd_0.7.0.bb
+++ b/meta/recipes-core/seatd/seatd_0.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "a803ba0502cccf147eec7fbcacd11c5b8643c0e0"
+SRCREV = "3e9ef69f14f630a719dd464f3c90a7932f1c8296"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
-- 
2.39.2


--===============6985229904686159137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:26cd05e867cdc76d29506939c8c4cbb2ca834652"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 80 Mirrors 0 Missed 10 Current 571 (88% match, 98% complete)
Removing 10 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 584 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Started
NOTE: Running task 1456 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1529 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_write_config)
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1596 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_fetch)
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1645 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1764 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_patch)
NOTE: recipe seatd-0.8.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxml2/2.11.4/temp/log.do_packagedata_setscene.2157295
NOTE: recipe seatd-0.8.0-r0: task do_patch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1765 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1766 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic)
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic unihash changed to 2a05ea902b88fb0f27b8c2922b7b4fa645ff3d88389596b1e3b02e0e4938c25b
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 660 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1802 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1814 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Started
NOTE: recipe seatd-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1831 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_collect_spdx_deps)
NOTE: recipe seatd-0.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1832 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_configure)
NOTE: recipe seatd-0.8.0-r0: task do_configure: Started
NOTE: recipe seatd-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_compile)
NOTE: recipe seatd-0.8.0-r0: task do_compile: Started
NOTE: recipe seatd-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1834 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_install)
NOTE: recipe seatd-0.8.0-r0: task do_install: Started
NOTE: recipe seatd-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1835 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package)
NOTE: Running task 1836 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.8.0-r0: task do_package: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1837 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_packagedata)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1838 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_spdx)
NOTE: Running task 1839 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package_write_rpm)
NOTE: Running task 1840 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package_qa)
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1841 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_runtime_spdx)
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1842 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1842 tasks of which 1821 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6985229904686159137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/seatd: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGSIZE changed from 259360 to 259112 (-0%)
packages/core2-32-poky-linux/seatd/seatd-dbg: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-dev: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-dev: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-doc: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-doc: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-locale: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-locale: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-src: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-src: PKGSIZE changed from 132662 to 132790 (+0%)
packages/core2-32-poky-linux/seatd/seatd-src: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-staticdev: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-staticdev: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd: PV changed from "0.7.0" to "0.8.0"

--===============6985229904686159137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:26cd05e867cdc76d29506939c8c4cbb2ca834652"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 79 Mirrors 0 Missed 10 Current 566 (88% match, 98% complete)
Removing 1 stale sstate objects for arch qemumips...done.
Removing 10 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 579 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Started
NOTE: Running task 1444 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa)
NOTE: Running task 1503 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_write_config)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1579 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_fetch)
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1580 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_unpack)
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running task 1651 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1652 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1653 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Started
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic unihash changed to 2a05ea902b88fb0f27b8c2922b7b4fa645ff3d88389596b1e3b02e0e4938c25b
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxml2/2.11.4/temp/log.do_packagedata_setscene.2109376
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 652 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 654 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1785 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1797 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Started
NOTE: recipe seatd-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1814 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_collect_spdx_deps)
NOTE: recipe seatd-0.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1815 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_configure)
NOTE: recipe seatd-0.8.0-r0: task do_configure: Started
NOTE: recipe seatd-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1816 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_compile)
NOTE: recipe seatd-0.8.0-r0: task do_compile: Started
NOTE: recipe seatd-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1817 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_install)
NOTE: recipe seatd-0.8.0-r0: task do_install: Started
NOTE: recipe seatd-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1818 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package)
NOTE: Running task 1819 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.8.0-r0: task do_package: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_packagedata)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1821 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_spdx)
NOTE: Running task 1822 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package_write_rpm)
NOTE: Running task 1823 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package_qa)
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1824 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_runtime_spdx)
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1825 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1825 tasks of which 1804 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6985229904686159137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:26cd05e867cdc76d29506939c8c4cbb2ca834652"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 80 Mirrors 0 Missed 10 Current 571 (88% match, 98% complete)
Removing 1 stale sstate objects for arch qemuarm...done.
Removing 10 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 584 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1456 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa)
NOTE: Running task 1518 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_write_config)
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1596 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_fetch)
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1597 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_unpack)
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1655 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1669 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1670 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic unihash changed to 2a05ea902b88fb0f27b8c2922b7b4fa645ff3d88389596b1e3b02e0e4938c25b
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxml2/2.11.4/temp/log.do_packagedata_setscene.2059089
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 660 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1802 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1814 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Started
NOTE: recipe seatd-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1831 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_collect_spdx_deps)
NOTE: recipe seatd-0.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1832 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_configure)
NOTE: recipe seatd-0.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_configure: Started
NOTE: recipe seatd-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_compile)
NOTE: recipe seatd-0.8.0-r0: task do_compile: Started
NOTE: recipe seatd-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1834 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_install)
NOTE: recipe seatd-0.8.0-r0: task do_install: Started
NOTE: recipe seatd-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1835 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package)
NOTE: Running task 1836 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.8.0-r0: task do_package: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1837 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_packagedata)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1838 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_spdx)
NOTE: Running task 1839 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package_write_rpm)
NOTE: Running task 1840 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package_qa)
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1841 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_runtime_spdx)
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 1842 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1842 tasks of which 1821 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6985229904686159137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:26cd05e867cdc76d29506939c8c4cbb2ca834652"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 78 Mirrors 0 Missed 10 Current 573 (88% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 585 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Started
NOTE: Running task 1456 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa)
NOTE: Running task 1518 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_write_config)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1596 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_fetch)
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1597 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_unpack)
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1765 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1766 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxml2/2.11.4/temp/log.do_packagedata_setscene.2022332
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic unihash changed to 2a05ea902b88fb0f27b8c2922b7b4fa645ff3d88389596b1e3b02e0e4938c25b
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 660 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1802 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1814 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Started
NOTE: recipe seatd-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1831 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_collect_spdx_deps)
NOTE: recipe seatd-0.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe seatd-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1832 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_configure)
NOTE: recipe seatd-0.8.0-r0: task do_configure: Started
NOTE: recipe seatd-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_compile)
NOTE: recipe seatd-0.8.0-r0: task do_compile: Started
NOTE: recipe seatd-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1834 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_install)
NOTE: recipe seatd-0.8.0-r0: task do_install: Started
NOTE: recipe seatd-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 1835 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package)
NOTE: Running task 1836 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot)
NOTE: recipe seatd-0.8.0-r0: task do_package: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package: Succeeded
NOTE: Running task 1837 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_packagedata)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata: Started
NOTE: recipe seatd-0.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1838 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_spdx)
NOTE: Running task 1839 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package_write_rpm)
NOTE: Running task 1840 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_package_qa)
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1841 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_runtime_spdx)
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1842 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1842 tasks of which 1821 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6985229904686159137==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-seatd-upgrade-0.7.0-0.8.0.patch"

RnJvbSAwYmYyNmVjMjFiMzE4ZGMxZDc0YTYxZTI1YzI0NWIwZmQ1NmQ5NDFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDI6MjI6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
ZWF0ZDogdXBncmFkZSAwLjcuMCAtPiAwLjguMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9zZWF0
ZC97c2VhdGRfMC43LjAuYmIgPT4gc2VhdGRfMC44LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvc2VhdGQve3NlYXRkXzAuNy4wLmJiID0+IHNlYXRkXzAuOC4wLmJifSAoOTYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuNy4wLmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvc2VhdGQvc2VhdGRfMC44LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC43LjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOC4wLmJiCmluZGV4IDU5ZWY2YWQ5YzEuLjE0
YzViMWI3YWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuNy4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOC4wLmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MTVhOTlkMmRk
NTUyZTYxODhlNzRkNGVkMjkxNGQ1YSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXQuc3IuaHQvfmtl
bm55bGV2aW5zZW4vc2VhdGQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAgICAgICAg
ICAgIGZpbGU6Ly9pbml0IgotU1JDUkVWID0gImE4MDNiYTA1MDJjY2NmMTQ3ZWVjN2ZiY2FjZDEx
YzViODY0M2MwZTAiCitTUkNSRVYgPSAiM2U5ZWY2OWYxNGY2MzBhNzE5ZGQ0NjRmM2M5MGE3OTMy
ZjFjODI5NiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmln
IHVwZGF0ZS1yYy5kCi0tIAoyLjM5LjIKCg==

--===============6985229904686159137==--

