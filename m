Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455E8CFD31A
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.53367.1728588951632949875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VQnN465y;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JMbzqJkl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277ee4860-781d9d71-e522-4d94-a441-dcb937481e28-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588958;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xCHv+I+ioh9BanF9dZAOzbF7oYAm9KnVY9NN4L4NDEQ=;
	b=VQnN465yCRQFnk6fcJ8tr87fLOtz3l7BDO1OvkwHT8FNAdE1luF/qR3/I1hl68de
	DoKK+CAqo1YVtQ98tmYOUE7VhXVt4Z6UoU6oRptBcOlzpLESYb91sEjljMcCi8m31jF
	gGy0pSw/eVDoGe4pr8c7tWlBsxpw1UENCmdl3hHw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588958;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xCHv+I+ioh9BanF9dZAOzbF7oYAm9KnVY9NN4L4NDEQ=;
	b=JMbzqJklr507px1NlE7dOQ6L/nPTHwb9dak9tMRp8Bi+PD4zP+SATcKfN9dBAwEa
	YmH4EKVQVCR1b0oHcsbSzHzBEKPbWZvajhNUlc7vIaiJqioF4I7bfxeQebyigzC86RE
	aVnS0TpliQ56EZs496haCfCPQ2dlizFFlUibR+eA=
Content-Type: multipart/mixed; boundary="===============6713683829552141466=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.16.3 SUCCEEDED
Message-ID: <0101019277ee4860-781d9d71-e522-4d94-a441-dcb937481e28-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205489

--===============6713683829552141466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.16.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.16.1-4.16.3.patch
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
From 4d5f7547035d8cf361be59b64c59c6713b189c82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 04:18:30 +0000
Subject: [PATCH] gtk4: upgrade 4.16.1 -> 4.16.3

