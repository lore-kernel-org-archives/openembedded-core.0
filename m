Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913F0CA0FFB
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.5723.1693650552678996678
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X+uJh/Ta;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C4SeKc4V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a55708369-a784da5d-8041-411c-9a8d-781b02d8f243-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nTey8EjWsJygMpyD1MisVNlzJqHAYVmYvFa7DO5KXiU=;
	b=X+uJh/TaGMufsBLzI8Q6u2J2peYIgk0Nd0Ieg30d3pA4Rc0m+tjU2bwyKFTiB/M+
	tpz0XZ6NWQ0j404D5hAatOsCMLfUlS57QKVK0rzcNNDrSuhOAuye84V5MNZ86aglMjV
	bfaoDI2TF9Tlt0Wjq9zKoqmyNU59+jPgeXkcs3SE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nTey8EjWsJygMpyD1MisVNlzJqHAYVmYvFa7DO5KXiU=;
	b=C4SeKc4VgzFEfPxHpj6K6XgHI2eg9fj4fBfdAGdmeunLXa043G8WP5McN6u/6kZ5
	UpkAH2p1Eo4vC33mY2yJGXPVWZ3Z4YVPD/jHUNiymIuKn1rI3AVZ8zkIAqachcRQbHv
	dj3wQmCXSVxUH+Teo4VKgJ8anBOQIsf9WAfDz/zA=
Content-Type: multipart/mixed; boundary="===============2155190105113362315=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] seatd: upgrading to 0.8.0 SUCCEEDED
Message-ID: <0101018a55708369-a784da5d-8041-411c-9a8d-781b02d8f243-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187044

--===============2155190105113362315==
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
From 11cf9eac528b793da3b4cbf3a7dbc61f73afd9b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 09:54:35 +0000
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


--===============2155190105113362315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-9d63beb2862dda45e7ef8f4ea838c60e9e1f90f0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d63beb2862dda45e7ef8f4ea838c60e9e1f90f0"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 43 Mirrors 0 Missed 14 Current 604 (75% match, 97% complete)
Removing 8 stale sstate objects for arch ppc7400...done.
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 615 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1528 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxml2/2.11.4/temp/log.do_packagedata_setscene.3017450
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running task 1541 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa)
NOTE: Running task 1629 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1709 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1775 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1776 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1777 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 1778 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7568d355d9c9c8ce2f4df915a11aa6dcfb33f13fac4dcb464666b2b9b9ba02ef
NOTE: recipe seatd-0.8.0-r0: task do_patch: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic)
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic unihash changed to 50a3a3f87f434baa24338cd1d2347bb1516171b57c26a28471349cd65c41f9b1
NOTE: Running task 1781 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9817e6a4efa6dd3c576432bcaa0a5cf193db4cf18a5504b969245390a17b5548
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 4428014740428d599dade6aad5be8d48c48d44486908156d2858f4f6d32ef903 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '736bc67982c00c5cf92d5ad49524c5fe9bc48650966f7aaf044d09b0f75dc594', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4428014740428d599dade6aad5be8d48c48d44486908156d2858f4f6d32ef903'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 736bc67982c00c5cf92d5ad49524c5fe9bc48650966f7aaf044d09b0f75dc594 -> 4428014740428d599dade6aad5be8d48c48d44486908156d2858f4f6d32ef903 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1804 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1816 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_prepare_recipe_sysroot)
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
NOTE: Tasks Summary: Attempted 1842 tasks of which 1817 didn't need to be rerun and all succeeded.
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

--===============2155190105113362315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/seatd: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGSIZE changed from 259160 to 258920 (-0%)
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

--===============2155190105113362315==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-seatd-upgrade-0.7.0-0.8.0.patch"

RnJvbSAxMWNmOWVhYzUyOGI3OTNkYTNiNGNiZjNhN2RiYzYxZjczYWZkOWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAwOTo1NDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNl
YXRkOiB1cGdyYWRlIDAuNy4wIC0+IDAuOC4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3NlYXRk
L3tzZWF0ZF8wLjcuMC5iYiA9PiBzZWF0ZF8wLjguMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29y
ZS9zZWF0ZC97c2VhdGRfMC43LjAuYmIgPT4gc2VhdGRfMC44LjAuYmJ9ICg5NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC43LjAuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS9zZWF0ZC9zZWF0ZF8wLjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zZWF0ZC9zZWF0ZF8wLjcuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC44LjAuYmIKaW5kZXggNTllZjZhZDljMS4uMTRj
NWIxYjdhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC43LjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC44LjAuYmIKQEAgLTgsNyAr
OCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTcxNWE5OWQyZGQ1
NTJlNjE4OGU3NGQ0ZWQyOTE0ZDVhIgogCiBTUkNfVVJJID0gImdpdDovL2dpdC5zci5odC9+a2Vu
bnlsZXZpbnNlbi9zZWF0ZDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAgICAg
ICAgZmlsZTovL2luaXQiCi1TUkNSRVYgPSAiYTgwM2JhMDUwMmNjY2YxNDdlZWM3ZmJjYWNkMTFj
NWI4NjQzYzBlMCIKK1NSQ1JFViA9ICIzZTllZjY5ZjE0ZjYzMGE3MTlkZDQ2NGYzYzkwYTc5MzJm
MWM4Mjk2IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcg
dXBkYXRlLXJjLmQKLS0gCjIuMzkuMgoK

