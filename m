Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BF4EEEC2D
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.29667.1694804393351899620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Wiqap+aJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QwvL+JWU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a9a36c589-5b08604c-1d5b-436e-bf86-e65238287574-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=fB6QNQb/2BVJALgDg1omA5eGx1axNcruyEv67mpREeA=;
	b=Wiqap+aJPYHPuybtqyBPcL6yaWNABZTEsI1pyQjZ1Ac3AS0SoSQLZBBIflXtYdmU
	SXcw1iNV5mo37S9IR5OxVNJoJtJhLigKOE2Yc0pu01wOv9l/MVCpAAUiBUdK7idPW16
	UX33t5MSgOZO+eCYcTB4rKZGlPilRkIM8toCjas4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=fB6QNQb/2BVJALgDg1omA5eGx1axNcruyEv67mpREeA=;
	b=QwvL+JWU1V/XRYlUoBJoSr22BIklk90IaBwQS6wPdeS0v2rpUgGXCjsDIIrakLje
	0lYG3R2GHT1a5LxJxESSZCWjtrADqKN5l/5Ne05Ub4+rqaAB0y2y/DYaqt6GwZNMP/X
	3ORU7Iy5pcbsHocSdZgZ+yBIEqeAhNFATyi3PYTk=
Content-Type: multipart/mixed; boundary="===============8623227036680810340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 23.2.0 SUCCEEDED
Message-ID: <0101018a9a36c589-5b08604c-1d5b-436e-bf86-e65238287574-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187752

--===============8623227036680810340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *23.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-23.1.2-23.2.0.patch
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
From b07f06b100a9e3fcb035b342c4af00672a1dc70d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 16:27:59 +0000
Subject: [PATCH] xwayland: upgrade 23.1.2 -> 23.2.0