---
 meta/recipes-gnome/gtk+/{gtk4_4.16.1.bb => gtk4_4.16.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.16.1.bb => gtk4_4.16.3.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
index 30b2b16a6f..b8dce36c0d 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "926a1eabd481f9bfa25538f95016fdfcfaf963b2f90b40ae69e90def5499215c"
+SRC_URI[sha256sum] = "2ec53e07d18c9f003b39e4a6a838054d9259e048b6c4c05d80c0d05aa721d944"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.44.1


--===============6713683829552141466==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.16.1-4.16.3.patch"

RnJvbSA0ZDVmNzU0NzAzNWQ4Y2YzNjFiZTU5YjY0YzU5YzY3MTNiMTg5YzgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDQ6MTg6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMTYuMSAtPiA0LjE2LjMKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4xNi4xLmJiID0+IGd0azRfNC4xNi4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMTYuMS5iYiA9PiBndGs0XzQuMTYuMy5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTYuMS5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNi4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTYuMy5iYgppbmRleCAzMGIyYjE2YTZmLi5i
OGRjZTM2YzBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTYu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTYuMy5iYgpAQCAtMzgs
NyArMzgsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAy
KX0iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJndGstKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4
XSkrKFwuXGQrKSspXC50YXIueHoiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcv
cHViL2dub21lL3NvdXJjZXMvZ3RrLyR7TUFKX1ZFUn0vZ3RrLSR7UFZ9LnRhci54eiIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI5MjZhMWVhYmQ0ODFmOWJmYTI1NTM4Zjk1MDE2ZmRmY2ZhZjk2M2Iy
ZjkwYjQwYWU2OWU5MGRlZjU0OTkyMTVjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJlYzUzZTA3
ZDE4YzlmMDAzYjM5ZTRhNmE4MzgwNTRkOTI1OWUwNDhiNmM0YzA1ZDgwYzBkMDVhYTcyMWQ5NDQi
CiAKIFMgPSAiJHtXT1JLRElSfS9ndGstJHtQVn0iCiAKLS0gCjIuNDQuMQoK

--===============6713683829552141466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 121 recipes from the core2-64 sysroot...done.
Removing 126 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:d8da0b09a01e6665b5655ca65447d83306e2c3cc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1046 Local 1000 Mirrors 0 Missed 46 Current 399 (95% match, 96% complete)
Removing 6 stale sstate objects for arch allarch...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 7 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 404 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 411 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 431 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 437 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 439 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 440 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 441 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 443 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 444 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 445 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 446 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.16.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 460 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-dbusmock/0.32.1/temp/log.do_packagedata_setscene.2301978
NOTE: Running setscene task 461 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 462 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb:do_package_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 464 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 507 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 508 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 516 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 529 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 535 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 540 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 544 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 553 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 557 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 560 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 561 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 562 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 565 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 566 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 575 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 577 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 581 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 588 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 591 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 592 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 593 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 600 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 614 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 617 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 619 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 621 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 622 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 625 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 627 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 628 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 632 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 639 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 642 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 649 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 653 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 659 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 660 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 669 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 679 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 688 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 693 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 695 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 696 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 698 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 701 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 703 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 704 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 706 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 719 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 720 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 723 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 725 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 727 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 728 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 731 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 733 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 734 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 738 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 740 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 741 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 747 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 753 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 758 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 761 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 763 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 765 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 767 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 773 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 774 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 777 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 781 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 786 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 792 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 793 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 794 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 797 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 801 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 805 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 806 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 808 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 810 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 812 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 816 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 817 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 818 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 828 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 829 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 833 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 854 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 856 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 866 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 874 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 880 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 886 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 893 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 896 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 899 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 900 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 911 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 912 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 919 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 920 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 921 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 935 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 941 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 945 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 947 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 950 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 953 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 954 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 955 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 970 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 972 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 974 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 979 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 986 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 993 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 996 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 998 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1147 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1180 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1210 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1213 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1215 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1216 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1217 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1218 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1221 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1222 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1223 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1226 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1227 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1232 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1236 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1238 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1244 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1523 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1526 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_fetch)
NOTE: Running task 1547 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_fetch)
NOTE: Running task 1596 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1597 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_fetch)
NOTE: Running task 1618 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: Running task 1628 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1629 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_write_config)
NOTE: Running task 1660 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_write_config)
NOTE: Running task 1685 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_fetch)
NOTE: Running task 1719 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1720 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_write_config)
NOTE: Running task 1728 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1756 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_fetch: Started
NOTE: Running task 1774 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_fetch: Succeeded
NOTE: Running task 1775 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 1776 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_unpack)
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 1777 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Started
NOTE: Running task 1778 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_unpack)
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_fetch: Started
NOTE: Running task 1779 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_write_config: Started
NOTE: recipe gtk4-4.16.3-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 1780 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Succeeded
NOTE: Running task 1808 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_unpack: Started
NOTE: Running task 1839 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1253 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1254 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Started
NOTE: Running setscene task 1255 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running setscene task 1256 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1257 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Started
NOTE: recipe gtk4-4.16.3-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1258 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: Running setscene task 1259 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.16.3-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1852 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1853 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_unpack: Succeeded
NOTE: Running task 1854 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_patch)
NOTE: Running task 1855 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1856 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running setscene task 1260 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_patch: Started
NOTE: Running setscene task 1264 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1266 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_patch: Succeeded
NOTE: Running task 1857 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Started
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1267 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1879 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1880 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: Running task 1883 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_unpack: Succeeded
NOTE: Running task 1887 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_patch)
NOTE: recipe gtk4-4.16.3-r0: task do_patch: Started
NOTE: recipe gtk4-4.16.3-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1268 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1269 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1270 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1271 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1272 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1273 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1276 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1277 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1278 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1279 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1280 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1281 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1282 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1283 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1284 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1286 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1291 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1293 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1294 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1296 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1298 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1300 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1301 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1304 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1305 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1306 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1307 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1308 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1309 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1310 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1312 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1313 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1314 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1316 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1317 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1318 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1319 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1320 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1322 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1326 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1327 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1329 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1335 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1338 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1339 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1340 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1341 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1343 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1344 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1345 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1346 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1347 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1348 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1349 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xz/5.6.2/temp/log.do_packagedata_setscene.2313598
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1353 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_package_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1356 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1357 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1359 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1362 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1363 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1365 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1367 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1369 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1370 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1372 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1374 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1376 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1378 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1380 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1382 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1384 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1386 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1387 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1389 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1392 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1393 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1394 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1395 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1397 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1399 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1401 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1402 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1404 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1406 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1408 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1410 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1411 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1413 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1414 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1415 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1416 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1418 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1422 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1423 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1425 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1430 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1432 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1433 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1437 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1438 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1440 of 1445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2938 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata)
NOTE: recipe xz-5.6.2-r0: task do_packagedata: Started
NOTE: Running task 3436 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3439 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3461 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3515 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3650 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3682 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3840 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 3841 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_collect_spdx_deps)
NOTE: Running task 3845 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb:do_packagedata)
NOTE: Running task 3853 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_collect_spdx_deps)
NOTE: Running task 3858 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3860 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk)
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3861 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb)
NOTE: Running task 3862 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3863 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3864 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.32.1-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3865 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3866 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3867 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_configure)
NOTE: Running task 3868 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 3869 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3870 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk unihash changed to cd72a522aba8052ad7f0c508dd980076b77d6c7c4b72624b0eaae21cb1ec3854
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: Running task 3871 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb unihash changed to 99acddfab1ce0dbbd930b48d395aba535c12edb45bfcdb4a4e7b42bb74de9a85
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 3872 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: Running task 3873 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_configure: Succeeded
NOTE: Running task 3874 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: Running task 3875 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to a20ca1508544a57af635fc4fd64f0141691612b6bb995792fb9c34c34c4c67d0
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3876 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3877 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 3878 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3879 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3880 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm unihash changed to cdcee3585585d9d2b59f52904a8930d4955d1edc1deba2a1b500561484df5a13
NOTE: recipe at-spi2-core-2.54.0-r0: task do_compile: Succeeded
NOTE: Running task 3881 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3882 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3883 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_install: Succeeded
NOTE: Running task 3884 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_populate_sysroot)
NOTE: Running task 3885 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_package)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 3886 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3887 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to 58e57b0f7be4b72e5589671a6e5e21755c64b965ae429565437c8196ed2b751a
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 3888 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_ipk)
NOTE: Running task 3889 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_deb)
NOTE: Running task 3890 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_rpm)
NOTE: Running task 3891 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package_write_ipk)
NOTE: Running task 3892 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package_write_deb)
NOTE: Running task 3893 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_write_ipk: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to fe0558a19d16e1184fde44adacc9b178402ef3e00c2a22b46a03f28820aa33de
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_write_deb: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: Running task 3894 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3895 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3896 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3897 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_ipk unihash changed to 3b5fefcd6f8c48c39b5453a442f2b71e5d2b88b38be5cc34e703194da3fc2a7d
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package_write_ipk unihash changed to a3940997839ec1406deca1edc341bfb805bf37bd7c0946126913999b7690bbc4
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3898 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3899 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure)
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 3900 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to bb4b9a64e9000b622cf492294c3eb208cd28e45d06864c275305c2c89937b248
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx as unihash d6883d06b48fedb31b6bf30a38e161e43e72f73159ec759a35895d3217df2b61 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '99ab3d07b6c0144720ef2689af681cbf0c3ee14fc666c57652ce0876bd99c976', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd6883d06b48fedb31b6bf30a38e161e43e72f73159ec759a35895d3217df2b61'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx unihash changed 99ab3d07b6c0144720ef2689af681cbf0c3ee14fc666c57652ce0876bd99c976 -> d6883d06b48fedb31b6bf30a38e161e43e72f73159ec759a35895d3217df2b61 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3901 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package_write_deb unihash changed to cbf08774a84fa97e9f65e55e1fcfc9b2e96d34f4dbe0bdac8bd67d6f212e3dd3
NOTE: Setscene tasks completed
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_package: Succeeded
NOTE: Running task 3902 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_packagedata unihash changed to fd28f77f43b4959e4c6ea12e769f230b4cf2eaf24dc3281f1d354374c0688235
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx as unihash d6883d06b48fedb31b6bf30a38e161e43e72f73159ec759a35895d3217df2b61 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6a0af1ea3dae8539983d3aac7dd2243261f086dbf602d98fd5e20195908d8af4', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd6883d06b48fedb31b6bf30a38e161e43e72f73159ec759a35895d3217df2b61'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx unihash changed 6a0af1ea3dae8539983d3aac7dd2243261f086dbf602d98fd5e20195908d8af4 -> d6883d06b48fedb31b6bf30a38e161e43e72f73159ec759a35895d3217df2b61 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3903 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3905 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_compile)
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_deb unihash changed to 7b8b84c6634f3d445f7ade5d399b68ac7a25be58c1dc50d334ed726da20f20dd
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3906 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package_write_rpm unihash changed to e3a9cc4b435044d0af66bab28a43863b76837ddbb182ab65e7eb66b406f68170
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3907 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_sysroot)
NOTE: Running task 3908 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3909 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3910 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_package_write_rpm unihash changed to 21526a83318ae67652ce9a0345e8abf37d045430172adb98c3edbe2be246339c
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 3911 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3912 of 3951 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata: Failed
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3912 tasks of which 3813 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010041719.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010041719.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0-plugins-base/1.24.6/temp/log.do_packagedata.2370231
Summary: There were 146 ERROR messages, returning a non-zero exit code.
ERROR: python3-dbusmock-0.32.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-src went backwards which would break package feeds (from 0:0.32.2-r0 to 0:0.32.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.32.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-dbg went backwards which would break package feeds (from 0:0.32.2-r0 to 0:0.32.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.32.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-staticdev went backwards which would break package feeds (from 0:0.32.2-r0 to 0:0.32.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.32.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-dev went backwards which would break package feeds (from 0:0.32.2-r0 to 0:0.32.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.32.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-doc went backwards which would break package feeds (from 0:0.32.2-r0 to 0:0.32.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.32.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock-locale went backwards which would break package feeds (from 0:0.32.2-r0 to 0:0.32.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.32.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbusmock went backwards which would break package feeds (from 0:0.32.2-r0 to 0:0.32.1-r0) [version-going-backwards]
ERROR: python3-dbusmock-0.32.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-ptest went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.6.3-r0 to 0:5.6.2-r0) [version-going-backwards]
ERROR: xz-5.6.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-basedebug went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dsd went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.24.8-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0-plugins-base/1.24.6/temp/log.do_packagedata.2370231
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata) failed with exit code '1'

--===============6713683829552141466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1600.1", added "/usr/lib/libgtk-4.so.1.1600.3"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1600.1 to libgtk-4.so.1.1600.3
  /usr/lib/libgtk-4.so.1.1600.1 moved to /usr/lib/libgtk-4.so.1.1600.3

--===============6713683829552141466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 66935928 to 66962392 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1600.1", added "/usr/lib/.debug/libgtk-4.so.1.1600.3"
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 23092324 to 23100518 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-dev: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-doc: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PKGSIZE changed from 147267 to 147405 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 117910 to 117993 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 117987 to 118083 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PKGSIZE changed from 117245 to 117327 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PKGSIZE changed from 134866 to 134968 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PKGSIZE changed from 117361 to 117444 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGSIZE changed from 124605 to 124702 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PKGSIZE changed from 111943 to 112027 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 170186 to 170327 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PKGSIZE changed from 118326 to 118436 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PKGSIZE changed from 116998 to 117077 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PKGSIZE changed from 117210 to 117271 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PKGSIZE changed from 115220 to 115316 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PKGSIZE changed from 113234 to 113321 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 114585 to 114672 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PKGSIZE changed from 141925 to 142062 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PKGSIZE changed from 108517 to 108597 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 45613550 to 45623470 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-src: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4/gtk4: PKGSIZE changed from 17048099 to 17052195 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1600.1", added "/usr/lib/libgtk-4.so.1.1600.3"
packages/core2-64-poky-linux/gtk4/gtk4: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4: PKGV changed from 4.16.1 [default] to 4.16.3 [default]
packages/core2-64-poky-linux/gtk4: PV changed from "4.16.1" to "4.16.3"
packages/core2-64-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.16/gtk-4.16.1.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.16/gtk-4.16.3.tar.xz"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1600.1 to libgtk-4.so.1.1600.3
  /usr/lib/libgtk-4.so.1.1600.1 moved to /usr/lib/libgtk-4.so.1.1600.3

--===============6713683829552141466==--