--===============2155190105113362315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-9d63beb2862dda45e7ef8f4ea838c60e9e1f90f0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d63beb2862dda45e7ef8f4ea838c60e9e1f90f0"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 43 Mirrors 0 Missed 14 Current 598 (75% match, 97% complete)
Removing 2 stale sstate objects for arch qemumips...done.
Removing 8 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 609 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx_setscene)
NOTE: Running setscene task 610 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 636 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1509 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa)
NOTE: Running task 1591 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_write_config)
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1661 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxml2/2.11.4/temp/log.do_packagedata_setscene.3012408
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 649 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running task 1671 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1693 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1759 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1760 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1761 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_patch)
NOTE: recipe seatd-0.8.0-r0: task do_patch: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1762 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1763 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0b33c027f0202e62503cab7c451fbd457bbba674288a166b0ab8845afb7d30f6
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic unihash changed to 50a3a3f87f434baa24338cd1d2347bb1516171b57c26a28471349cd65c41f9b1
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1764 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a0aa8749c4947fab02dda4b951409725b6a3a9c7a5a5ec59338227ae49b9835
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 4272c868d263de8d2bb4fd5edd464170e15bd1ebb728410a399bb88690821351 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '2b74cc59ccaa197540c9d5c5ae53408a00033699446d5b556084fdb6313872b6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4272c868d263de8d2bb4fd5edd464170e15bd1ebb728410a399bb88690821351'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 2b74cc59ccaa197540c9d5c5ae53408a00033699446d5b556084fdb6313872b6 -> 4272c868d263de8d2bb4fd5edd464170e15bd1ebb728410a399bb88690821351 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 655 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1799 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_prepare_recipe_sysroot)
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
NOTE: recipe seatd-0.8.0-r0: task do_package: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot: Started
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
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1825 of 1825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1825 tasks of which 1800 didn't need to be rerun and all succeeded.
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

--===============2155190105113362315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1807 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-9d63beb2862dda45e7ef8f4ea838c60e9e1f90f0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d63beb2862dda45e7ef8f4ea838c60e9e1f90f0"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 43 Mirrors 0 Missed 14 Current 604 (75% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 615 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1526 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxml2/2.11.4/temp/log.do_packagedata_setscene.3002228
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 655 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running task 1541 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa)
NOTE: Running task 1629 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1709 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1775 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1776 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1777 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 1778 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d09c5a32b26f664d547f186926a3641ab5aaa30a571662d12e240218b0e77eee
NOTE: recipe seatd-0.8.0-r0: task do_patch: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic)
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic unihash changed to 50a3a3f87f434baa24338cd1d2347bb1516171b57c26a28471349cd65c41f9b1
NOTE: Running task 1781 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a34e87fb12bc478fce02fd1539f1bd8da47d021d6031c63048a9a21401fce53
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 4a499764e9a5bae905098e611710d54ce9f10d37cca5d94b52a71a4021634208 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '6d46995b6b3f98dfb30e1405aa92871b3f67da845fcc1cb83a9166d5e23e2857', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '4a499764e9a5bae905098e611710d54ce9f10d37cca5d94b52a71a4021634208'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 6d46995b6b3f98dfb30e1405aa92871b3f67da845fcc1cb83a9166d5e23e2857 -> 4a499764e9a5bae905098e611710d54ce9f10d37cca5d94b52a71a4021634208 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1804 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1816 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_prepare_recipe_sysroot)
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
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1842 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1842 tasks of which 1817 didn't need to be rerun and all succeeded.
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

--===============2155190105113362315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-9d63beb2862dda45e7ef8f4ea838c60e9e1f90f0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d63beb2862dda45e7ef8f4ea838c60e9e1f90f0"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 43 Mirrors 0 Missed 14 Current 604 (75% match, 97% complete)
Removing 8 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 615 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1521 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa)
NOTE: Running task 1606 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_write_config)
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1636 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxml2/2.11.4/temp/log.do_packagedata_setscene.3007321
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 655 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running task 1646 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1710 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1776 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1777 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe seatd-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1778 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_patch)
NOTE: recipe seatd-0.8.0-r0: task do_patch: Started
NOTE: recipe seatd-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1780 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f982a4123a6cd558c191245ca50978150707844bc8d5e1992485a942d8fdeede
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_lic unihash changed to 50a3a3f87f434baa24338cd1d2347bb1516171b57c26a28471349cd65c41f9b1
NOTE: recipe seatd-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1781 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f561b45f6c5e241d6ad9ef43d77edcf1f3a5b9f911a27c22eff9209cd0f9544a
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 1e72a062d67507e560bab7b389f6d32ae5fd9764f064811f382be6bd685dee26 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '35ce105121d153c0c11dd66be9613c6bffd46792b54c7a3bda98cca6905575d2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1e72a062d67507e560bab7b389f6d32ae5fd9764f064811f382be6bd685dee26'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 35ce105121d153c0c11dd66be9613c6bffd46792b54c7a3bda98cca6905575d2 -> 1e72a062d67507e560bab7b389f6d32ae5fd9764f064811f382be6bd685dee26 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1804 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1816 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_prepare_recipe_sysroot)
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
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1841 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_runtime_spdx)
NOTE: recipe seatd-0.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe seatd-0.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 1842 of 1842 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1842 tasks of which 1817 didn't need to be rerun and all succeeded.
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

--===============2155190105113362315==--