---
 .../xwayland/{xwayland_23.1.2.bb => xwayland_23.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.1.2.bb => xwayland_23.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.0.bb
index de516536d1..963171cf9b 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bd25d8498ee4d77874fda125127e2db37fc332531febc966231ea06fae8cf77f"
+SRC_URI[sha256sum] = "7f33ec2a34de6e66ae1b7e44872c3a2146192872c719b9acf192814edbabd4c5"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.39.2


--===============8623227036680810340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1808 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b13730d3dc69c93ed067c8c6a4247d528908e8ca"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b13730d3dc69c93ed067c8c6a4247d528908e8ca"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 39 Mirrors 0 Missed 17 Current 663 (69% match, 97% complete)
Removing 3 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 674 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/xcb-proto/1.15.2/temp/log.do_packagedata_setscene.871420
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 711 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/font-util/1.4.0/temp/log.do_packagedata_setscene.871720
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 715 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1669 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_recipe_qa)
NOTE: Running task 1701 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: Running task 1739 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_write_config)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Started
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1774 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1775 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_fetch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1777 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_unpack)
NOTE: Running setscene task 717 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 719 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1798 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: Running task 1799 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1823 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: Running task 1885 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1886 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1887 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1888 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1889 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1890 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1957 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_collect_spdx_deps)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic unihash changed to 88287a4ece0d269ed2713fda5ec19c86936cd486e2e5cf49b48a585986e23b81
NOTE: Running task 1958 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1959 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 1960 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_package_write_rpm)
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1961 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Started
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_compile)
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1965 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1966 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe xwayland-23.2.0-r0: task do_install: Started
NOTE: recipe xwayland-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 1967 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package)
NOTE: Running task 1968 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_sysroot)
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1969 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1970 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_create_spdx)
NOTE: Running task 1971 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package: Succeeded
NOTE: Running task 1972 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_packagedata)
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1973 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_spdx)
NOTE: Running task 1974 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_write_rpm)
NOTE: Running task 1975 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_qa)
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1976 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_runtime_spdx)
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1977 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1977 tasks of which 1940 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-src went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dbg went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-staticdev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-doc went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-locale went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package python-xcbgen went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-src went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dbg went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-staticdev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-doc went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-locale went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8623227036680810340==
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
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b13730d3dc69c93ed067c8c6a4247d528908e8ca"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b13730d3dc69c93ed067c8c6a4247d528908e8ca"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 42 Mirrors 0 Missed 17 Current 660 (71% match, 97% complete)
Removing 3 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 674 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/xcb-proto/1.15.2/temp/log.do_packagedata_setscene.943023
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 711 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/font-util/1.4.0/temp/log.do_packagedata_setscene.943379
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 715 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1669 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_recipe_qa)
NOTE: Running task 1701 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: Running task 1739 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_write_config)
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1774 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_fetch)
NOTE: Running task 1775 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 717 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 719 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1776 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_unpack)
NOTE: Running task 1777 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1798 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1820 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1881 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: Running task 1884 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1885 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: Running task 1887 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1888 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1889 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1890 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1957 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Started
NOTE: Running task 1958 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_collect_spdx_deps)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic unihash changed to 88287a4ece0d269ed2713fda5ec19c86936cd486e2e5cf49b48a585986e23b81
NOTE: Running task 1960 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1961 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_configure)
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Started
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_compile)
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1965 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1966 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_install)
NOTE: recipe xwayland-23.2.0-r0: task do_install: Started
NOTE: recipe xwayland-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 1967 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package)
NOTE: Running task 1968 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package: Started
NOTE: Running task 1969 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1970 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_create_spdx)
NOTE: Running task 1971 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package: Succeeded
NOTE: Running task 1972 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_packagedata)
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1973 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_spdx)
NOTE: Running task 1974 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_write_rpm)
NOTE: Running task 1975 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_qa)
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1976 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_runtime_spdx)
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1977 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1977 tasks of which 1940 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-src went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dbg went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-staticdev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-doc went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-locale went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package python-xcbgen went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-src went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dbg went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-staticdev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-doc went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-locale went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8623227036680810340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 56 recipes from the core2-32 sysroot...done.
Removing 55 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b13730d3dc69c93ed067c8c6a4247d528908e8ca"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b13730d3dc69c93ed067c8c6a4247d528908e8ca"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 382 Local 365 Mirrors 0 Missed 17 Current 337 (95% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 348 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 375 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1023 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_recipe_qa)
NOTE: Running task 1028 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: Running task 1031 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 394 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 396 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1047 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1048 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_fetch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1069 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1074 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 427 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_package_setscene)
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/font-util/1.4.0/temp/log.do_packagedata_setscene.960944
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package_setscene)
NOTE: Running setscene task 457 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: Running task 1086 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_patch)
NOTE: Running task 1087 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1088 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1089 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1090 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic unihash changed to 88287a4ece0d269ed2713fda5ec19c86936cd486e2e5cf49b48a585986e23b81
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 468 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 474 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 483 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 498 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 510 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 526 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 547 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 552 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 560 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 562 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 594 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 595 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/xcb-proto/1.15.2/temp/log.do_packagedata_setscene.966331
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 610 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 612 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 614 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 616 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 633 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 636 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 645 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 647 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 659 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 661 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 664 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 666 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 671 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1656 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: Running task 1838 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: Running task 1875 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1880 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1947 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 1948 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_package_write_rpm)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1958 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_collect_spdx_deps)
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1959 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1960 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_configure)
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Started
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_compile)
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1964 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1965 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_install)
NOTE: recipe xwayland-23.2.0-r0: task do_install: Started
NOTE: recipe xwayland-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 1966 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package)
NOTE: Running task 1967 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1968 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1969 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_create_spdx)
NOTE: Running task 1970 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package: Succeeded
NOTE: Running task 1971 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_packagedata)
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1972 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_spdx)
NOTE: Running task 1973 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_write_rpm)
NOTE: Running task 1974 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_qa)
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1975 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_runtime_spdx)
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1976 of 1976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1976 tasks of which 1939 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-src went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dbg went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-staticdev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-doc went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-locale went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-src went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dbg went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-staticdev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-doc went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-locale went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package python-xcbgen went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8623227036680810340==
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
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b13730d3dc69c93ed067c8c6a4247d528908e8ca"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b13730d3dc69c93ed067c8c6a4247d528908e8ca"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 42 Mirrors 0 Missed 17 Current 660 (71% match, 97% complete)
Removing 3 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 674 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/xcb-proto/1.15.2/temp/log.do_packagedata_setscene.919379
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/font-util/1.4.0/temp/log.do_packagedata_setscene.919759
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 715 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1669 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_recipe_qa)
NOTE: Running task 1701 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: Running task 1739 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_write_config)
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Started
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1774 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_fetch)
NOTE: Running task 1775 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: Running task 1777 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 717 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1778 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1804 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: Running task 1880 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: Running task 1884 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1885 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_patch)
NOTE: Running task 1886 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1888 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1889 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1890 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic)
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1957 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_collect_spdx_deps)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic unihash changed to 88287a4ece0d269ed2713fda5ec19c86936cd486e2e5cf49b48a585986e23b81
NOTE: Running task 1958 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: Running task 1959 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 1960 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_package_write_rpm)
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1961 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_configure)
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Started
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_compile)
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1965 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1966 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_install)
NOTE: recipe xwayland-23.2.0-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1967 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe xwayland-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 1968 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: Running task 1969 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_sysroot)
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1970 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_create_spdx)
NOTE: Running task 1971 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package: Succeeded
NOTE: Running task 1972 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_packagedata)
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1973 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_spdx)
NOTE: Running task 1974 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_write_rpm)
NOTE: Running task 1975 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_qa)
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1976 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_runtime_spdx)
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1977 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1977 tasks of which 1940 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-src went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dbg went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-staticdev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-doc went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-locale went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package python-xcbgen went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-src went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dbg went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-staticdev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-doc went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-locale went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8623227036680810340==
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
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b13730d3dc69c93ed067c8c6a4247d528908e8ca"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b13730d3dc69c93ed067c8c6a4247d528908e8ca"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 42 Mirrors 0 Missed 17 Current 660 (71% match, 97% complete)
Removing 3 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 674 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xcb-proto/1.15.2/temp/log.do_packagedata_setscene.905278
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 711 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/font-util/1.4.0/temp/log.do_packagedata_setscene.905571
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 715 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package_setscene)
NOTE: Running task 1669 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_recipe_qa)
NOTE: Running task 1701 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: Running task 1739 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Started
NOTE: recipe xwayland-23.2.0-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1774 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_fetch)
NOTE: Running task 1775 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: recipe xwayland-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1777 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: Running setscene task 717 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 719 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1778 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1779 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_patch)
NOTE: Running task 1800 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1824 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: Running task 1886 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1887 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1888 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1889 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1890 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1895 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: recipe xwayland-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_lic unihash changed to 88287a4ece0d269ed2713fda5ec19c86936cd486e2e5cf49b48a585986e23b81
NOTE: Running task 1958 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_collect_spdx_deps)
NOTE: Running task 1959 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 1960 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.7.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe xwayland-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1961 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_configure)
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Started
NOTE: recipe xwayland-23.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_compile)
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1964 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 1965 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: recipe xwayland-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1966 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_install)
NOTE: recipe xwayland-23.2.0-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 1967 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 1968 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package)
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1969 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_create_spdx)
NOTE: Running task 1970 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: Running task 1971 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_populate_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package: Succeeded
NOTE: Running task 1972 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_packagedata)
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-23.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1973 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_spdx)
NOTE: Running task 1974 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_write_rpm)
NOTE: Running task 1975 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_package_qa)
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Started
NOTE: recipe mesa-2_23.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1976 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_create_runtime_spdx)
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe xwayland-23.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xwayland-23.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1977 of 1977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_23.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1977 tasks of which 1940 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-src went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dbg went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-staticdev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-doc went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-locale went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: QA Issue: Package version for package python-xcbgen went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.15.2-r0) [version-going-backwards]
ERROR: xcb-proto-1.15.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-src went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dbg went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-staticdev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dev went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-doc went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-locale went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package font-util went backwards which would break package feeds (from 0:1.4.1-r0 to 0:1.4.0-r0) [version-going-backwards]
ERROR: font-util-1.4.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8623227036680810340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PKGV changed from 23.1.2 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/xwayland: PV changed from "23.1.2" to "23.2.0"
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-23.1.2.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-23.2.0.tar.xz"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 23.1.2 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "23.1.2" to "23.2.0"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10571736 to 10598560 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 23.1.2 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "23.1.2" to "23.2.0"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 23.1.2 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "23.1.2" to "23.2.0"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 23.1.2 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "23.1.2" to "23.2.0"
packages/core2-32-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/23.1.2-r0/dbe -> /usr/src/debug/xwayland/23.2.0-r0/dbe, directory renamed /usr/src/debug/xwayland/23.1.2-r0/glx -> /usr/src/debug/xwayland/23.2.0-r0/glx, directory renamed /usr/src/debug/xwayland/23.1.2-r0/os -> /usr/src/debug/xwayland/23.2.0-r0/os, directory renamed /usr/src/debug/xwayland/23.1.2-r0/damageext -> /usr/src/debug/xwayland/23.2.0-r0/damageext, directory renamed /usr/src/debug/xwayland/23.1.2-r0/miext/sync -> /usr/src/debug/xwayland/23.2.0-r0/miext/sync, directory renamed /usr/src/debug/xwayland/23.1.2-r0/present -> /usr/src/debug/xwayland/23.2.0-r0/present, directory renamed /usr/src/debug/xwayland/23.1.2-r0/render -> /usr/src/debug/xwayland/23.2.0-r0/render, directory renamed /usr/src/debug/xwayland/23.1.2-r0/xfixes -> /usr/src/debug/xwayland/23.2.0-r0/xfixes, directory renamed /usr/src/debug/xwayland/23.1.2-r0/record -> /usr/src/debug/xwayland/23.2.0-r0/record, dire
 ctory renamed /usr/src/debug/xwayland/23.1.2-r0/include -> /usr/src/debug/xwayland/23.2.0-r0/include, directory renamed /usr/src/debug/xwayland/23.1.2-r0/mi -> /usr/src/debug/xwayland/23.2.0-r0/mi, directory renamed /usr/src/debug/xwayland/23.1.2-r0/dix -> /usr/src/debug/xwayland/23.2.0-r0/dix, directory renamed /usr/src/debug/xwayland/23.1.2-r0/dri3 -> /usr/src/debug/xwayland/23.2.0-r0/dri3, directory renamed /usr/src/debug/xwayland/23.1.2-r0/randr -> /usr/src/debug/xwayland/23.2.0-r0/randr, directory renamed /usr/src/debug/xwayland/23.1.2-r0/glamor -> /usr/src/debug/xwayland/23.2.0-r0/glamor, directory renamed /usr/src/debug/xwayland/23.1.2-r0/miext/damage -> /usr/src/debug/xwayland/23.2.0-r0/miext/damage, directory renamed /usr/src/debug/xwayland/23.1.2-r0/xkb -> /usr/src/debug/xwayland/23.2.0-r0/xkb, directory renamed /usr/src/debug/xwayland/23.1.2-r0/Xi -> /usr/src/debug/xwayland/23.2.0-r0/Xi, directory renamed /usr/src/debug/xwayland/23.1.2-r0/composite -> /usr/src/debug/xwayl
 and/23.2.0-r0/composite, directory renamed /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland -> /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland, directory renamed /usr/src/debug/xwayland/23.1.2-r0/Xext -> /usr/src/debug/xwayland/23.2.0-r0/Xext, removed "/usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/drm-protocol.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/xwayland-shell-v1-protocol.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbfillsp.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/xdg-output-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/viewporter-protocol.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbbits.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbimage.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbsolid.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbfillrect.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbline.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/relative-pointer-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwa
 yland/Xwayland.p/tablet-unstable-v2-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbpush.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbgc.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/drm-lease-v1-protocol.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/tablet-unstable-v2-protocol.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/xwayland-keyboard-grab-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbpoint.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbseg.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbfill.c /usr/src/debug/xwayland/23.1.2-r0/fb/fb.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbpict.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbcopy.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbglyph.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbpixmap.c /usr/src/debug/xw
 ayland/23.1.2-r0/fb/fbtrap.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/pointer-gestures-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbpict.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/xdg-shell-protocol.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbarc.c /usr/src/debug/xwayland/23.1.2-r0/fb/fballpriv.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbrop.h /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/pointer-constraints-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbscreen.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/drm-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/drm-lease-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/xwayland-keyboard-grab-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbbltone.c /usr/sr
 c/debug/xwayland/23.1.2-r0/fb/fbgetsp.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbsetsp.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbwindow.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/xwayland-shell-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/fb/fbutil.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/viewporter-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbblt.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/relative-pointer-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/pointer-constraints-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.2-r0/fb/fbcmap_mi.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/pointer-gestures-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/xdg-shell-client-protocol.h /usr/src/debug/xwayland/23.1.2-r0/hw/xwayland/Xwayland.p/keyboar
 d-shortcuts-inhibit-unstable-v1-protocol.c", added "/usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/drm-protocol.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/xwayland-shell-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbfillsp.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/xdg-output-unstable-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/viewporter-protocol.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbbits.h /usr/src/debug/xwayland/23.2.0-r0/fb/fbimage.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/tearing-control-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbsolid.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbfillrect.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbline.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/relative-pointer-unstable-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/tablet-unstable-v2-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/fb/fbpush.c /usr/src/
 debug/xwayland/23.2.0-r0/fb/fbgc.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/drm-lease-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/tablet-unstable-v2-protocol.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/xwayland-keyboard-grab-unstable-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/tearing-control-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/fb/fbpoint.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbseg.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbfill.c /usr/src/debug/xwayland/23.2.0-r0/fb/fb.h /usr/src/debug/xwayland/23.2.0-r0/fb/fbpict.h /usr/src/debug/xwayland/23.2.0-r0/fb/fbtile.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbcopy.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbglyph.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/
 fb/fbpixmap.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbtrap.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/pointer-gestures-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/fb/fbpict.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/xdg-shell-protocol.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbarc.c /usr/src/debug/xwayland/23.2.0-r0/fb/fballpriv.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbrop.h /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/pointer-constraints-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/fb/fbscreen.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/drm-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/drm-lease-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/xwayland-keyboard-grab-unstable-v1-client-protocol.h /usr/src/debug/xwayland/
 23.2.0-r0/fb/fbbltone.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbgetsp.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbsetsp.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbwindow.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/xwayland-shell-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/fb/fbutil.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/viewporter-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbblt.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/relative-pointer-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/pointer-constraints-unstable-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/fb/fbcmap_mi.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/pointer-gestures-unstable-v1-protocol.c /usr/src/debug/xwayland/23.2.0-r0/hw/xwayland/Xwayland.p/xdg-shell-client-protocol.h /usr/src/debug/xwayland/23.2.0-r0
 /hw/xwayland/Xwayland.p/keyboard-shortcuts-inhibit-unstable-v1-protocol.c"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 23.1.2 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "23.1.2" to "23.2.0"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8719573 to 8750145 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 23.1.2 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "23.1.2" to "23.2.0"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 23.1.2 [default] to 23.2.0 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "23.1.2" to "23.2.0"
packages/core2-32-poky-linux/xwayland/xwayland: PKGSIZE changed from 2442034 to 2446162 (+0%)

--===============8623227036680810340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-23.1.2-23.2.0.patch"

RnJvbSBiMDdmMDZiMTAwYTllM2ZjYjAzNWIzNDJjNGFmMDA2NzJhMWRjNzBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTY6Mjc6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyMy4xLjIgLT4gMjMuMi4wCgotLS0KIC4uLi94d2F5bGFuZC97eHdh
eWxhbmRfMjMuMS4yLmJiID0+IHh3YXlsYW5kXzIzLjIuMC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC97eHdheWxhbmRfMjMuMS4yLmJiID0+IHh3YXlsYW5k
XzIzLjIuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjMuMS4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5k
L3h3YXlsYW5kXzIzLjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjMuMS4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjMuMi4wLmJiCmluZGV4IGRl
NTE2NTM2ZDEuLjk2MzE3MWNmOWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
d2F5bGFuZC94d2F5bGFuZF8yMy4xLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzIzLjIuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVkZjg3OTUwYWY1MWFj
MmM1ODIyMDk0NTUzZWExODgwIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hp
dmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJiZDI1ZDg0OThlZTRkNzc4NzRmZGExMjUxMjdlMmRiMzdmYzMzMjUzMWZlYmM5
NjYyMzFlYTA2ZmFlOGNmNzdmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdmMzNlYzJhMzRkZTZl
NjZhZTFiN2U0NDg3MmMzYTIxNDYxOTI4NzJjNzE5YjlhY2YxOTI4MTRlZGJhYmQ0YzUiCiAKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQr
KSspXC50YXIiCiAKLS0gCjIuMzkuMgoK

--===============8623227036680810340==--

